#!/home/cpa/miniconda3/bin/python3

# Colores para que se vea chido
W  = '\033[0m'  # white (normal)
R  = '\033[31m' # red
G  = '\033[32m' # green
O  = '\033[33m' # orange
B  = '\033[34m' # blue
P  = '\033[35m' # purple


print(O+"	   ______  _______ _______ _______")
print(O+"	   |_____] |_____| |______ |______")
print(O+"	   |_____] |     | ______| |______")
print(R+"_______  _____  _     _ __   _ _______ _______  ______")
print(R+"|       |     | |     | | \  |    |    |______ |_____/")
print(R+"|_____  |_____| |_____| |  \_|    |    |______ |    \_")
print(B+"V 0.9.1, C. Peralta 2016-2021, GNU Affero General Public License v3.0\n"+W)


re_run = 'Y' # continuador
valid_nt = {'A','C','G','T','N'} # nucleotidos validos 

def encrypt(string, length): # Separa por espacios gracias a stack overflow
    return (' '.join(string[i:i+length] for i in range(0,len(string),length)))
def encrypt2(string, length): # Separa por espacios gracias a stack overflow
    return ('\n'.join(string[i:i+length] for i in range(0,len(string),length)))

while re_run == 'Y' :

	seq = input("\nWrite or paste a DNA sequence: " ) 
	seq = seq.upper().replace(" ","") # quita espacios convierte a mayusculas
	
	error = False
	for i in range(len(seq)): #checa que la secuencia sea valida
		if seq[i] not in valid_nt:
			print ("\nERROR: Not a valid DNA sequence, check for spelling")
			error = True
			break
		else : continue	
	
	if error == False:			 
		print ("\nYour sequence:"+B+ seq+W+"\n")
		print ('A = ',seq.count('A'))
		print ('C = ',seq.count('C'))
		print ('G = ',seq.count('G'))
		print ('T = ',seq.count('T'))
		print ('N = ',seq.count('N'))
		print ("Total bases= ", len(seq))
		cgContent = (seq.count('C') + seq.count('G'))/ float(len(seq))* 100
		print ("\nCG content= " , "{0:0.1f}".format(cgContent) ,"%" )
		print ("CpG dinucleotides= ", seq.count('CG'))
		cgSeq = seq.lower().replace('cg','CG')
		cgSeq = encrypt(cgSeq,10)
		cgSeq = encrypt2(cgSeq,55)
		cgSeq = cgSeq.replace('C', R+'C'+W) 
		cgSeq = cgSeq.replace('G', R+'G'+W) 
		print ("\nCpG EZ Finder:\n" + cgSeq)
	
	re_run = input("\nCheck new sequence? (yes/no): ")
	re_run = re_run.upper().strip() # quita espacios del principio y el final, mayusculas
	re_run = re_run[0] # solo toma el primer caracter
	
print (B+"\nBye! ;)\n"+W)
