#-*- coding:utf-8 -*-
import re
import serial
import time
from socket import *

#tcp configure
HOST    = 'localhost'
PORT    = 17001
BUFSIZE = 1024
ADDR    = (HOST, PORT)
#open serial
ser     = serial.Serial("/dev/ttyUSB0", 115200)
SLTIME  = 0.1

def main():
	print('start:',ser)
	while True:
		#get char from buffer
		count = ser.inWaiting()
		try:
			tcpCliSock = socket(AF_INET, SOCK_STREAM)
			tcpCliSock.connect(ADDR)
			if count != 0:
				#read data
				recv = ser.read(count)
				str = recv[55:]
				pattern = re.compile(r"(?=UU).*(?=,\r)")
				res = pattern.match(str)
				if res:
					str_data = res.group()[2:]
					str_data = str_data + ",a"
					str_data = str_data + ",b"
					str_data = str_data + ",c"
					print("res:",str_data)
					if str_data:
						tcpCliSock.send(('%s\r\n' % str_data).encode())
			#sleep
			time.sleep(SLTIME)
		except IOError:
			print("Can't connect to server");
			time.sleep(SLTIME)
	tcpCliSock.close()
	
if __name__ == '__main__':
	try:
		main()
	except KeyboardInterrupt:
		#ser = None
		#if ser != None:
		print('error happened')
		#	ser.close()