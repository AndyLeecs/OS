/*
 * Weighted Round-Robin Policy Scheduling Class
 */

#include "sched.h"

#include <linux/slab.h>

/*
 *Get the foreground/background information of a task
 *
 */
/**TODO:revise core.c, delete irrelevant fields**/
/**no complete support of group**/
/**no support of multi CPU**/

#define PATH_MAX 256


static char group_path[PATH_MAX];
static char *task_group_path(struct task_group *tg)
{


	if (autogroup_path(tg, group_path, PATH_MAX))
		return group_path;

	/*
	 * May be NULL if the underlying cgroup isn't fully-created yet
	 */
	if (!tg->css.cgroup) {
		group_path[0] = '\0';
		return group_path;
	}
	cgroup_path(tg->css.cgroup, group_path, PATH_MAX);
	return group_path;
}


static void print_kernel(struct task_struct* p)
{
	printk("I am a %d task now!\n",p->policy);
	printk("%s",task_group_path(task_group(p)));
	printk("pid is %d\n",p->pid);
	printk("process name is %14s",p->comm);
}

void init_wrr_rq(struct wrr_rq *wrr_rq, struct rq* rq)
{
	INIT_LIST_HEAD(&wrr_rq->list);
	wrr_rq->wrr_time = 0;
	wrr_rq->wrr_runtime = 0;
}

#define wrr_entity_is_task(wrr_se) (1)

static inline struct task_struct *wrr_task_of(struct sched_wrr_entity *wrr_se)
{
	return container_of(wrr_se, struct task_struct, wrr);
}

static inline struct rq *rq_of_wrr_rq(struct wrr_rq *wrr_rq)
{
	return container_of(wrr_rq, struct rq, wrr);
}

static inline struct wrr_rq *wrr_rq_of_se(struct sched_wrr_entity *wrr_se)
{
	struct task_struct *p = wrr_task_of(wrr_se);
	struct rq *rq = task_rq(p);

	return &rq->wrr;
}
static void update_curr_wrr(struct rq *rq)
{
	struct task_struct *curr = rq->curr;
	u64 delta_exec;

	if (curr->sched_class != &wrr_sched_class)
		return;

	delta_exec = rq->clock_task - curr->se.exec_start;
	if (unlikely((s64)delta_exec < 0))
		delta_exec = 0;

	schedstat_set(curr->se.statistics.exec_max,
		      max(curr->se.statistics.exec_max, delta_exec));

	 curr->se.sum_exec_runtime += delta_exec;
	 account_group_exec_runtime(curr, delta_exec);

	 curr->se.exec_start = rq->clock_task;
	 cpuacct_charge(curr, delta_exec);
}
#define for_each_sched_wrr_entity(wrr_se) \
	for (; wrr_se; wrr_se = NULL)

/*
 * Adding/removing a task to/from the list:
 */
static void __enqueue_wrr_entity(struct sched_wrr_entity *wrr_se, bool head)
{
	struct wrr_rq *wrr_rq = wrr_rq_of_se(wrr_se);
	struct list_head *list = &wrr_rq->list;

	if (head)
		list_add(&wrr_se->run_list, list);
	else
		list_add_tail(&wrr_se->run_list, list);

	wrr_rq->wrr_nr_running++;
}

static void enqueue_wrr_entity(struct sched_wrr_entity *wrr_se, bool head)
{
	for_each_sched_wrr_entity(wrr_se)
		__enqueue_wrr_entity(wrr_se, head);
}

static void
enqueue_task_wrr(struct rq *rq, struct task_struct *p, int flags)
{
	struct sched_wrr_entity *wrr_se = &p->wrr;

	if (flags & ENQUEUE_WAKEUP)
		wrr_se->timeout = 0;

	enqueue_wrr_entity(wrr_se, flags & ENQUEUE_HEAD);
	
	print_kernel(p);

	inc_nr_running(rq);
}

static void __dequeue_wrr_entity(struct sched_wrr_entity *wrr_se)
{
	
	struct wrr_rq *wrr_rq = wrr_rq_of_se(wrr_se);
	
	struct list_head *list = &wrr_rq->list;

	list_del_init(&wrr_se->run_list);

	wrr_rq->wrr_nr_running--;

}
static void dequeue_wrr_entity(struct sched_wrr_entity *wrr_se)
{
	for_each_sched_wrr_entity(wrr_se) {
		__dequeue_wrr_entity(wrr_se);		
	}
}



