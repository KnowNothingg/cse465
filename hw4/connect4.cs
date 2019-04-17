using System;

class connect4{

    public static int ROW = 6;
    public static int COLUMN = 7;

    public static int red = 1;
    public static int black = 2;
    public static int[,] create_board(){
        int[,] board = new int[ROW,COLUMN];
        return board;
    }

    public static void place(int[,] board, int ROW, int COLUMN, int player){
        board[ROW,COLUMN] = player;
    }

    public static int get_row(int[,] board, int col){
        for(int i = 0; i < ROW; i++){
            if(board[i,col] == 0 ){
                return i;
            }
        }
        return -1;
    }

    public static bool winning(int[,] board, int player){

        for(int i = 0; i < COLUMN - 3; i++){
            for(int j = 0; j < ROW; j++){
			if (board[j,i] == player && board[j,i+1] == player && board[j,i+2] == player && board[j,i+3] == player){
                return true;
                }
            }
        }

        for(int i = 0; i < COLUMN; i++){
            for(int j = 0; j < ROW - 3; j++){
			if (board[j,i] == player && board[j+1,i] == player && board[j+2,i] == player && board[j+3,i] == player){
                return true;
                }
            }
        }

        for(int i = 0; i < COLUMN - 3; i++){
            for(int j = 0; j < ROW - 3; j++){
			if (board[j,i] == player && board[j+1,i+1] == player && board[j+2,i+2] == player && board[j+3,i+3] == player){
                return true;
                }
            }
        }

        for(int i = 0; i < COLUMN - 3; i++){
            for(int j = 3; j < ROW; j++){
			if (board[j,i] == player && board[j-1,i+1] == player && board[j-2,i+2] == player && board[j-3, i+3] == player){
                return true;
                }
            }
        }
        return false;
    }

    public static void Main(){
        int count = 1;
        string line;
        int A = 0;
        int B = 1;
        int C = 2;
        int D = 3;
        int E = 4;
        int F = 5;
        int G = 6;

              while((line = Console.ReadLine()) != null && line != ""){
                bool over = false;
                int[,] board = create_board();

                for(int i = 0; i < line.Length; i++){
                    if(over){
                        break;
                    }
                    if(i % 2 == 0){
                    if(line[i] == 'A'){
                        int row = get_row(board, A);
                        place(board, row, A, red);
                    }if(line[i] == 'B'){
                        int row = get_row(board, B);
                        place(board, row, B, red);
                    }if(line[i] == 'C'){
                        int row = get_row(board, C);
                        place(board, row, C, red);
                    }if(line[i] == 'D'){
                        int row = get_row(board, D);
                        place(board, row, D, red);
                    }if(line[i] == 'E'){
                        int row = get_row(board, E);
                        place(board, row, E, red);
                    }if(line[i] == 'F'){
                        int row = get_row(board, F);
                        place(board, row, F, red);
                    }if(line[i] == 'G'){
                        int row = get_row(board, G);
                        place(board, row, G, red);
                    }
                    if(winning(board, red)){
                        Console.Write("Game #" + count + ": Red Wins\n");
                        over = true;
                    }
                    }
                    else{
                        if(line[i] == 'A'){
                        int row = get_row(board, A);
                        place(board, row, A, black);
                    }if(line[i] == 'B'){
                        int row = get_row(board, B);
                        place(board, row, B, black);
                    }if(line[i] == 'C'){
                        int row = get_row(board, C);
                        place(board, row, C, black);
                    }if(line[i] == 'D'){
                        int row = get_row(board, D);
                        place(board, row, D, black);
                    }if(line[i] == 'E'){
                        int row = get_row(board, E);
                        place(board, row, E, black);
                    }if(line[i] == 'F'){
                        int row = get_row(board, F);
                        place(board, row, F, black);
                    }if(line[i] == 'G'){
                        int row = get_row(board, G);
                        place(board, row, G, black);
                    }
                    if(winning(board, black)){
                        Console.Write("Game #" + count + ": Black Wins\n");
                        over = true;
                    }
                    }
                }
                if(line.Length >= 42 && !over){
                    Console.Write("Game #" + count + ": Draw\n");
                }else if(line.Length < 42 && !over){
                    Console.Write("Game #" + count + ": Game in Process\n");
                }
                count += 1;
              }
         }
}