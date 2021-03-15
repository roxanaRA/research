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
    
    void setDayH(int day, int hours)
        in {
            __VERIFIER_assert(hours > 0 && hours < 9);
            __VERIFIER_assert(day > 0 && day < 6);
        }
        do {
            switch(day) {
                case 1: this.mondayH = hours;
                        break;
                case 2: this.tuesdayH = hours;
                        break;
                case 3: this.wednesdayH = hours;
                        break;
                case 4: this.thursdayH = hours;
                        break;
                case 5: this.fridayH = hours;
                        break;
                default: break;               
            }
            
        }
   

}

int main() {

    MySchedule schedule = new MySchedule(1, 2, 3, 4, 5);
    schedule.setDayH(4, 7);
    schedule.setDayH(3, 8);
    schedule.setDayH(1, 10);

    return 0;
}
