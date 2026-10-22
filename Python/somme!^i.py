x=int(input("donner x :"))
n=int(input("donner n :"))
s=0
p=1
for i in range(1,n,1):
    p=p*x
    s=s+p
print(s)