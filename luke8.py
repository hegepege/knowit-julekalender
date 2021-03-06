#!/usr/bin/python
# -*- coding: utf8 -*-
import sys
#Vi definerer et primtall som et MIRPTALL dersom vi fortsatt har er primtall når sifrene reverseres. 
#Regelen gjelder imidlertid ikke dersom tallet samtidig er et palindrom (dvs likt samme hvilken ende det leses fra, som 969).

#Eksempel 1: 13 er et primtall. Det er også et MIRPTALL, fordi tallet i revers, 31, også er et primtall.
#Eksempel 2: 23 er et primtall. Det er imidlertid ikke et MIRPTALL, da vi får 32 om vi reverserer det, som ikke er et primtall.
#Eksempel 3: 5 og 101 er ikke MIRPTALL, selv om de er primtall, da disse er palindromer.

#Hvor mange positive heltall under 1000 er MIRPTALL?

#Tips: Selv om 13 og 31 reverseres til hverandre er de fortsatt MIRPTALL “hver for seg” (på grunn av definisjonen). Begge må derfor telles med som en del av resultatet.

def is_palindrome(num):
    return str(num) == str(num)[::-1]

def reverse(num):
	return int(str(num)[::-1])


def is_prime(num):
	if num % 2 == 0 and num > 2: 
		return False
	for a in range(2,num):
		if( num % a == 0):
			return False;
	return True;

def mirprimtall():
	mirprimtall = 0
	
	for i in range(0,1000):
		if(is_palindrome(i)):
			continue;
		elif is_prime(i) and is_prime(reverse(i)):
			print("Found mir %d " % i)
			mirprimtall = mirprimtall + 1

	print('Antall mirprimtall: %d' % mirprimtall)



def luke9(num):
	result = ""

	while(num > 0):
		rem = num % 26
		num = int(num/26)
		if(rem == 0):
			num -= 1
		if((rem - 1) == -1):
			rem = 26	
		result = chr(ord('A') + (rem - 1)) + result
		print("mellom %s " % result)

	print(result)


if __name__ == "__main__":
   luke9(int(sys.argv[1]))
    #mirprimtall()