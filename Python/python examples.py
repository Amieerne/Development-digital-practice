
#------ Listes ------

n=int(input("Donner dimension :"))
t=[int]*n
for i in range(0,n,1):
    print("Donner", "l'indice  :",i)
    t[i]=int(input())
#Operations
print("La longueuer est : ",len(t))
print("La somme est : ",sum(t))
print("Le max est : ",max(t))
print("le min est : ",min(t))

#ichouf wach 1 existe f la liste ou non
print("Indice de 1:", t.index(1))

#ch7al mn mra kayn 1
print("Nombre:", t.count(1))

#Reverse Tableau
t.reverse()
print("tableau inverse :")

#tertib dyal liste
t.sort()
for x in t:
    print(x)

#ajouter un nb dans la liste
for x in t:
    print(x)
t.insert(2, 12) #hnaya ayzid 12 f indice 2

#supprimer un nombre , t9dr tkhtar l'indice f west ()
for x in t:
    print(x)
t.pop()

#supprimer un nombre lwl li l9at
for x in t:
    print(x)
t.remove(1)






