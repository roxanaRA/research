import std.stdio;
import smack;

int getGrade(int pos, int neg)
    out(result) {
        __VERIFIER_assert(result > 0);
    }
    do {
        int points = pos - neg;
        return points;
    }

int main() {

    int pos = 10;
    int neg = 17;

    int points = getGrade(pos, neg);

    return 0;
}
