N=int(input("donner N:"))
T=[int]*N
s=0
for i in range(0,N,1):
    print("donner"," element de l'indice :",i)
    T[i] = int(input())
for i in range(0, N, 1):
    if(21%T[i]==0):
        s=s+1
print(s)