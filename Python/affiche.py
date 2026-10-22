N=int(input("donner N:"))
T=[int]*N
for i in range(0,N,1):
    print("donner"," element de l'indice :",i)
    T[i] = int(input())
    T[0]=20
    T[N-1]=40
for i in range(0, N, 1):
  print(T[i])