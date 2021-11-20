package onurHomework;

/**
 *
 * @author Ahmet
 */
public class ArrayQueue_Homework {

    private int size;
    private int QueueArr[];
    private int front;
    public int rear;
    private int number;

    public ArrayQueue_Homework(int s) {
        size = s;
        QueueArr = new int[size];
        front = 0;
        rear = -1;
        number = 0;
    }

    public void add(int j) {
        if (rear == (size - 1)) {
            rear = -1;
        }
        QueueArr[++rear] = j;
        number++;

    }

    public int remove() {
        int temp = QueueArr[front++];
        if (front == size) {
            front = 0;
        }
        number--;
        return temp;
    }

    public boolean isEmpty() {
        return number == 0;
    }
    
    public static void main(String[] args) {
        ArrayQueue_Homework q= new ArrayQueue_Homework(5);
	q.add(7); q.add(1);  q.add(4); q.add(2); q.add(3);
	System.out.println(q.remove());
    }

}
