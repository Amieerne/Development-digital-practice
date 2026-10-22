def suite (n):
    s=0
    for i in range (1,n+1):
        s=s+1/2*i
    return s
a=int(input("Donner a :"))
r=suite(a)
print(r)