from math import *

a=float(input("Donner le nombre a:"))
b=float(input("Donner le nombre b:"))
c=float(input("Donner le nombre c:"))
d=(b*b)-4*a*c
if  (d>0):
    x1 = (-1 * b) - (sqrt(d)) / (2 * a)
    x2 = (-1 * b) + (sqrt(d)) / (2 * a)
    print(x1)
    print(x2)
elif (d<0):
    print("Aucune solution")
else:
    x = (-1 * b) / 2 * a
    print(x)