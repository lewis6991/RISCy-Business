//#include <stdio.h>

int isAvailable(int puzzle[][9], int row, int col, int num) {
    int rowStart = (row/3) * 3;
    int colStart = (col/3) * 3;
    int i, j;

    for(i=0; i<9; ++i) {
        if (puzzle[row][i] == num) return 0;
        if (puzzle[i][col] == num) return 0;
        if (puzzle[rowStart + (i%3)][colStart + (i/3)] == num) return 0;
    }
    return 1;
}

int fillSudoku(int puzzle[][9], int row, int col) {
    int i;
    if(row<9 && col<9) {
        if(puzzle[row][col] != 0) {
            if((col+1)<9) return fillSudoku(puzzle, row, col+1);
            else if((row+1)<9) return fillSudoku(puzzle, row+1, 0);
            else return 1;
        }
        else {
            for(i=0; i<9; ++i) {
                if(isAvailable(puzzle, row, col, i+1)) {
                    puzzle[row][col] = i+1;
                    if((col+1)<9) {
                        if(fillSudoku(puzzle, row, col +1)) return 1;
                        else puzzle[row][col] = 0;
                    }
                    else if((row+1)<9) {
                        if(fillSudoku(puzzle, row+1, 0)) return 1;
                        else puzzle[row][col] = 0;
                    }
                    else return 1;
                }
            }
        }
        return 0;
    }
    else return 1;
}

int main() {
    int i, j;
    int sum;
    int p[9][9];

    p[0][0] = 0; p[0][1] = 0; p[0][2] = 0; p[0][3] = 0; p[0][4] = 0; p[0][5] = 0; p[0][6] = 0; p[0][7] = 9; p[0][8] = 0;
    p[1][0] = 1; p[1][1] = 9; p[1][2] = 0; p[1][3] = 4; p[1][4] = 7; p[1][5] = 0; p[1][6] = 6; p[1][7] = 0; p[1][8] = 8;
    p[2][0] = 0; p[2][1] = 5; p[2][2] = 2; p[2][3] = 8; p[2][4] = 1; p[2][5] = 9; p[2][6] = 4; p[2][7] = 0; p[2][8] = 7;
    p[3][0] = 2; p[3][1] = 0; p[3][2] = 0; p[3][3] = 0; p[3][4] = 4; p[3][5] = 8; p[3][6] = 0; p[3][7] = 0; p[3][8] = 0;
    p[4][0] = 0; p[4][1] = 0; p[4][2] = 9; p[4][3] = 0; p[4][4] = 0; p[4][5] = 0; p[4][6] = 5; p[4][7] = 0; p[4][8] = 0;
    p[5][0] = 0; p[5][1] = 0; p[5][2] = 0; p[5][3] = 7; p[5][4] = 5; p[5][5] = 0; p[5][6] = 0; p[5][7] = 0; p[5][8] = 9;
    p[6][0] = 9; p[6][1] = 0; p[6][2] = 7; p[6][3] = 3; p[6][4] = 6; p[6][5] = 4; p[6][6] = 1; p[6][7] = 8; p[6][8] = 0;
    p[7][0] = 5; p[7][1] = 0; p[7][2] = 6; p[7][3] = 0; p[7][4] = 8; p[7][5] = 1; p[7][6] = 0; p[7][7] = 7; p[7][8] = 4;
    p[8][0] = 0; p[8][1] = 8; p[8][2] = 0; p[8][3] = 0; p[8][4] = 0; p[8][5] = 0; p[8][6] = 0; p[8][7] = 0; p[8][8] = 0;

    sum = 0;

    //fillSudoku(p, 0, 0);

    for(i=0; i < 9; ++i)
        for(j=0; j < 9; ++j)
            sum += p[i][j];

    //printf("Sum = %d\n.", sum);

    return 0;
}
