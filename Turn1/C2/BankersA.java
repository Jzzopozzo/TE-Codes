

import java.io.*;
import java.util.*;



class BankersA{

	public static void main(String args[]){
	Scanner sc=new Scanner(System.in);
	
	int n,m,i,j;
	
	System.out.println("Enter the no of process and resources:-");
	n=sc.nextInt();            //process
	m=sc.nextInt();		  //resources
	
	
	int allocation[][]=new int[n][m];
	int max[][]=new int[n][m];
	int available[]=new int[m];
	int need[][]=new int[n][m];
	
	System.out.println("Enter Allocation Matrix:-");
	
	for(i=0;i<n;i++)
	{
		for(j=0;j<m;j++)
		{
			allocation[i][j]=sc.nextInt();
		}
	}
	
	System.out.println("Enter Max Matrix:-");
	
	for(i=0;i<n;i++)
	{
		for(j=0;j<m;j++)
		{
			max[i][j]=sc.nextInt();
		}
	}
	
	System.out.println("Enter Avaiable Matrix:-");
	
	
	for(j=0;j<m;j++)
	{
		available[j]=sc.nextInt();
	}
	
	//calculate need matrix
	System.out.println("----------------------------------------------");
	for(i=0;i<n;i++)
	{
		for(j=0;j<m;j++)
		{
			need[i][j]=max[i][j] - allocation[i][j];
			System.out.print("  "+need[i][j]);
		}
		System.out.println("\n");
	}
	
	
	
	int finish[]=new int[n];
	
	for(j=0;j<n;j++)
	{
		finish[j]=0;
	}
	
	int work[]=new int[m];
	
	for(j=0;j<m;j++)
	{
		work[j]=available[j];
	}
	
	int temp=0,cnt=0;
	i=0;
	
	while(i<n)   //i<5
	{
		if(finish[i]==0)
		{
			for(j=0;j<m;j++)   //j<4
			{
				if(need[i][j] > work[j])
				{
					temp=1;
				}
			}
			
			if(temp==1)
			{	
				i=i+1;
				temp=0;
			}
			else
			{
				for(j=0;j<m;j++)
				{			
					work[j]=work[j]+allocation[i][j];
					
				}
				finish[i]=1;
				System.out.println("P"+(i+1));
				i=i+1;
				cnt++;
			} 
		} 
		else
			i=i+1; 
		
		if(i==n)
		{
			for(int k=0;k<n;k++)
			{
				if(finish[k]==0)
				{
					i=k;
					break;
				}
			}
		}
		
		if(cnt==n)
			break;
		
		
	}//while
	
	for(i=0;i<n;i++)
	{
		System.out.print(" "+finish[i]);
		
	}
	
	
	
	int flag=0;
	for(j=0;j<n;j++)
	{
		if(finish[j]==0)
		{
			flag=1;
			break;	
		}
	}  
	
	if(flag==1)
		System.out.println("System is in Unsafe state");
	else
		System.out.println("System is in Safe state");
	
	}//main
}
