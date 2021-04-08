import std.stdio;
import smack;

void mirrorMatrix(ref int[3][3] matrix, int n, int m) {
    int[3][3] oldMatrix;
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < m; j++)
            oldMatrix[i][j] = matrix[i][j];

    }

    int a = 0;
    while(a < n) {
        //invariant
        __VERIFIER_assert(a <= n);
        for(int i = 0; i < a; i++)
            for(int j = 0; j < m; j++)
                __VERIFIER_assert(matrix[i][j] == oldMatrix[i][m - 1 - j]);
        for(int i = a; i < n; i++)
            for(int j = 0; j < m; j++)
                __VERIFIER_assert(matrix[i][j] == oldMatrix[i][j]);
        //end invariant

        int b = 0;
        while (b < m / 2) {
            //invariant
            __VERIFIER_assert(b <= m/ 2);
            for(int i = 0; i < a; i++)
                for(int j = 0; j < m; j++)
                    __VERIFIER_assert(matrix[i][j] == oldMatrix[i][m - 1 - j]);
            for(int j = 0; j < b; j++) {
                __VERIFIER_assert(matrix[a][j] == oldMatrix[a][m - 1 - j]);
                __VERIFIER_assert(oldMatrix[a][j] == matrix[a][m - 1 - j]);
            }
            for(int j = b; j < m - b; j++)
                __VERIFIER_assert(matrix[a][j] == oldMatrix[a][j]);       
            for(int i = a + 1; i < n; i++)
                for(int j = 0; j < m; j++)
                    __VERIFIER_assert(matrix[i][j] == oldMatrix[i][j]);
            //end invariant

            int aux = matrix[a][m - 1 - b];
            matrix[a][m - 1 - b] = matrix[a][b];
            matrix[a][b] = aux;
            b = b + 1;
        }

        a = a + 1;

    }

    //condition
    for(int i = 0; i < n; i++)
        for(int j = 0; j < m; j++)
            __VERIFIER_assert(matrix[i][j] == oldMatrix[i][m - 1 - j]);
    //end condition

}

void printMatrix(int[3][3] matrix, int n, int m) {
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < m; j++)
            printf("%d ", matrix[i][j]);
        printf("\n");
    }
}

int main() {

    int m = 3;
    int n = 3;
    int[3][3] matrix;

    int x = 0;
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < m; j++) {
            matrix[i][j] = x;
            x = x + 1;
        }
    }

    printMatrix(matrix, 3, 3);
    mirrorMatrix(matrix, 3, 3);
    printMatrix(matrix, 3, 3);

    return 0;
}