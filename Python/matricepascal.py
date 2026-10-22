l=int(input("Donner L :"))
j=0
t=[[" "for i in range(l)]for j in range(l)]
for i in range(l):
    t[i][0]=1
for i in range(l):
    for j in range(l):
        if(i==j):
            t[i][j]=1
for i in range(2,l):
    for j in range(1,i):
        t[i][j]=t[i-1][j]+t[i-1][j-1]
for i in range(l):
    for j in range(i+1):
        print(format(t[i][j],"<3"),end="")
    print()