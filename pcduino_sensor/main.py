#-*- coding:utf-8 -*-
import re
import serial
import time
from adc import analog_read
from socket import *

#tcp configure
HOST    = 'localhost'
PORT    = 17001
BUFSIZE = 1024
ADDR    = (HOST, PORT)
#open serial
ser     = serial.Serial("/dev/ttyUSB0", 115200)
SLTIME  = 1

def setup():
	print("read channel ADC2 value ,the V-REF = 3.3V")
	print('start:',ser)

def main():
	while True:
		#get char from buffer
		count = ser.inWaiting()
		value = analog_read(2)
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
					str_data = str_data + ","+"%i" %value
					str_data = str_data + ",79A14692-4481-4615-B6D8-27C07E13F514"
					str_data = str_data + ",7C399122-AA8C-4E2C-8792-89B51C0DD447"
					str_data = str_data + ",3BD4AA84-3E18-4C85-BF41-89179F8BC138"
					str_data = str_data + ",50949974-B3DD-484A-944F-58F30A19B6A2"
					print("res:",str_data)
					if str_data:
						try:
							if len(str_data) > 256 :
								continue
							tcpCliSock.send(('%s\r\n' % str_data).encode())
						except IOError:
							print("error happan in sending");
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