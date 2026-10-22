def produit(t,n):
    p=1
    for i in range (0,n):
        if(t[i] % 2== 0):
            p=p*t[i]
    return p
m=int(input("Donner m :"))
v=[int]*m
for i in range(0,m):
    print("Donner l'element  d'indice i :",i)
    v[i]=int(input())
r=produit(v,m)
print(r)

