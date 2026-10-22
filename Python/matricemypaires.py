l=int(input("Donner dimension lignes :"))
c=int(input("Donner dimension colones :"))
print("Donner les elements :")
s=0
k=0
t=[[int(input())for i in range(c)]for j in range(l)]
for i in range(l):
    for j in range(c):
        print(format(t[i][j],"<3"),end="")
    print()
for i in range(0,l):
    for i in range(0,c):
        if(t[i][j]%2==0):
            s=s+t[i][j]
            k=k+1
            n=s/k
print(n)