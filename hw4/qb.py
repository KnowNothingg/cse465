import sys
import math

number = 1
output = open("qbOut.txt", "w")

while True:

    line = sys.stdin.readline()
    if len(line) == 0: output.close()
    nums = line.split(" ")

    completion = int(nums[0])
    attempt = int(nums[1])
    yards = int(nums[2])
    inter = int(nums[3])
    td = int(nums[4])

    if(attempt == 0):
        break

    completion_p = ((completion / attempt) - 0.3) * 5
    td_p = (td/attempt) * 20
    yardPerAttempt = (yards/attempt - 3) * 0.25
    interception = 2.375 - 100 * (inter / ( 4 * attempt ))


    if(completion_p > 2.375):
        completion_p = 2.375
    if(completion_p < 0):
        completion_p = 0

    if(td_p > 2.375):
        td_p = 2.375
    if(td_p < 0):
        td_p = 0
    
    if(yardPerAttempt > 2.375):
        yardPerAttempt = 2.375
    if(yardPerAttempt < 0):
        yardPerAttempt = 0
    
    if(interception > 2.375):
        interception = 2.375
    if(interception < 0):
        interception = 0

    qb = 100 * (completion_p + td_p + yardPerAttempt + interception) / 6

    deci = str(qb - int(qb))

    if(int(deci[2]) >= 5):
        qb = math.ceil(qb)
    else:
        qb = math.floor(qb)

    output.write("QB #%d: %d\n" %(number, qb))
    number += 1
