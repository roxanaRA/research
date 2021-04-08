import std.stdio;
import smack;

int sum(int[] array, int n, int s, int t)
in {
    __VERIFIER_assert(s >= 0 && s <= t && t <= n);
}
do {
    if (s == t)
        return 0;
    return sum(array, n, s, t - 1) + array[t - 1];
}

struct pos {
    int start;
    int end;
}

pos maxSegSum(int[] array, int n)
out(result) {
    
    __VERIFIER_assert(result.start >= 0 && result.start <= result.end && result.end <= n);
    for(int i = 0; i < n - 1; i ++) {
        for(int j = i + 1; j < n; j++) {
            __VERIFIER_assert(sum(array, n, i, j) <= sum(array, n, result.start, result.end));
        }
    }
}
do {
    pos result;
    result.start = 0;
    result.end = 0;

    int s = 0;
    int u = 0;
    int c = 0;
    int t = 0;

    while (u < n) {
        //invariant
        __VERIFIER_assert(c >= 0 && c <= u && u < n && t == sum(array, n, c, u));
        for(int i = 0; i <= u; i++)
            __VERIFIER_assert(sum(array, n, i, u) <= sum(array, n, c, u));
        __VERIFIER_assert(result.start >=0 && result.start <= result.end && result.end <= u && s == sum(array, n, result.start, result.end));
        for(int i = 0; i <= u; i ++) {
            for(int j = i + 1; j <= u; j++) {
                __VERIFIER_assert(sum(array, n, i, j) <= sum(array, n, result.start, result.end));
            }
        }
        //end invariant

        t = t + array[u];
        u = u + 1;

        if (t < 0) {
            c = u;
            t = 0;
        } else if (s < t) {
            result.start = c;
            result.end = u;
            s = t;
        }
    }

    return result;
}


int main() {

    int n = 9;
    int[] array = new int[n];
    for(int i = 0; i < n; i++) {
        if (i % 2 == 0)
            array[i] = i;
        else
            array[i] = i - 4;
    }

    pos result = maxSegSum(array, n);

    for(int i = 0; i < n; i++) {
        printf("%d ", array[i]);
    }

    printf("\n");
    printf("%d %d\n", result.start, result.end);

    return 0;
}