x=int(input("donner x :"))
n=int(input("donner n :"))
s=0
p=1
a=1
for i in range(1,n,1):
    a=a*x
    p=p*i
    s=s+(a/x)
print(s)