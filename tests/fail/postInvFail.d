import std.stdio;
import smack;

class MyDate {

    public {
        int day;
        int month;
        int year;
    }

    invariant() {
        __VERIFIER_assert(day > 0 && day < 32);
        __VERIFIER_assert(month > 0 && month < 13);
        __VERIFIER_assert(year > 0);
    }

    this(int day, int month, int year) {
        this.day = day;
        this.month = month;
        this.year = year;
    }

    int getDateSum()
        out(result) {
            __VERIFIER_assert(result > 0 && result < 10);
        }

        do {
            int sum = this.day + this.month + this.year;
            int newSum = 0;

            while(true) {
                newSum += sum % 10;
                sum = sum / 10;

                if(newSum < 10)
                    break;

                if(sum == 0) {
                    sum = newSum;
                    newSum = 0;
                }
            }

            return newSum;
        }

    

}

int main() {

    MyDate date = new MyDate(122, 9, 1993);
    int mySum = date.getDateSum();

    return 0;
}
