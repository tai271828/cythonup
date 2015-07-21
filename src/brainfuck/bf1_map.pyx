#cython: overflowcheck=False
from __future__ import print_function
from libcpp.map cimport map
import sys
cdef:
    map[int, int] cells
    int i, p, cnt
P = open(sys.argv[1], "r").read()
i=p=0
while i < len(P):
    c = P[i]    
    p += (c == '>') - (c == '<')
    cells[p] = (cells[p] + (c == '+') - (c == '-'))&0xff
    if c=='.':
        print(chr(cells[p]), end="")
    elif c==',':
        cells[p] = ord(sys.stdin.read(1))
    elif c=='[' and not cells[p]: 
        cnt = -1
        while cnt:
            i+=1
            cnt += (P[i]==']') - (P[i]=='[')          
    elif c==']' and cells[p]:
        cnt = -1
        while  cnt:
            i-=1
            cnt += (P[i]=='[') - (P[i]==']')        
    i+=1