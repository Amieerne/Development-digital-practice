a=False
b=True
d=1
e=2
f=3
if(a and d==1):
    e=e+1
    f=f+1
    if(e==3 or not b):
        e=e+2
        f=f+2
    else:
        e=e+3
        f=f+3
print(e)
print(f)