import socket
import sys

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

sock.bind(('localhost',23000))

sock.listen(1)

clisock, (ip,port) = sock.accept()

while True:    	
	data = clisock.recv(16)

	if "stop." in data:
		break
	else:			
		print "client: " + data
	
	data = raw_input("you: ")
	clisock.send(data)
	if "stop." in data:
		break
sock.close()
            
'''
res@res-HP-280-G2-MT-Legacy:~/Desktop/FINAL 1/assignment 14/tcp peer 2 peer$ sudo su
[sudo] password for res: 
root@res-HP-280-G2-MT-Legacy:/home/res/Desktop/FINAL 1/assignment 14/tcp peer 2 peer# python pptcpserv.py 
client: hi from client
you: hello!
client: hi
you: STOP.
root@res-HP-280-G2-MT-Legacy:/home/res/Desktop/FINAL 1/assignment 14/tcp peer 2 peer# 

'''
