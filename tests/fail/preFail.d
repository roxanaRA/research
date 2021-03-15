//SQRT - Error

import std.stdio;
import std.math;
import smack;

float getRoot(float n)

    in {
        __VERIFIER_assert(n > 0);
    }

    do {
        return sqrt(n);
    }

int main() {

    float n = -234.0;
    float root = getRoot(n);

    return 0;
}
