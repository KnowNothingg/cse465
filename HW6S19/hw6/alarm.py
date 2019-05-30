import sys
import math

# create an obj of time
class time:
    def __init__(self, hour, m1, m2, ap):
        self.hour = hour
        self.m1 = m1
        self.m2 = m2
        self.ap = ap
    
    def display(self):
        s = str(self.hour) + ":" + str(self.m1) + str(self.m2) + str(self.ap) + "m"
        return s

def seperate(s):
    startTime.hour = int(s[0])
    startTime.m1 = int(s[2])
    startTime.m2 = int(s[3])
    startTime.ap = s[4]

    endTime.hour = int(s[7])
    endTime.m1 = int(s[9])
    endTime.m2 = int(s[10])
    endTime.ap = s[11]


startTime = time(-1, -1, -1, "P")
endTime = time(-1, -1, -1, "P")


#read line from the input which has a form of
# 0:00AM 0:00AM
while True:
    line = sys.stdin.readline() 
    if len(line) == 0: break
    if(len(line) < 11): line = sys.stdin.readline()
    
    push = 0
    seperate(line)

    hDif = math.fabs(startTime.hour - endTime.hour)
    push += min(hDif, (12 - hDif))

    m1Dif = math.fabs(startTime.m1 - endTime.m1)
    push += min(m1Dif, (6 - m1Dif))

    m2Dif = math.fabs(startTime.m2 - endTime.m2)
    push += min(m2Dif, (10 - m2Dif))

    if(startTime.ap != endTime.ap):
        push += 1
    
    if(push == 1):
            print("Going from %s to %s requires %s push" %(startTime.display(), endTime.display(), int(push)))
    else:
        print("Going from %s to %s requires %s pushes" %(startTime.display(), endTime.display(), int(push)))

