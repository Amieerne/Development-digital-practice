def diviseur(t,n):
    nb=0
    for i in range (0,n):
        if(35 % t[i]==0)and(21 % t[i]==0):
            s=s+t[i]
            nb=nb+1
            m=s/nb
    return m
m=int(input("Donner m :"))
v=[int]*m
for i in range(0,m):
    print("Donner l'element  d'indice i :",i)
    v[i]=int(input())
r=diviseur(v,m)
print(r)

