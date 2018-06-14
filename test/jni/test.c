/**test file of Scheduling Algorithm Change**/

#include<stdlib.h>
#include<stdio.h>
#include<unistd.h>
#include<sched.h>


int main()
{
	while(1){
	printf("Please input the choice of Scheduling Algorithm 0-NORMAL,1-FIFO,2-RR,6-WRR");
	int algo = 0;
	scanf("%d",&algo);
	
	printf("Current algorithm is");
	switch(algo)
	{
	case 0:
		printf("NORMAL\n");
		break;
	case 1:
		printf("FIFO\n");
		break;
	case 2:
		printf("RR\n");
		break;
	case 6:
		printf("WRR\n");
		break;
	default:
		perror("NO such algorithm\n");
		exit(1);

	}
	

	int pid = 0;
//	pid = getpid();
	printf("The process pid is");
	scanf("%d",&pid);
	printf("Current pid is %d\n",pid);


	struct sched_param param;	
	int prio = 0;

	if(algo == 1 || algo == 2){
	printf("Set process priority(1-99)");
	scanf("%d",&prio);
	if(prio< 1 || prio>=100)
	{
		perror("prio error");
		exit(0);
	}

	printf("Current scheduler's priority is %d\n",prio);

	param.sched_priority = prio;
	}

	else{
	param.sched_priority = 0;
	}
	
	printf("pre scheduler:%d\n",sched_getscheduler(pid));//temp
	
	if(sched_setscheduler(pid,algo,&param) == -1)
	{
		perror("set sched error");
		exit(1);
	}

	printf("cur_scheduler:%d",sched_getscheduler(pid));
//	printf("cur_scheduler:%d\n",sched_getscheduler(0));

	}
}


