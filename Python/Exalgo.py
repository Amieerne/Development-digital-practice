a=1
b=2
if(a<3):
    b=b+1
if(b != 2):
    b=b+1
else:
    b=b+2
    if(b==4):
      b=b+2
      a=a+2
print("a =",a,"b =",b)