static void dequeue_task_wrr(struct rq *rq, struct task_struct *p, int flags)
{
	struct sched_wrr_entity *wrr_se = &p->wrr;

	update_curr_wrr(rq);

	dequeue_wrr_entity(wrr_se);

	dec_nr_running(rq);
}
static inline int on_wrr_rq(struct sched_wrr_entity *wrr_se)
{
	return !list_empty(&wrr_se->run_list);
}
static void
requeue_wrr_entity(struct wrr_rq *wrr_rq, struct sched_wrr_entity *wrr_se, int head)
{
	if (on_wrr_rq(wrr_se)) {

		struct list_head *list = &wrr_rq->list;

		if (head)
			list_move(&wrr_se->run_list, list);
		else
			list_move_tail(&wrr_se->run_list, list);
	}
}

static void requeue_task_wrr(struct rq *rq, struct task_struct *p, int head)
{
	struct sched_wrr_entity *wrr_se = &p->wrr;
	struct wrr_rq *wrr_rq;

	for_each_sched_wrr_entity(wrr_se) {
		wrr_rq = wrr_rq_of_se(wrr_se);
		requeue_wrr_entity(wrr_rq, wrr_se, head);
	}
}

static void yield_task_wrr(struct rq*rq)
{
	requeue_task_wrr(rq,rq->curr,0);
}

static int
select_task_rq_wrr(struct task_struct *p, int sd_flag, int flags)
{
	return task_cpu(p);
}


static void check_preempt_curr_wrr(struct rq*rq, struct task_struct *p, int flags)
{
	
}

static struct sched_wrr_entity *pick_next_wrr_entity(struct rq *rq,
						   struct wrr_rq *wrr_rq)
{
	struct list_head *list = &wrr_rq->list;
	struct sched_wrr_entity* next = list_entry(list->next, struct sched_wrr_entity, run_list);

	return next;
}

static struct task_struct * _pick_next_task_wrr(struct rq*rq)
{
	struct sched_wrr_entity *wrr_se;
	struct task_struct *p;
	struct wrr_rq *wrr_rq;

	wrr_rq = &rq->wrr;

	if (!wrr_rq->wrr_nr_running)
		return NULL;

			wrr_se = pick_next_wrr_entity(rq, wrr_rq);
		BUG_ON(!wrr_se);

	p = wrr_task_of(wrr_se);
	p->se.exec_start = rq->clock_task;

	return p;
}

static struct task_struct *pick_next_task_wrr(struct rq *rq)
{
	struct task_struct *p = _pick_next_task_wrr(rq);
	return p;
}

static void put_prev_task_wrr(struct rq *rq, struct task_struct *p)
{
	update_curr_wrr(rq);
	p->se.exec_start = 0;
}

static void set_cpus_allowed_wrr(struct task_struct *p,
				const struct cpumask *new_mask)
{
}

static void rq_online_wrr(struct rq *rq)
{
}

static void rq_offline_wrr(struct rq *rq)
{
}

static void pre_schedule_wrr(struct rq *rq, struct task_struct *prev)
{
}

static void post_schedule_wrr(struct rq *rq)
{
}

static void task_woken_wrr(struct rq *rq, struct task_struct *p)
{
}

static void switched_from_wrr(struct rq *rq, struct task_struct *p)
{
}
void free_wrr_sched_group(struct task_group *tg) { }

int alloc_wrr_sched_group(struct task_group *tg, struct task_group *parent)
{
	return 1;
}
static void
prio_changed_wrr(struct rq *rq, struct task_struct *p, int oldprio)
{
}

static void switched_to_wrr(struct rq *rq, struct task_struct *p)
{	
	print_kernel(p);

	if (p->on_rq && rq->curr != p) {
		if (!rt_task(rq->curr)){
			struct task_struct *p = rq->curr;
			set_tsk_need_resched(p);		
		}
			
	}
}
#ifdef CONFIG_CGROUP_SCHED
static unsigned int get_rr_interval_wrr(struct rq *rq, struct task_struct *task)
{
	if (task->policy == SCHED_WRR)
	{
		if(strcmp(task_group_path(task_group(task)),"/"))
			return WRR_BACK_TIMESLICE;
		else
			return WRR_FORE_TIMESLICE;

	}
	else
		return 0;
}
#endif

