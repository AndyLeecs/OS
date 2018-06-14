/** to evaluate the performance of the algorithms using counter**/
#include<stdlib.h>
#include<stdio.h>
#include<unistd.h>
#include<sched.h>
#include<sys/time.h>

void delay(){
	int i;
	for(i = 0 ; i < 3000000000;i++);
}
void getInterval(int i){
	struct timeval start;
        struct timeval end;
        unsigned long diff;

        gettimeofday(&start,NULL);
        delay();
        gettimeofday(&end,NULL);
	diff = 1000000 * (end.tv_sec-start.tv_sec)+ end.tv_usec-start.tv_usec;
        printf("the difference is %ld for sched %d\n",diff,i);
}

int main()
{
	int i;
	int sched[4] = {0,1,2,6};
	pid_t pid[4] = {0,0,0,0};
	pid_t childpid;
	for(i = 0; i < 4; i++)
	{
		childpid = fork();
		if(0 == childpid)
		{	
			pid[i] = getpid();
			printf("for pid %d\n",pid[i]);
			printf("for scheduler %d\n",(sched[i]));
			struct sched_param param;
			if(sched[i] == 1 || sched[i] == 2)
			{
				/**set rt prio to 1**/
				param.sched_priority = 1;
			}
			else
			{
				param.sched_priority = 0;
			}
			sched_setscheduler(pid[i],sched[i],&param);
			getInterval(sched[i]);
			exit(EXIT_SUCCESS);
		}	
	}
	int j;
	for(j = 0 ; j < 4 ; j++)
	{
		waitpid(pid[j],NULL,0);
	}
	exit(EXIT_SUCCESS);
}
