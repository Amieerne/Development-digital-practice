l=int(input("Donner l :"))
t=[[int(input())for i in range(l)]for j in range(l)]
for i in range(0,l):
    for j in range(0,l):
        if(i==j):
            t[i][j]='*'
        if(i>j):
            t[i][j]='*'
