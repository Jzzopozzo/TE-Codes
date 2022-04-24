/*

Problem Statement- Write a program for error detection and correction for 7/8 bits ASCII codes using Hamming
Codes or CRC. Demonstrate the packets captured traces using Wireshark Packet Analyzer
Tool for peer to peer mode.

#Name:-Anuja Chandrashekhar Dixit.
#Class:-TE-A
#Roll. No:-21


*/


#include<iostream>
using namespace std;
int main()
{
	int mx[30], gx[10], lenm,i, j, k,leng;
	
	cout<<"\nEnter the size of message: ";
	cin>>lenm;
	cout<<"\nEnter the message: ";
	for(i=0;i<lenm;i++)
	{
		cin>>mx[i];
	}
	
	cout<<"\nEnter the size of generator: ";
	cin>>leng;
	cout<<"\nEnter the generator: ";
	for(i=0;i<leng;i++)
	{
		cin>>gx[i];
	}
	//append 0's to the m(x)
	int n=leng-1;
	int temp[20];
	for(i=0;i<lenm;i++)
	{
		temp[i]=mx[i];
	}
	for(i=lenm;i<lenm+n;i++)
	{
		temp[i]=0;
	}
	//lenm+=n;
	cout<<"\nMessage after appending 0's: ";
	for(i=0;i<lenm+n;i++)
	{
		cout<<temp[i];
	}
	cout<<"\nGenerator: ";
	for(i=0;i<leng;i++)
	{
		cout<<gx[i];
	}
	
	for(i=0;i<lenm;i++)
	{
		j=0;
		k=i;
		if(temp[k]>=gx[j])
		{
			for(j=0;j<leng;j++)
			{
				
			}
		}
	}
	
	
	
	return 0;
}
