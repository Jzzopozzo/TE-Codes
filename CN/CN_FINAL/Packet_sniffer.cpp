#include <iostream>
#include <string>
#include <crafter.h>

using namespace std;
using namespace Crafter;

void PacketHandler(Packet* sniff_packet, void* user) 
{
	int ch;
	int FIN,SYN,RST,PSH,ACK,URG;

	RawLayer* raw_payload = sniff_packet->GetLayer<RawLayer>();
	
	
	if(raw_payload) 
	{
		
		cout << "[+] --------------------------PBMJ5233-------------------------------- [+]" << endl;
		cout<< "\n ";
		TCP* tcp_layer = sniff_packet->GetLayer<TCP>();
		IP* ip_layer = sniff_packet->GetLayer<IP>();
		
		
		do
		{
		
			cout<<"\n -------------------------------MENU------------------------------";
			cout<<"\n | 1. Print IP address information of sniffed Packet              |";
			cout<<"\n | 2. Print Port address information of sniffed Packet            |";
			cout<<"\n | 3. Print Packet Identifier information of sniffed Packet       |";
			cout<<"\n | 4. Print Packet size information of sniffed Packet             |";
			cout<<"\n | 5. Print TCP Flags of sniffed Packet                           |";
			cout<<"\n | 6. sniff next packet                                           |";
			cout<<"\n -------------------------------MENU------------------------------";
		
			cout<<"\n Enter your choice :";
			cin>>ch;
			cout<<"\n -----------------------------------------------------------------";
			
			switch(ch)
			{

				case 1:
					cout << "\n  Source IP     : "<<ip_layer->GetSourceIP()<<endl;
					cout << "\n  Destination IP: "<<ip_layer->GetDestinationIP()<<endl; 
					break;
				case 2:
					cout << "\n  Source Port      : "<<tcp_layer->GetSrcPort()<<endl;
					cout << "\n  Destination Port : "<<tcp_layer->GetDstPort()<<endl;			
					break;
				case 3:
					cout << "\n Sequece Number         : "<<tcp_layer->GetSeqNumber()<<endl;
					cout << "\n Acknowledgement Number : "<<tcp_layer->GetAckNumber()<<endl;
					break;
				case 4:
					cout << "\n Window Size      : "<<tcp_layer-> GetWindowsSize() <<endl;
					cout << "\n Check-sum        : "<<tcp_layer->GetCheckSum()<<endl;
					break;
				case 5:
					FIN=int(tcp_layer->GetFIN());
					SYN=int(tcp_layer->GetSYN());
					RST=int(tcp_layer->GetRST());
					PSH=int(tcp_layer->GetPSH());
					ACK=int(tcp_layer->GetACK());
					URG=int(tcp_layer->GetURG());
				
					cout << "\n -----TCP-Flags-----"<<endl;
					cout << "\n FIN               : "<<FIN<<endl;
					cout << "\n SYN               : "<<(SYN/2)<<endl;
					cout << "\n RST		   : "<<(RST/4)<<endl;
					cout << "\n PSH		   : "<<(PSH/8)<<endl;
					cout << "\n ACK		   : "<<(PSH/16)<<endl; 
					cout << "\n URG		   : "<<(PSH/32)<<endl;
					break;
			}
	
		}while(ch!=6);
		cout<<"\n ";
	}
}


int main() 
{		
	while(1)
	{
		string iface = "any";
		Sniffer sniff("tcp",iface,PacketHandler);

		sniff.Capture(1);
	}	
		
	return 0;
}
/*
res@res-HP-280-G2-MT-Legacy:~/Desktop/FINAL 1$ sudo su
[sudo] password for res: 
root@res-HP-280-G2-MT-Legacy:/home/res/Desktop/FINAL 1# g++ Packet_sniffer.cpp -lcrafter
root@res-HP-280-G2-MT-Legacy:/home/res/Desktop/FINAL 1# ./a.out
[+] --------------------------PBMJ5233-------------------------------- [+]

 
 -------------------------------MENU------------------------------
 | 1. Print IP address information of sniffed Packet              |
 | 2. Print Port address information of sniffed Packet            |
 | 3. Print Packet Identifier information of sniffed Packet       |
 | 4. Print Packet size information of sniffed Packet             |
 | 5. Print TCP Flags of sniffed Packet                           |
 | 6. sniff next packet                                           |
 -------------------------------MENU------------------------------
 Enter your choice :1

 -----------------------------------------------------------------
  Source IP     : 192.168.3.254

  Destination IP: 192.168.20.175

 -------------------------------MENU------------------------------
 | 1. Print IP address information of sniffed Packet              |
 | 2. Print Port address information of sniffed Packet            |
 | 3. Print Packet Identifier information of sniffed Packet       |
 | 4. Print Packet size information of sniffed Packet             |
 | 5. Print TCP Flags of sniffed Packet                           |
 | 6. sniff next packet                                           |
 -------------------------------MENU------------------------------
 Enter your choice :2

 -----------------------------------------------------------------
  Source Port      : 8090

  Destination Port : 55280

 -------------------------------MENU------------------------------
 | 1. Print IP address information of sniffed Packet              |
 | 2. Print Port address information of sniffed Packet            |
 | 3. Print Packet Identifier information of sniffed Packet       |
 | 4. Print Packet size information of sniffed Packet             |
 | 5. Print TCP Flags of sniffed Packet                           |
 | 6. sniff next packet                                           |
 -------------------------------MENU------------------------------
 Enter your choice :3

 -----------------------------------------------------------------
 Sequece Number         : 889786593

 Acknowledgement Number : 3481080958

 -------------------------------MENU------------------------------
 | 1. Print IP address information of sniffed Packet              |
 | 2. Print Port address information of sniffed Packet            |
 | 3. Print Packet Identifier information of sniffed Packet       |
 | 4. Print Packet size information of sniffed Packet             |
 | 5. Print TCP Flags of sniffed Packet                           |
 | 6. sniff next packet                                           |
 -------------------------------MENU------------------------------
 Enter your choice :4

 -----------------------------------------------------------------
 Window Size      : 237

 Check-sum        : 1773

 -------------------------------MENU------------------------------
 | 1. Print IP address information of sniffed Packet              |
 | 2. Print Port address information of sniffed Packet            |
 | 3. Print Packet Identifier information of sniffed Packet       |
 | 4. Print Packet size information of sniffed Packet             |
 | 5. Print TCP Flags of sniffed Packet                           |
 | 6. sniff next packet                                           |
 -------------------------------MENU------------------------------
 Enter your choice :5

 -----------------------------------------------------------------
 -----TCP-Flags-----

 FIN               : 0

 SYN               : 0

 RST		   : 0

 PSH		   : 0

 ACK		   : 0

 URG		   : 0

 -------------------------------MENU------------------------------
 | 1. Print IP address information of sniffed Packet              |
 | 2. Print Port address information of sniffed Packet            |
 | 3. Print Packet Identifier information of sniffed Packet       |
 | 4. Print Packet size information of sniffed Packet             |
 | 5. Print TCP Flags of sniffed Packet                           |
 | 6. sniff next packet                                           |
 -------------------------------MENU------------------------------
 Enter your choice :6

 -----------------------------------------------------------------
*/
