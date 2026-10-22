
#-------- Chaîne de caractères ---------

#Kat7seb ch7al mn "salam" kayna
ch = "salam mohamad salam karim "
print(ch.count("salam", 6, 28))

#Fin katyna (katbda)salam
ch="mohamad salam "
print(ch.find("salam"))

#fhal find ms ila mal9ahach kayrj3 error
ch = "mohamad salam "
print(ch.index("salam"))

#kadir kola kelma bodha
ch = "salam mohamad salam karim"
mots = ch.split(' ')
for mot in mots:
    print(mot)

#katred kolchi miniscule
ch = "salam mohamad"
print(ch.lower())

#katred kolchi maj
print(ch.upper())

#lhrf lwl ktrdo maj
print(ch.capitalize())

#hadi ila kan kolxi nb at3ti true , horof wla espace at3ti false
print(ch.isnumeric())

#ila kan text kaybda b bonjour alors true sinon false
ch = "salam salma "
print(ch.startswith("bonjour"))

#katbdel ay salma b bonjour
ch="salam salma salam ana"
print(ch.replace("salam","bonjour"))
