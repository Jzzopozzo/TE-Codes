#Write a program for DNS lookup. Given an IP address input, it should return URL and vice-
#versa.

#Name:-Anuja Chandrashekhar Dixit.
#Class:-TE-A
#Roll. No:-21


import socket
choose=True
while choose:

	print("\nMenu\n(1)Get Host by Name \n(2)Get Host by Address\n(3)Quit")
	choose=raw_input("Enter the choice ")
	
	if choose=="1":
	        add=raw_input("Enter host name: ")
		addr1 = socket.gethostbyname(add)
		print(addr1)
		
	elif choose=="2":
	        host_add=raw_input("Enter host address: ")
		addr3=socket.gethostbyaddr(host_add)
		print(addr3)
		
        elif choose=="3":
		exit()	
		
        else:
        	print("Invalid choice, please choose again")
        	print("\n")


