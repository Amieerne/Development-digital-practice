def absolue(a):
    if(a>0):
        abs=a
    else:
        abs=-1*a
    return abs
def sommeabs(x,y):
    s=absolue(x)+absolue(y)
    return s
X=int(input("Donner X :"))
Y=int(input("Donner Y :"))
z=sommeabs(X,Y)
print(z)
