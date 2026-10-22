def moyenne(t,n):
    s=0
    nb=0
    for i in range (0,n):
        if(t[i] % 3==0):
            s=s+t[i]
            nb=nb+1
            m=s/nb
    return m
m=int(input("Donner m :"))
v=[int]*m
for i in range(0,m):
    print("Donner l'element  d'indice i :",i)
    v[i]=int(input())
r=moyenne(v,m)
print(r)

