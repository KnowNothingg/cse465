import sys

red = 1
black = 2
count = 1
A = 0
B = 1
C = 2
D = 3
E = 4
F = 5
G = 6

COLUMN = 7
ROW = 6

def create_board():
    board = [[0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0]]
    return board

def place(board, row, col, player):
    board[row][col] = player

def get_row(boar, col):
    for i in range(ROW):
        if(board[i][col] == 0):
            return i

def winning(board, player):
    #horizontal
    for i in range(COLUMN-3):
        for j in range(ROW):
            if board[j][i] == player and board[j][i+1] == player and board[j][i+2] == player and board[j][i+3] == player:
                return True
    
    #vertical
    for i in range(COLUMN):
        for j in range(ROW-3):
            if (board[j][i] == player and board[j+1][i] == player and board[j+2][i] == player and board[j+3][i] == player):
                return True

    #
    for i in range(COLUMN-3):
        for j in range(ROW-3):
            if (board[j][i] == player and board[j+1][i+1] == player and board[j+2][i+2] == player and board[j+3][i+3] == player):
                return True


    for i in range(COLUMN-3):
        for j in range(3, ROW):
            if (board[j][i] == player and board[j-1][i+1] == player and board[j-2][i+2] == player and board[j-3][i+3] == player):
                return True
    




while True:
    board = create_board()
    over = False
    line = sys.stdin.readline() 
    if len(line) == 0: break
    
    for i in range(len(line)):      # place the pieces

        if(over):
            break
        if(i%2 == 0): # 0, 2, 4, 6 == red
            if(line[i] == 'A'):
                row = get_row(board, A)
                place(board, row, A, red)
            if(line[i] == 'B'):
                row = get_row(board, B)
                place(board, row, B, red)
            if(line[i] == 'C'):
                row = get_row(board, C)
                place(board, row, C, red)
            if(line[i] == 'D'):
                row = get_row(board, D)
                place(board, row, D, red)
            if(line[i] == 'E'):
                row = get_row(board, E)
                place(board, row, E, red)
            if(line[i] == 'F'):
                row = get_row(board, F)
                place(board, row, F, red)
            if(line[i] == 'G'):
                row = get_row(board, G)
                place(board, row, G, red)
            if winning(board, red):
                print("Game #%d: Red Wins" %(count))
                over = True
        else:
            if(line[i] == 'A'):
                row = get_row(board, A)
                place(board, row, A, black)
            if(line[i] == 'B'):
                row = get_row(board, B)
                place(board, row, B, black)
            if(line[i] == 'C'):
                row = get_row(board, C)
                place(board, row, C, black)
            if(line[i] == 'D'):
                row = get_row(board, D)
                place(board, row, D, black)
            if(line[i] == 'E'):
                row = get_row(board, E)
                place(board, row, E, black)
            if(line[i] == 'F'):
                row = get_row(board, F)
                place(board, row, F, black)
            if(line[i] == 'G'):
                row = get_row(board, G)
                place(board, row, G, black)
            if winning(board, black):
               print("Game #%d: Black Wins" %(count))
               over = True


    if(len(line) >= 42 and not over):
        print("Game #%d: Draw" %(count))
    elif(len(line) < 42 and not over):
        print("Game #%d: Game in process" %(count))
    count += 1
        
    
        
            
        

           

    
    
