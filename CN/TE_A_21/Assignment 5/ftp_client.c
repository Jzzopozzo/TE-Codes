/*

Problem Statement- Write a program using UDP Sockets to enable file transfer (Script, Text, Audio and Video
one file each) between two machines. Demonstrate the packets captured traces using
Wireshark Packet Analyzer Tool for peer to peer mode.


#Name:-Anuja Chandrashekhar Dixit.
#Class:-TE-A
#Roll. No:-21




*/

#include<stdio.h>
#include<stdlib.h>
#include<sys/socket.h>
#include<netinet/in.h>
int main()
{
FILE *fp;
int csd,n,ser,s,cli,cport,newsd;
char name[100],rcvmsg[100],rcvg[100],fname[100];
struct sockaddr_in servaddr;
printf("Enter the port");
scanf("%d",&cport);
csd=socket(AF_INET,SOCK_STREAM,0);
if(csd<0)
{
printf("Error....\n");
exit(0);
}
else
printf("Socket is created\n");
servaddr.sin_family=AF_INET;
servaddr.sin_addr.s_addr=htonl(INADDR_ANY);
servaddr.sin_port=htons(cport);
if(connect(csd,(struct sockaddr *)&servaddr,sizeof(servaddr))<0)
printf("Error in connection\n");
else
printf("connected\n");
printf("Enter the existing file name\t");
scanf("%s",name);
printf("Enter the new file name\t");
scanf("%s",fname);
fp=fopen(fname,"w");
send(csd,name,sizeof(name),0);
while(1)
{
s=recv(csd,rcvg,100,0);
rcvg[s]='\0';
if(strcmp(rcvg,"error")==0)
printf("File is not available\n");
if(strcmp(rcvg,"completed")==0)
{
printf("File is transferred........\n");
fclose(fp);
close(csd);
break;
}
else
fputs(rcvg,stdout);
fprintf(fp,"%s",rcvg);
}
}









/*
OUTPUT
SERVER SIDE
$ cc ftpserver.c
$ ./a.out
Enter the port address 2100
Socket is created
Binded
Accepted
$

CLIENT SIDE
$ cc ftpclient.c
$ ./a.out
Enter the port2100
Socket is created
connected
Enter the existing file name savee.txt
Enter the new file name savee1.txt
Saveetha Engineering College Welcomes you!
File is transferred........
$ 

*/
