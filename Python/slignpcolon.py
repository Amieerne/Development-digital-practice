l=int(input("Donner dimension lignes :"))
c=int(input("Donner dimension colones :"))
print("Donner les elements :")
s=0
p=1
t=[[int(input())for i in range(c)]for j in range(l)]
for i in range(l):
    for j in range(c):
        print(format(t[i][j],"<3"),end="")
    print()
for i in range(0,l):
    for i in range(0,c):
        if(i==0):
            s=s+t[i][j]
        if(j==c):
            p=p*t[i][j]
print(s,p)