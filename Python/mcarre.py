l=int(input("Donner dimension  :"))
print("Donner les elements :")
t=[[int(input())for i in range(l)]for j in range(l)]
for i in range(l):
    for j in range(l):
        print(format(t[i][j],"<3"),end="")
    print()