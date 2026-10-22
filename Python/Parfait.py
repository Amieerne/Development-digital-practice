n=int(input("donner n :"))
s=0
for i in range(1,n-1,1):
    if(n%i==0):
        s=s+i
if(s==n):
    print("Ce nombre est parfait")
else:
    print("ce nombre n'est pas parfait")