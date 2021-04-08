import std.stdio;
import smack;

int getMaxIndex(int[] array, int n)
in {
    __VERIFIER_assert(array != null);
    __VERIFIER_assert(n > 0);
}
out(index) {
    __VERIFIER_assert(0 <= index && index < n);
    for(int i = 0; i < n; i++) {
        __VERIFIER_assert(array[i] <= array[index]); 
    }
}
do {
    int i = 0;
    int index = 0;

    while (i < n) {

        //invariant
        __VERIFIER_assert(0 <= i && i <= n);
        __VERIFIER_assert(0 <= index && index <= i && index <= n);
        for(int k = 0; k < i; k++) {
            __VERIFIER_assert(array[k] <= array[index]); 
        }   
        //end invariant

        if (array[i] > array[index])
            index = i;
        i = i + 1;  
    }

    return index;

}


int main() {

    int n = 5;
    int[] a = new int[n];
    a[0] = 7;
    a[1] = 4;
    a[2] = 6;
    a[3] = 20;
    a[4] = 8;

    int index = getMaxIndex(a, n);

    printf("%d\n", a[index]);

    return 0;
}