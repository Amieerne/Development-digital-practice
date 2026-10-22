a=True
b=False
c=True
a=b or a
b=a and c
c=b and not a
a=c or b
b=a and b
print(a)
print(b)
print(c)