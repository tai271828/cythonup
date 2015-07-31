def fib(int n):
    cdef int i
    cdef int a=0, b=1
    for i in range(n):
        a, b = a + b, a
    return a


if __name__ == '__main__':
    import sys
    arg, numiter = map(int, sys.argv[1:])
    for i in range(numiter):
        fib(arg)
