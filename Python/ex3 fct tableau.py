def negatif(t,n):
    nb=0
    for i in range (0,n):
        if(t[i]<0):
            nb=nb+1
    return nb
m=int(input("Donner m :"))
v=[int]*m
for i in range(0,m):
    print("Donner l'element  d'indice i :",i)
    v[i]=int(input())
r=negatif(v,m)
print(r)

