def verifier (n):
    b=False
    if (n % 2 ==0):
        b=True
    return b
a=int(input("Donner a :"))
bb=verifier(a)
if(bb==True):
    print("Il est paire")
else:
    print("Pas paire")
