n=int(input("Donner dimension :"))
t=[int]*n
for i in range(0,n,1):
    print("Donner", "l'indice  :",i)
    t[i]=int(input())
for i in range(0,n,1):
    print(t[i])