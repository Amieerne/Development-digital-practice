def carre (n):
    c = n * n
    return c
def produit(a, b):
    p = a * b
    return p
def pr():
    a = int(input("donner a : "))
    b = int(input("donner b : "))
    r = produit(carre(a), carre(b))
    print(r)
pr()