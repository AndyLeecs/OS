/*
 * Weighted Round-Robin Policy Scheduling Class
 */

#include "sched.h"

#include <linux/slab.h>

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
