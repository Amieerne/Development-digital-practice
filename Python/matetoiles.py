l=int(input("Donner L :"))
t=[[" "for i in range(l)]for j in range(l)]
for i in range(l):
    for j in range(0,i+1):
        t[i][j]='*'
for i in range(l):
    for j in range(i+1):
        print(format(t[i][j],"<3"),end="")
    print()