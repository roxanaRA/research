import std.stdio;
import smack;

int getGrade(int pos, int neg)
    out(result) {
        __VERIFIER_assert(result > 0);
    }
    do {
        int points = pos - neg;
        if(points < 0) {
            points = 0;
        }

        return points;
    }

int main() {

    int pos = 10;
    int neg = 7;

    int points = getGrade(pos, neg);

    return 0;
}