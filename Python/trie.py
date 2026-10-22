n=int(input("Donner dimension :"))
t=[int]*n
for i in range(0,n,1):
    print("Donner", "l'indice  :",i)
    t[i]=int(input())
print(t)
for i in range(0,n-1,1):
    for j in range(i+1,n):
        if(t[j]<t[i]):
            z=t[i]
            t[i]=t[j]
            t[j]=z
print(t)