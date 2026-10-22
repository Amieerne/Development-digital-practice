l=int(input("Donner dimension :"))
print("Donner les elements :")
t=[[int(input())for i in range(l)]for j in range(l)]
for i in range(l):
    for j in range(l):
        print(format(t[i][j],"<3"),end="")
    print()
s=0
d=0
for i in range(l):
    for j in range(l):
        if(i==j):
            s=s+t[i][j]
        if(i+j==l-1):
            d=d+t[i][j]
print(s,d)