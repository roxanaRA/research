//Verify invariant - Correct

import std.stdio;
import smack;

class Group {

    public {
        int girls;
        int boys;
        int totalStudents;
    }

    this(int girls, int boys, int totalStudents) {
        this.girls = girls;
        this.boys = boys;
        this.totalStudents = totalStudents;
    }

    invariant() {
        __VERIFIER_assert(totalStudents == girls + boys);        
    }

    void addGirls(int newGirls) {
        this.girls += newGirls;
        this.totalStudents += newGirls;
    }

    void addBoys(int newBoys) {
        this.boys += newBoys;
        
    }

    void removeGirls(int removeGirls) {
        this.girls -= removeGirls;
        
    }

    void removeBoys(int removeBoys) {
        this.boys -= removeBoys;
        
    }
}

int main() {

    int girls = 5;
    int boys = 7;
    int totalStudents = 12;

    Group group = new Group(girls, boys, totalStudents);
    group.addGirls(23);
    group.removeGirls(2);
    group.addBoys(27);

    return 0;

}
