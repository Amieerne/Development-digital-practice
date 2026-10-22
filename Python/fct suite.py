def suite (n):
    s=0
    for i in range (0,n+1,1):
        s=s+i
    return s
a=int(input("Donner a :"))
z=suite(a)
print(z)
