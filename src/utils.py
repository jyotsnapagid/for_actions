import sys
import math


def is_prime(n):
    if n < 0:
        return 'Negative numbers are not allowed'
    if n <= 1:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(2, int(math.sqrt(n)) + 1):
        if n % i == 0:
            return False
    return True


def cubic(a):
    return a * a * a


def say_hello(name):
    return "Hello, " + name

if __name__ == "__main__":
    print(say_hello(sys.argv[1]))
