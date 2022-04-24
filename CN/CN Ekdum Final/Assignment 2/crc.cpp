#include<iostream>
#include<stdlib.h>
using namespace std;

int main()
{
	int data[20],gen[20];
	int dsize,gsize,rsize;
	int i,j,k,rs;
	
	cout<<"\nEnter the size of data: ";
	cin>>dsize;
	cout<<"\nEnter the data: ";
	for(i=0;i<dsize;i++)
	{
		cin>>data[i];
	}
	
	cout<<"\nEnter the size of generator: ";
	cin>>gsize;
	cout<<"\nEnter the generator: ";
	for(i=0;i<gsize;i++)
	{
		cin>>gen[i];
	}
	
	cout<<"\nData: ";
	for(i=0;i<dsize;i++)	
	{
		cout<<data[i];
	}
	
	cout<<"\nGenerator: ";
	for(i=0;i<gsize;i++)	
	{
		cout<<gen[i];
	}
	
	rs=gsize-1;
	cout<<"\n Number of 0's to be appended: "<<rs;
  for (i=dsize;i<dsize+rs;i++)
  {
  	data[i]=0;
  }
  int temp[20];
  for(i=0;i<20;i++)
  {
  	temp[i]=data[i];
  }
 
 	cout<<"\n Message after appending 0's :";
  for(i=0; i<dsize+rs;i++)
  {
  	cout<<temp[i];
  }
 
//Division
  for(i=0;i<dsize;i++)
  {
  	j=0;
    k=i;
  //check whether it is divisible or not
    if (temp[k]>=gen[j])
    {
    	for(j=0,k=i;j<gsize;j++,k++)
      {
      	if((temp[k]==1 && data[j]==1) || (temp[k]==0 && data[j]==0))
        {
        	temp[k]=0;
        }
        else
        {
        	temp[k]=1;
        }
     	}
    }
  }

//CRC
  int crc[15];
  for(i=0,j=dsize;i<rs;i++,j++)
  {
  	crc[i]=temp[j];
  }
 	cout<<"\n CRC bits: ";
  for(i=0;i<rs;i++)
  {
  	cout<<crc[i];
  }
 	cout<<"\n Transmitted Frame: ";
 	int tf[15];
  for(i=0;i<dsize;i++)
  {
  	tf[i]=data[i];
  }
  for(i=dsize,j=0;i<dsize+rs;i++,j++)
  {
  	tf[i]=crc[j];
 	}
 	for(i=0;i<dsize+rs;i++)
  {
  	cout<<tf[i];
  }
 	cout<<"\n Receiver side : ";
  cout<<"\n Received Frame: ";
  for(i=0;i<dsize+rs;i++)
 	{
  	cout<<tf[i];
  }
 	for(i=0;i<dsize+rs;i++)
 	{
  	temp[i]=tf[i];
  }
 
//Division
  for(i=0;i<dsize+rs;i++)
  {
  	j=0;
    k=i;
    if (temp[k]>=gen[j])
    {
    	for(j=0,k=i;j<gsize;j++,k++)
      {
      	if((temp[k]==1 && gen[j]==1) || (temp[k]==0 && gen[j]==0))
        {
        	temp[k]=0;
        }
        else
        {
        	temp[k]=1;
        }
     	}
    }
  }
 	cout<<"\n Remainder: ";
  int rrem[15];
  sfor (i=dsize,j=0;i<dsize+rs;i++,j++)
  {
   	rrem[j]= temp[i];
  }
  for(i=0;i<rs;i++)
  {
  	cout<<rrem[i];
  }
 	int flag=0;
  for(i=0;i<rs;i++)
  {
  	if(rrem[i]!=0)
    {
    	flag=1;
    }
  }
 	if(flag==0)
  {
  	cout<<"\nSince Remainder Is 0 Hence Message Transmitted From Sender To Receiver Is Correct";
  }
  else
  {
  	cout<<"\nSince Remainder Is Not 0 Hence Message Transmitted From Sender To Receiver Contains Error";
  }
return 0;
}   	
