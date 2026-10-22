def diviseur(n):
    b=False
    if (21 % n==0):
        b=True
    return b
a=int(input("Donner a :"))
b=diviseur(a)
if ( b==True):
    print("N est diviseur de 21 .")
else :
    print("N n'est pas diviseur")