def trier(t,n):
    for i in range (0,n-1):
        for j in range (i+1,n):
            if(t[j] < t[i] ):
                z=t[i]
                t[i]=t[j]
                t[j]=z
    for i in range (0,n):
        print(t[i])
m=int(input("Donner m :"))
v=[int]*m
for i in range(0,m):
    print("Donner l'element  d'indice i :",i)
    v[i]=int(input())
trier(v,m)


