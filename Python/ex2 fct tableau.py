def somme(t,n):
    s=0
    for i in range (0,n):
            s=s+(t[i]*t[i])
    return s
m=int(input("Donner m :"))
v=[int]*m
for i in range(0,m):
    print("Donner l'element  d'indice i :",i)
    v[i]=int(input())
r=somme(v,m)
print(r)

