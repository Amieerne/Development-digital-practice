def somme (t,n):
    s=0
    for i in range (n):
        s=s+t[i]
    return s
m=int(input(" Donner dimension : "))
v=[int]*m
for i in range (m):
    print("Donner l'element d'indice",i)
    v[i]=int(input())
ss=somme(v,m)
print(ss)
