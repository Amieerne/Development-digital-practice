def parfait(n):
    s=0
    for i in range(1,n):
        if(n % i == 0):
            s=s+i
        if(s==n):
            print("Parfait")
        else:
            print("pas parfait")
n=int(input("Donner n :"))
parfait(n)
