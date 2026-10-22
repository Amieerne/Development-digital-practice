x=int(input("donner x :"))
n=int(input("donner n :"))
p=1
for i in range(1,n,1):
    p=p*(x**n)
print(p)