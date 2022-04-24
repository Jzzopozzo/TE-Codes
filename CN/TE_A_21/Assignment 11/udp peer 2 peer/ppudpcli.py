#Write a program using UDP sockets for wired network to implement
#a. Peer to Peer Chat
#b. Multiuser Chat
#Demonstrate the packets captured traces using Wireshark Packet Analyzer Tool for peer to
#peer mode.

#Name:-Anuja Chandrashekhar Dixit.
#Class:-TE-A
#Roll. No:-21



import socket
import sys

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.sendto("Hi from client", ('', 10000))
while True:    	
	msg, (ip, port) = sock.recvfrom(100)

	if "stop." in msg:
		break
	else:			
		print "server: " + msg
	
	msg = raw_input("you: ")
	sock.sendto(msg, (ip,port))
	if "stop." in msg:
		break
sock.close()
'''output:
res@res-HP-280-G2-MT-Legacy:~/Desktop/udp peer 2 peer$ sudo su
[sudo] password for res: 
root@res-HP-280-G2-MT-Legacy:/home/res/Desktop/udp peer 2 peer# python ppudpcli.py
server: Hello from server
you: hii
server: how r u
you: good


'''

