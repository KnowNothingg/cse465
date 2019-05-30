import sys
import time

from random import random

class MyStruct:
	def __init__(self, N):
		self.data = [random() for i in range(N)]

def f(mystruct):
	print(mystruct.data[0] + mystruct.data[1])
	return mystruct.data[0] + mystruct.data[1]

def timeIt(myStruct):
	ITERATIONS = 1000000000
	start = time.time()
	for i in range(ITERATIONS):
		f(myStruct)
	end = time.time()
	print(end - start)

timeIt(MyStruct(100))
timeIt(MyStruct(10000))
timeIt(MyStruct(1000000))
timeIt(MyStruct(100000000))
