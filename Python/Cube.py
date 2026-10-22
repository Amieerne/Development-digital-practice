m=int(input("donner m :"))
n=int(input("donner n :"))
p=1
for i in range(n,m,1):
    p=p*(i^3)
print(p)