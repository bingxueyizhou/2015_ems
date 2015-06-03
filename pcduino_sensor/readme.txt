main.py 
it is the main deal in application
it will start send socket data at address 127.0.0.1 port 17001
the data format is a Stirng like "温度,湿度,实时pm2.5,平均pm2.5.实时AQI,平均AQI,噪音电压,UUID_0,UUID_1,UUID_2,UUID_3";
it will read data of two sensor "pm2_5(in fact I don't know what it's name is)" at usb,"noiser(an arduino sensor)" at ADC 2


thanks the open source project "https://github.com/pcduino/python-pcduino.git"