import std.stdio;
import smack;

class PriorityQueue {

    public int size;
    public int capacity;
    public int[] elements;

    this(int size, int capacity) {
        this.size = size;
        this.capacity = capacity;
        elements = new int[capacity];
    }

    public bool isValid() {
        for (int i = 0; i < this.size; i++) {
            if (this.elements[i / 2] > this.elements[i])
                return false;
        }

        return true;
    }

    public void insert(int x)
    in {
        __VERIFIER_assert(isValid() == true);
        __VERIFIER_assert(this.capacity > this.size + 1);
    }
    out {
        __VERIFIER_assert(this.size < this.capacity);
    }
    do {
        int oldSize = this.size;
        this.elements[this.size] = x;
        this.size += 1;
        siftUp(oldSize);

        __VERIFIER_assert(this.size == oldSize + 1);

    }

    public void siftUp(int index)
    in {
        __VERIFIER_assert(0 <= index && index <= this.size);
        for (int i = 0; i < this.size; i++) {
            if (i != index)
                __VERIFIER_assert(this.elements[i / 2] <= this.elements[i]);
        }
    }
    out {
        __VERIFIER_assert(isValid() == true);
    }
    do {
        int i = index;
        while (0 < i) {
            //invariant
            __VERIFIER_assert(i <= index);
            for (int j = 0; j < this.size; j++) {
                if (j != i)
                    __VERIFIER_assert(this.elements[j / 2] <= this.elements[j]);
            }
            //end invariant

            if (this.elements[i / 2] <= this.elements[i])
                return;
            int aux = this.elements[i / 2];
            this.elements[i / 2] = this.elements[i];
            this.elements[i] = aux;
            i = i / 2;
        }
    }

    public void removeMin()
    in {
        __VERIFIER_assert(isValid() == true);
    }
    out {
        __VERIFIER_assert(isValid() == true);
        __VERIFIER_assert(this.size >= 0);
    }
    do {
        int x = this.elements[0];
        this.elements[0] = this.elements[this.size - 1];
        int oldSize = this.size;
        this.size -= 1;
        siftDown(0);

        __VERIFIER_assert(this.size + 1 == oldSize);
    }

    public void siftDown(int index)
    in {
        __VERIFIER_assert(index >= 0);
        for (int i = 0; i < this.size; i++) {
            if (i / 2 != index)
                __VERIFIER_assert(this.elements[i / 2] <= this.elements[i]);
        }
    }
    out {
        __VERIFIER_assert(isValid() == true);
    }
    do {
        int i = index;
        while (2 * i < this.size) {
            //invariant
            __VERIFIER_assert(i >= 0);
            for (int j = 0; j < this.size; j++) {
                if (j / 2 != i)
                    __VERIFIER_assert(this.elements[j / 2] <= this.elements[j]);
            }
            //end invariant

            int smallChild;
            if (2 * i + 1 < this.size && this.elements[2 * i + 1] < this.elements[2 * i])
                smallChild = 2 * i + 1;
            else 
                smallChild = 2  * i;
            
            if (this.elements[i] <= this.elements[smallChild])
                return;

            int aux = this.elements[smallChild];
            this.elements[smallChild] = this.elements[i];
            this.elements[i] = aux;
            i = smallChild;

            if (i / 2 / 2 >= 1)
                __VERIFIER_assert(this.elements[i / 2 / 2] <= this.elements[i]);

        }
    }
    
}

int main() {

    int size = 0;
    int capacity = 10;
    PriorityQueue queue = new PriorityQueue(size, capacity);
    queue.insert(5);
    queue.insert(2);
    queue.insert(10);
    queue.insert(11);
    queue.insert(3);

    queue.removeMin();
    queue.removeMin();

    for (int i = 0; i < queue.size; i++) {
        printf("%d ", queue.elements[i]);
    }
    
    printf("\n");

    return 0;
}