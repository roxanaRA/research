import std.stdio;
import smack;

int binarySearch(int[] array, int n, int x)
in {
    for(int i = 0; i < n - 1; i++) {
        for(int j = i + 1; j < n; j++) {
            __VERIFIER_assert(array[i] <= array[j]);
        }
    }
}    
out(mid) {
    __VERIFIER_assert((0 <= mid && mid < n && array[mid] == x) || (mid < 0));
}
do {
    int l = 0;
    int r = n;

    while (l < r) {

        //invariant
        __VERIFIER_assert(0 <= l && l <= r && r <= n);
        //end invariant

        int mid = (l + r) / 2;
        if (x < array[mid]) {
            r = mid;
        } else if (array[mid] < x) {
            l = mid + 1;
        } else {
            return mid;
        }
    }

    return -1;
}

int main() {

    int n = 5;
    int[] a = new int[n];
    a[0] = 2;
    a[1] = 4;
    a[2] = 6;
    a[3] = 21;
    a[4] = 34;

    printf("%d\n", binarySearch(a, n, 4));
    printf("%d\n", binarySearch(a, n, 23));

    return 0;
}