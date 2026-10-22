def parfait(n):
    for i in range (1,n):
        s=0
        if(n % i ==0):
            s=s+i
        b=False
        if (s==n):
            b=True
    return b
a=int(input("Donner a :"))
b=parfait(a)
if(b==True):
    print(" il est parfait")
else :
    print("n'est pas parfait")
