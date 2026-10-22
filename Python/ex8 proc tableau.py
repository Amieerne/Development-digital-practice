def remplace(t,n):
    for i in range (0,n):
        if(t[i] < 0 ):
            t[i]=0
    for i in range (0,n):
        print(t[i])
m=int(input("Donner m :"))
v=[int]*m
for i in range(0,m):
    print("Donner l'element  d'indice i :",i)
    v[i]=int(input())
remplace(v,m)


