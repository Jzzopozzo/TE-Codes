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
sock.bind(('', 10000))

msg, (ip, port) = sock.recvfrom(100)
print "client connected to ip: " + ip + " and port: " + str(port)
print "received message: " + msg
sock.sendto("Hello from server", (ip,port))



while True:    	
	msg, (ip, port) = sock.recvfrom(100)
	print "client connected to ip: " + ip + " and port: " + str(port)
	if "stop." in msg:
		break
	else:			
		print "client: " + msg
	
	msg = raw_input("you: ")
	sock.sendto(msg, (ip,port))
	if "stop." in msg:
		break
sock.close()
        
'''output:
res@res-HP-280-G2-MT-Legacy:~/Desktop/udp peer 2 peer$ sudo su
[sudo] password for res: 
root@res-HP-280-G2-MT-Legacy:/home/res/Desktop/udp peer 2 peer# python ppudpserv.py
client connected to ip: 127.0.0.1 and port: 55060
received message: Hi from client
client connected to ip: 127.0.0.1 and port: 55060
client: hii
you: how r u
client connected to ip: 127.0.0.1 and port: 55060
client: good
you: 

'''

