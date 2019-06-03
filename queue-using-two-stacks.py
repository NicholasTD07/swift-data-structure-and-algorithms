# https://www.hackerrank.com/challenges/queue-using-two-stacks/problem

# Enter your code here. Read input from STDIN. Print output to STDOUT

# Queue: FIFO
# Stack: LIFO, peek.

# Stack in python

class Stack:
    def __init__(self):
        self.storage = []

    # Put an element on the top of the whole stack
    def push(self, element):
        self.storage.insert(0, element)
        return

    # Pop the element on the top of the whole stack
    # which is newest element
    # the last element got put on the stack
    def pop(self):
        return self.storage.pop(0)

    def peek(self):
        return self.storage[0]

    def isEmpty(self):
        if self.storage:
            return False
        else:
            return True

def test_stack():
    xs = Stack()

    xs.push(0)
    xs.push(1)

    print(xs.storage)

    print(xs.pop())
    print(xs.storage)

class QueueV1:
    # use the two Stacks? What do you mean?
    # stack.push & stack.pop

    def __init__(self):
        self.storage = Stack()
        self.workspace = Stack()

    # Put the element at the back of the queue
    def enqueue(self, element):
        self.storage.push(element)
        return

    # Pop the element at the front of the queue
    # which is the oldest element in the queue
    def dequeue(self):
        while not self.storage.isEmpty():
            element = self.storage.pop()
            self.workspace.push(element)

        target = self.workspace.pop()

        while not self.workspace.isEmpty():
            element = self.workspace.pop()
            self.storage.push(element)

        return target

    def front(self):
        # print(self.storage.storage)
        while not self.storage.isEmpty():
            element = self.storage.pop()
            self.workspace.push(element)

        # print(self.workspace.storage)
        target = self.workspace.peek()

        while not self.workspace.isEmpty():
            element = self.workspace.pop()
            self.storage.push(element)

        return target

class Queue:
    # use the two Stacks? What do you mean?
    # stack.push & stack.pop

    def __init__(self):
        self.storage = Stack()
        self.workspace = Stack()

    # Put the element at the back of the queue
    def enqueue(self, element):
        self.storage.push(element)
        return

    # Pop the element at the front of the queue
    # which is the oldest element in the queue
    def dequeue(self):
        # NOTE: THIS IS THE KEY!
        # Not needing to traverse the whole array twice
        if not self.workspace.isEmpty():
            return self.workspace.pop()

        # otherwise
        while not self.storage.isEmpty():
            element = self.storage.pop()
            self.workspace.push(element)

        target = self.workspace.pop()

        return target

    def front(self):
        # NOTE: THIS IS THE KEY!
        # Not needing to traverse the whole array twice
        if not self.workspace.isEmpty():
            return self.workspace.peek()

        # otherwise
        while not self.storage.isEmpty():
            element = self.storage.pop()
            self.workspace.push(element)

        # print(self.workspace.storage)
        target = self.workspace.peek()

        return target

"""
1 x: Enqueue element
into the end of the queue.
2: Dequeue the element at the front of the queue.
3: Print the element at the front of the queue.

10 # number of inputs
1 42 #
2
1 14
3
1 28
3
1 60
1 78
2
2
"""


def process(line, queue):
    commands = line.split(" ")
    if len(commands) == 2 and commands[0] == "1":
        queue.enqueue(int(commands[1]))
    elif len(commands) == 1:
        if commands[0] == "2":
            queue.dequeue()
        elif commands[0] == "3":
            print(queue.front())
        else:
            print("error!")
    else:
        print("error!")

def main():
    number_of_lines = int(input())
    queue = Queue()
    while number_of_lines > 0:
        process(input(), queue)
        number_of_lines -= 1


def test_stacks():
    xs = Stack()
    xs.push(0)
    xs.push(1)
    xs.push(2)
    print(xs.storage)
    print(xs.peek())

    element = xs.pop()
    print(element)
    return

def test_array():
    xs = [3, 2, 1, 0]
    print(
        xs.pop()
    )

def test_queue():
    queue = Queue()
    queue.enqueue(0)
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    # queue: 3, 2, 1, 0 <- front
    # stack:
    # 3 <- peek
    # 2
    # 1
    # 0
    print(
        queue.storage.storage
    )
    print(
        queue.front()
    )
    print(queue.dequeue())
    print(
        queue.storage.storage
    )
    print(
        queue.front()
    )
    return

# test_queue()

# test_stacks()
# test_array()
main()
