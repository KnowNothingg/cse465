import sys

number = 1

while True:

    line = sys.stdin.readline()
    if len(line) == 0: break
    nums = line.split(" ")

    minutes = int(nums[0])

    allZero = True

    for i in range(1, 11):
        if(int(nums[i]) != 0):
            allZero = False

    if(allZero):
        break

    temp = [minutes, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

    for i in range(0, minutes):
        for j in range(1, 11):
            if(j == 1):
                if(int(nums[2]) < 3 or int(nums[2]) > 7):
                    temp[1] = int(nums[1]) - 1
                    if(temp[1] < 0):
                        temp[1] = 0


                if(int(nums[2]) > 3 and int(nums[2]) < 8):
                    temp[1] = int(nums[1]) + 1
                    if(temp[1] > 9):
                        temp[1] = 9

                if(int(nums[2]) == 3):
                    temp[1] = nums[1]
            

            elif (j == 10):
                if(int(nums[9]) < 3 or int(nums[9]) > 7):
                    temp[10] = int(nums[10]) - 1
                    if(temp[10] < 0):
                        temp[10] = 0
                
                if(int(nums[9]) >= 4 and int(nums[9]) <= 7):
                    temp[10] = int(nums[10]) + 1
                    if(temp[10] > 9):
                        temp[10] = 9
                if(int(nums[9]) == 3):
                    temp[10] = nums[10]

            else: 
                sum = int(nums[j - 1]) + int(nums[j + 1])
                if(sum < 3 or sum > 7): 
                    temp[j] = int(nums[j]) - 1
                    if(temp[j] < 0):
                        temp[j] = 0

                if(sum >= 4 and sum <= 7):
                    temp[j] = int(nums[j]) + 1
                    if(temp[j] > 9):
                        temp[j] = 9
                if(sum == 3):
                    temp[j] = nums[j]

        temp[0] = int(nums[0]) - 1
        nums = temp[:]

    print("#%s: %s %s %s %s %s %s %s %s %s %s" %(number,  nums[1], nums[2], nums[3], nums[4], nums[5], nums[6], nums[7], nums[8], nums[9], nums[10]))
    number += 1