static void watchdog(struct rq *rq, struct task_struct *p)
{
	unsigned long soft, hard;
	
	soft = task_rlimit(p, RLIMIT_RTTIME);
	hard = task_rlimit_max(p, RLIMIT_RTTIME);
	
	if (soft != RLIM_INFINITY) {
		unsigned long next;
		
		p->wrr.timeout++;
		next = DIV_ROUND_UP(min(soft, hard), USEC_PER_SEC/HZ);
		if (p->wrr.timeout > next)
			p->cputime_expires.sched_exp = p->se.sum_exec_runtime;
	}
}

static void task_tick_wrr(struct rq *rq, struct task_struct *p, int queued)
{

	struct sched_wrr_entity *wrr_se = &p->wrr;

	update_curr_wrr(rq);
	watchdog(rq,p);

	print_kernel(p);

	if (p->policy != SCHED_WRR)
		return;

	if (--p->wrr.time_slice)
		return;
#ifdef CONFIG_CGROUP_SCHED
	p->wrr.time_slice = get_rr_interval_wrr(rq,p);
#endif
	/*
	 * Requeue to the end of queue if we (and all of our ancestors) are the
	 * only element on the queue
	 */
	for_each_sched_wrr_entity(wrr_se) {
		if (wrr_se->run_list.prev != wrr_se->run_list.next) {
			requeue_task_wrr(rq, p, 0);
			set_tsk_need_resched(p);
			return;
		}
	}
}

static void set_curr_task_wrr(struct rq *rq)
{
	struct task_struct *p = rq->curr;
	p->se.exec_start = rq->clock_task;
	print_kernel(p);



}

#ifdef CONFIG_CGROUP_SCHED
/*
 * called on fork with the child task as argument from the parent's context
 *  - child not yet on the tasklist
 *  - preemption disabled
 */
static void task_fork_wrr(struct task_struct *p)
{
	struct wrr_rq *wrr_rq;
	struct sched_wrr_entity *wrr_se = &p->wrr, *curr;
	int this_cpu = smp_processor_id();
	struct rq *rq = this_rq();
	unsigned long flags;

	raw_spin_lock_irqsave(&rq->lock, flags);

	update_rq_clock(rq);

	curr = &rq->curr->wrr;
	wrr_rq = curr->wrr_rq;

	rcu_read_lock();
	__set_task_cpu(p, this_cpu);
	rcu_read_unlock();

	update_curr_wrr(rq);

	if (curr)
		wrr_se->time_slice = curr->time_slice;


	raw_spin_unlock_irqrestore(&rq->lock, flags);
}
#endif
const struct sched_class wrr_sched_class = {
	.next			= &fair_sched_class,	
	.enqueue_task		= enqueue_task_wrr,	/*R*/
	.dequeue_task		= dequeue_task_wrr,	/*R*/
	.yield_task		= yield_task_wrr,	/*R*/

	.check_preempt_curr	= check_preempt_curr_wrr,

	.pick_next_task		= pick_next_task_wrr,	/*R*/
	.put_prev_task		= put_prev_task_wrr,	/*R*/

	.task_fork		= task_fork_wrr,	/*R*//*TODO:not in rt*/

#ifdef CONFIG_SMP
	.select_task_rq		= select_task_rq_wrr,

	.set_cpus_allowed       = set_cpus_allowed_wrr,
	.rq_online              = rq_online_wrr,
	.rq_offline             = rq_offline_wrr,
	.pre_schedule		= pre_schedule_wrr,
	.post_schedule		= post_schedule_wrr,
	.task_woken		= task_woken_wrr,
	.switched_from		= switched_from_wrr,
#endif

	.set_curr_task          = set_curr_task_wrr,	/*R*/
	.task_tick		= task_tick_wrr,	/*R*/

	.get_rr_interval	= get_rr_interval_wrr,	/*R*/

	.prio_changed		= prio_changed_wrr,
	.switched_to		= switched_to_wrr,	/*R*/
};


