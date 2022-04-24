import socket
import sys

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

sock.connect(('127.0.0.1',23000))

sock.send("hi from client")

while True:
	
	data = sock.recv(16)
	if "stop." in data:
		break
	else:			
		print "server: " + data

	data = raw_input("you: ")
	sock.send(data)
	if "stop." in data:
		break
sock.close()


'''
res@res-HP-280-G2-MT-Legacy:~/Desktop/FINAL 1/assignment 14/tcp peer 2 peer$ sudo su
[sudo] password for res: 
root@res-HP-280-G2-MT-Legacy:/home/res/Desktop/FINAL 1/assignment 14/tcp peer 2 peer# python pptcpcli.py 
server: hello!
you: hi
server: STOP.
you: stop.
root@res-HP-280-G2-MT-Legacy:/home/res/Desktop/FINAL 1/assignment 14/tcp peer 2 peer# 


'''

