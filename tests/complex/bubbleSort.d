import std.stdio;
import smack;

bool sorted(int[] array, int n, int l, int u)
in {
    __VERIFIER_assert(array != null);
    __VERIFIER_assert(0 <= l && l <= u && u <= n);
}
do {
    for(int i = l; i <= u; i++) {
        for(int j = i; j <= u; j++) {
            if (array[i] > array[j]) {
                return false;
            }
        }
    }
    return true;
}

bool partitioned(int[] array, int n, int p)
in {
    assert(array != null);
}
do {
    for(int i = 0; i <= p; i++) {
        for(int j = p + 1; j < n; j++) {
            if (array[i] > array[j]) {
                return false;
            }
        }
    }
    return true;
}

void bublleSort(ref int[] array, int n)
in {
    __VERIFIER_assert(array != null);
}
do {
    int i = n - 1;
    while (i > 0) {

        //invariant
        __VERIFIER_assert(0 < i && i < n);
        __VERIFIER_assert(sorted(array, n, i, n - 1) == true);
        __VERIFIER_assert(partitioned(array, n, i) == true);
        //end invariant

        int j = 0;
        while (j < i) {
            //invariant
            __VERIFIER_assert(0 < i && i < n && 0 <= j && j <= i);
            __VERIFIER_assert(sorted(array, n, i, n - 1) == true);
            __VERIFIER_assert(partitioned(array, n, i) == true);
            for(int k = 0; k <= j; k++) {
                __VERIFIER_assert(array[k] <= array[j]);
            }
            //end invariant

            if (array[j] > array[j + 1]) {
                int aux = array[j];
                array[j] = array[j + 1];
                array[j + 1] = aux;
            }

            j = j + 1;

        }

        i = i - 1;
    }

    //postcondition
    __VERIFIER_assert(sorted(array, n, 0, n - 1));
    //end postcondition
}

int main() {

    int n = 5;
    int[] a = new int[n];
    a[0] = 9;
    a[1] = 4;
    a[2] = 6;
    a[3] = 3;
    a[4] = 8;

    bublleSort(a, n);

    for(int i = 0; i < n; i++)
        printf("%d ", a[i]); 

    printf("\n");

    return 0;
}