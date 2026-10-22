def produit(a,b,c,d,e):
    p=1
    if ( a % 2 ==0):
        p=p*a
    if ( b % 2 ==0):
        p=p*b
    if ( c % 2 ==0):
        p=p*c
    if ( d % 2 ==0):
        p=p*d
    if ( e % 2 ==0):
        p=p*e
    return p
e=int(input("Donner e :"))
f=int(input("Donner f :"))
g=int(input("Donner g :"))
h=int(input("Donner h :"))
i=int(input("Donner i :"))
r=produit(e,f,g,h,i)
print(r)


