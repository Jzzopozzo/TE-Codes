/*
					ASSIGNMENT No-C1
TEB- 02
TITLE: Write a Java program (using OOP features) to implement following scheduling algorithms:
FCFS , SJF (Preemptive), Priority (Non-Preemptive) and Round Robin (Preemptive)
*/
import java.io.*;
import java.util.*;

//for creating individual object of process
class Process
{
	int arrival_time=0,burst_time=0,priority=0,process_id=0,waiting_time=0,completed=0;
}

public class Schedule
{
	public static void main(String ags[])throws IOException
	{
		DataInputStream d=new DataInputStream(System.in);
		System.out.println("Enter the number of processes: ");
		int num=Integer.parseInt(d.readLine());
		int ch=0;
		Process p[]=new Process[10];
		do
		{	System.out.println("\n\n-----------------------------------MENU-----------------------------------");
			System.out.println("\n1. FCFS\t2. SJF\t3. Round Robin\t4. Exit");
			System.out.println("\n\nEnter your choice:");
			ch=Integer.parseInt(d.readLine());
			switch(ch)
			{
				case 1:
						p=get_process(num);
						FCFS(num,p);
						break;
				case 2:
						p=get_process(num);
						SJF(num,p);
						break;
				case 3:	
						p=get_process(num);
						RR(num,p);
						break;
				case 4:
						break;
				default:
						System.out.println("Invalid Choice..!!");
			}
		}while(ch!=4);
		
		
	}
	
	public static Process[] get_process(int num)throws IOException
	{
		DataInputStream d=new DataInputStream(System.in);
		Process p[]=new Process[10];
		for(int i=0;i<num;i++)
		{
			p[i]=new Process();
		}
		
		System.out.println("Enter the Process Details:\n");
		for(int i=0;i<num;i++)
		{
			System.out.println("Process ID:");
			p[i].process_id=Integer.parseInt(d.readLine());
			//System.out.println("Process Arrival Time:");
			//p[i].arrival_time=Integer.parseInt(d.readLine());
			System.out.println("Process Burst Time:");
			p[i].burst_time=Integer.parseInt(d.readLine());
		}
		return p;
	}

	public static void FCFS(int num,Process p[])
	{

		//Waiting Time
		int total_wait_time=0;
		p[0].waiting_time=0;
		for(int i=1;i<num;i++)
		{
			
			p[i].waiting_time=p[i-1].waiting_time+p[i-1].burst_time;
			total_wait_time+=p[i].waiting_time;
		}

		//Gantt Chart
		System.out.println("---------------------------");
		System.out.println("\tGANTT CHART");
		System.out.println("---------------------------");
		for(int i=0;i<num;i++)
		{
			System.out.print("p"+p[i].process_id+"|\t");
		}	
		System.out.println(" ");
		for(int i=0;i<num;i++)
		{
				System.out.print(p[i].waiting_time+" |\t");
		}
		System.out.println("\n---------------------------\n\n\n");
		

		System.out.println("--------------------------");
		System.out.println("PID\tWAITING TIME");
		System.out.println("--------------------------");
		for(int i=0;i<num;i++)
		{
			System.out.println("p"+i+"\t"+p[i].waiting_time);
		}
		System.out.println("--------------------------");
		System.out.println("\n\nTOTAL WAITING TIME= "+total_wait_time);
		float average_time=total_wait_time/num;	
		System.out.println("AVERAGE WAITING TIME= "+average_time);
	}
	
	

	
	public static void sort(int num,Process p[])	//Sorting Processes according to burst time
	{			
		Process temp;
		int i=0,j=0;
		for(i=0;i<num;i++)
			for(j=i+1;j<num;j++)
			{
				if(p[i].burst_time>p[j].burst_time)
				{
					temp=p[i];
					p[i]=p[j];
					p[j]=temp;
				}
			}
	}
	public static void SJF(int num,Process p[])
	{

		//System.out.println(get_shortest_job(num,p));
		int total_burst=0,waiting_time=0,total_waiting_time=0;		
		for(int i=0;i<num;i++)
		{
			total_burst+=p[i].burst_time;
		}
		System.out.println("-------------------------------------------------------");
		System.out.println("\t\t\tGANTT CHART");
		System.out.println("-------------------------------------------------------");
		
		
		sort(num,p);		//sort processes according to their burst
		p[0].waiting_time=0;
		for(int i=0;i<num;i++)
		{
			for(int j=0;j<p[i].burst_time;j++)
			{
				System.out.print("   P"+p[i].process_id+"\t");
				if(i!=num-1)
				{
					p[i+1].waiting_time++;	//to calculate waiting time
					total_waiting_time++;
				}
			}
		}
		p[num-1].waiting_time++;		
		total_waiting_time++;
		System.out.println("\n-------------------------------------------------------");
		
		for(int j=0;j<=total_burst;j++)
			System.out.print(j+"\t");	

		System.out.println("\n--------------------------");
		System.out.println("PID\tWAITING TIME");
		System.out.println("--------------------------");
		for(int i=0;i<num;i++)
		{
			System.out.println("p"+p[i].process_id+"\t"+p[i].waiting_time);
		}
		
		System.out.println("--------------------------");
		System.out.println("\n\nTOTAL WAITING TIME= "+total_waiting_time);
		float average_time=total_waiting_time/num;	
		System.out.println("AVERAGE WAITING TIME= "+average_time);	

	}
	
