n=int(input("donner n :"))
s=0
p=1
for i in range(1,n,1):
    p=p*(2*i)
    s=s+p
print(s)