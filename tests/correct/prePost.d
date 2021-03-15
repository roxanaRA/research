// Perimeter of a triangle - Correct

import std.stdio;
import smack;

int perimeter(int l1, int l2, int l3)
in {
    __VERIFIER_assert(l1 + l2 > l3 && l2 + l3 > l1 &&l1 + l3 > l2);
    __VERIFIER_assert(l1 > 0 && l2 > 0 && l3 > 0);

} out (result) {
    __VERIFIER_assert(result > 0);

} do {
    return l1 + l2 + l3;
}

int main() {
    int l1 = 3;
    int l2 = 4;
    int l3 = 5;

    perimeter(l1, l2, l3);

    return 0;
}