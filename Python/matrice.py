l=int(input("Donner dimension lignes :"))
c=int(input("Donner dimension colones :"))
print("Donner les elements :")
t=[[int(input())for i in range(l)]for j in range(c)]
for i in range(l):
    for j in range(c):
        print(format(t[i][j],"<3"),end="")
    print()