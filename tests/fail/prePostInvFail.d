import std.stdio;
import smack;

class MySchedule {

    public {
        int totalHours = 30;
        int mondayH;
        int tuesdayH;
        int wednesdayH;
        int thursdayH;
        int fridayH;
    }

    invariant() {
        __VERIFIER_assert(totalHours >= mondayH + tuesdayH + wednesdayH + thursdayH + fridayH);
    }

    this(int mondayH, int tuesdayH, int wednesdayH, int thursdayH, int fridayH)
        in {
            __VERIFIER_assert(mondayH > 0 && mondayH < 9);
            __VERIFIER_assert(tuesdayH > 0 && tuesdayH < 9);
            __VERIFIER_assert(wednesdayH > 0 && wednesdayH < 9);
            __VERIFIER_assert(thursdayH > 0 && thursdayH < 9);
            __VERIFIER_assert(fridayH > 0 && fridayH < 9);
        }
        do {
            this.mondayH = mondayH;
            this.tuesdayH = tuesdayH;
            this.wednesdayH = wednesdayH;
            this.thursdayH = thursdayH;
            this.fridayH = fridayH;
        }
    
    int addDayH(int day, int hours)
        in {
            __VERIFIER_assert(hours > 0 && hours < 9);
            __VERIFIER_assert(day > 0 && day < 6);

        }
        out(result) {
            __VERIFIER_assert(result > 0 && result < 9);
        }
        do {
            switch(day) {
                case 1: this.mondayH += hours;
                        return this.mondayH;
                case 2: this.tuesdayH += hours;
                        return this.tuesdayH;
                case 3: this.wednesdayH += hours;
                        return this.wednesdayH;
                case 4: this.thursdayH += hours;
                        return this.thursdayH;
                case 5: this.fridayH += hours;
                        return this.fridayH;
                default: return -1;               
            }
            
        }
   

}

int main() {

    MySchedule schedule = new MySchedule(1, 2, 3, 4, 5);
    schedule.addDayH(4, 2);
    schedule.addDayH(3, 1);
    schedule.addDayH(1, 9);

    return 0;
}
