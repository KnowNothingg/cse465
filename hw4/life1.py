def life1(l):

    empty_list=[0,0,0,0,0,0,0,0,0,0]
    for i in range(len(l)):
        if i==0:
            if l[1]<3 or l[i]>7:
                empty_list[0]=l[0]-1
                if empty_list[0]<0:
                    empty_list[0]=0
            if 4<=l[1] and l[1]<=7:
                l[0]=l[0]+1
                if l[0]>9:
                    l[0]=9
            if l[1] == 3:
                empty_list[0] = l[0]
        elif i==9:
            if l[8]<3 or l[8]>7:
                l[9]=l[9]-1
                if l[9]<0:
                    l[9]=0
            if 4<=l[8] and l[8]<=7:
                empty_list[9]=l[9]+1
                if empty_list[9]>9:
                    empty_list[9]=9
            if l[8] == 3:
                empty_list[9] = l[9]
        else:
            neighbour=l[i-1]+l[i+1]
            if neighbour<3 or neighbour>7:
                empty_list[i]=l[i]-1
                if empty_list[i]<0:
                    empty_list[i]=0
            if 4<=neighbour and neighbour<=7:
                empty_list[i]=l[i]+1
                if empty_list[i]>9:
                    empty_list[i]=9
            if neighbour == 3:
                empty_list[i] = l[i]
    return empty_list

def main():
    # starting population
    l=[1, 1, 5, 7, 1, 4, 0, 6, 7, 9]
    for j in range(0, 1):

        for i in  range(1,11):
            after_one_min=life1(l)
            l=after_one_min

    print('#{0:>2}: {1}'.format(i,' '.join([str(n) for n in after_one_min])))

main()
