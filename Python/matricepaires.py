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
    for j in range(0,c):
        if(t[i][j] % 2 ==0):
            s=s+t[i][j]
        else:
            p=p*t[i][j]
print(s,p)