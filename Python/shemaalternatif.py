a=float(input("Donner a:"))
b=float(input("Donner b:"))
if  (a==0):
    if(b==0):
        print("L'ensemble R")
    else:
        print("L'ensemble vide")
else:
    x=(-1*b)/a
    print(x)