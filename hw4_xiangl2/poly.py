import sys
import math

def rearrange(line):
    newLine = ""
    for j in range(len(line)-1):
        if(line[j] == "-" or line[j] == "+" or line[j] == "x"):
            newLine += " "
        newLine += line[j]

        if (line[j] == "^" and (line[j] != "-" or line[j] != "+")):
            newLine += " "

        
    newLine += line[-1]

    temp = newLine.split(" ")
    polys = []
    for i in range(len(temp)):
        if(temp[i] != ""):
            polys.append(temp[i])

    # for i in polys:
    #     print(i)
    return polys



while True:
    line = sys.stdin.readline()
    if len(line) == 0: break
    count = int(line[0])
    for i in range(count): 
        dicA = {}
        dicB = {}
        result = {}
        line = sys.stdin.readline()     # first line store in dicA
        if len(line) == 0: break

        polys = rearrange(line)
        for i in range(len(polys)):
            if(polys[i] == "x^"):
                dicA[polys[i+1]] = polys[i-1]
        
        # for i in dicA:
        #     print(i, dicA.get(i))

        line = sys.stdin.readline()     # second line store in dicB
        newPolys = rearrange(line)
        for i in range(len(newPolys)):
            if(newPolys[i] == "x^"):
                dicB[newPolys[i+1]] = newPolys[i-1]

        # for i in dicB:
        #     print(i, dicB.get(i))
        
        for i in dicA:
            for j in dicB:
                # print(int(dicA.get(i)) * int(dicB.get(j)))
                if(int(i) + int(j) == 0):
                    result[1] = int(dicA.get(i)) * int(dicB.get(j))
                if(result.get(int(i) + int(j)) == None):
                    result[int(i) + int(j)] = int(dicA.get(i)) * int(dicB.get(j))
                else:
                    result[int(i) + int(j)] = result.get(int(i) + int(j)) + int(dicA.get(i)) * int(dicB.get(j))

        # print(count)

        # for i in result:
        #     print(result.get(i), i)    

        answer = []
        for i in result:
            answer.append(int(i))
        answer.sort()
        answer.reverse()
        
        final = ""
        for i in answer:
            if(result.get(i) >= 0):
                final += "+" + str(result.get(i)) + "x^" + str(i)
            else : final += str(result.get(i)) + "x^" + str(i)

        if(final[0] == "+"):
            final = final[1:]
        print(final)


        
