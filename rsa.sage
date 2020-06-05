def pol(n):
       a = mod(2, n)
       j = 2
       g = 1
       while g == 1:
              a = a ^ j
              j+=1
              g = ZZ(gcd(a-1, n))
              if g > 1:
                     break
       return g


def decode_into_number(p, q, c, n, e):
       phiN = (p-1)*(q-1)
       d = mod((e^-1), phiN)
       return pow(c,d,n)

def decode(n):
       n = ZZ(n)
       L = str()
       v = []
       while n != 0:
              L = L + chr(n % 256)
              n //=256
       return str().join(L)

n = 220128835277449925107431266612427384407262202305202431607111 #Prime we are factoring
p = pol(n) #First factor of n
q = n/p #Second factor of n
print(p)
print(q)


c = 16992147835794015657284498152956801795162802301549954179440 #Ciphertext
e = 128024737561552881724963970278037549376957617171184078187307
num = decode_into_number(p, q, c, n, e)
print(num)

plaintext = decode(num)
print(plaintext)
