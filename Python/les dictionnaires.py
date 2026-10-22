
#-------- Les dictionaires -------

a = {1: "karimi", 2: "Hafidi", 3: "Nabil"}
print(a)

a = {1: "karimi", 2: "Hafidi", 3: "Nabil"}
print(a[2])

a = {1: "karimi", 2: "Hafidi", 3: "Nabil"}
for key in a:
    print(key)

a = {1: "karimi", 2: "Hafidi", 3: "Nabil"}
for key in a:
    print(a[key])

a = {1: "karimi", 2: "Hafidi", 3: "Nabil"}
a[1]="Rachid"
print(a)

a = {1: "karimi", 2: "Hafidi", 3: "Nabil"}
print(len(a))

a = {1: "karimi", 2: "Hafidi", 3: "Nabil"}
print(1 in a)

keys=[1,2,3]
values=["karimi","Hafidi","Nabil"]
a=dict(zip(keys,values))
print(a)

a = {1: "karimi", 2: "Hafidi", 3: "Nabil"}
print(a.keys())
print(a.values())
print(a.items())