	public static void RR(int num,Process p[])throws IOException //without arrival time 
	{
		DataInputStream d=new DataInputStream(System.in);
		int wait[]=new int[10];
		int total_burst=0,waiting_time=0;		
		for(int i=0;i<num;i++)
		{
			total_burst+=p[i].burst_time;
		}
		int temp1=total_burst;
		System.out.println("Enter the Time Quantam=");
		int TM=Integer.parseInt(d.readLine());
		int temp=TM;
		
		System.out.println("-------------------------------------------------------");
		System.out.println("\t\t\tGANTT CHART");
		System.out.println("-------------------------------------------------------");
		wait[0]=0;
		while(total_burst>0)
		{
			for(int i=0;i<num;i++)
			{
				while(TM>0 && p[i].burst_time>0)
				{
					System.out.print("   P"+i+"\t");
					p[i].burst_time--;
					total_burst--;
					TM--;	
					if(p[i].burst_time>0)
						wait[i+1]=wait[i]+1;
				}
				TM=temp;
			}	
		}	
		System.out.println();
		for(int j=0;j<=temp1;j++)
			System.out.print(j+"\t");
		
		/*System.out.println("\n--------------------------");
		System.out.println("PID\tWAITING TIME");
		System.out.println("--------------------------");
		for(int i=0;i<num;i++)
		{
			System.out.println("p"+i+"\t"+wait[i]);
		}
		System.out.println("--------------------------");
		*/
		
	}
}

/*
OUTPUT:
akshay@akshay-1011PX:~/Desktop/Akshay_SPOS/Turn1$ java Schedule 
Enter the number of processes: 
3


-----------------------------------MENU-----------------------------------

1. FCFS	2. SJF	3. Round Robin	4. Exit


Enter your choice:
1
Enter the Process Details:

Process ID:
1
Process Burst Time:
3
Process ID:
2
Process Burst Time:
2
Process ID:
3
Process Burst Time:
3
---------------------------
	GANTT CHART
---------------------------
p1|	p2|	p3|	 
0 |	3 |	5 |	
---------------------------



--------------------------
PID	WAITING TIME
--------------------------
p0	0
p1	3
p2	5
--------------------------


TOTAL WAITING TIME= 8
AVERAGE WAITING TIME= 2.0


-----------------------------------MENU-----------------------------------

1. FCFS	2. SJF	3. Round Robin	4. Exit


Enter your choice:
2
Enter the Process Details:

Process ID:
1
Process Burst Time:
2
Process ID:
2
Process Burst Time:
3
Process ID:
3
Process Burst Time:
1
-------------------------------------------------------
			GANTT CHART
-------------------------------------------------------
   P3	   P1	   P1	   P2	   P2	   P2	
-------------------------------------------------------
0	1	2	3	4	5	6	
--------------------------
PID	WAITING TIME
--------------------------
p3	0
p1	1
p2	3
--------------------------


TOTAL WAITING TIME= 4
AVERAGE WAITING TIME= 1.0


-----------------------------------MENU-----------------------------------

1. FCFS	2. SJF	3. Round Robin	4. Exit


Enter your choice:
3
Enter the Process Details:

Process ID:
1
Process Burst Time:
3
Process ID:
2
Process Burst Time:
2
Process ID:
3
Process Burst Time:
1
Enter the Time Quantam=
2
-------------------------------------------------------
			GANTT CHART
-------------------------------------------------------
   P0	   P0	   P1	   P1	   P2	   P0	
0	1	2	3	4	5	6	

-----------------------------------MENU-----------------------------------

1. FCFS	2. SJF	3. Round Robin	4. Exit


Enter your choice:
4

*/
