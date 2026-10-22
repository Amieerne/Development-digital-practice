def affiche (t,n):
    for i in range (n):
        print(t[i])
m=int(input(" Donner dimension : "))
v=[int]*m
for i in range (m):
    print("Donner l'element d'indice",i)
    v[i]=int(input())
affiche(v,m)

