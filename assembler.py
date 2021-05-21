#!/usr/bin/env python3
cmds = []
string = []
co = {'add':'0001', 'adc':'0001', 'adz':'0001', 'adl' : '0001','adi':'0000', 'ndu':'0010', 'ndc':'0010', 'ndz':'0010', 'lw':'0100', 'sw':'0101', 'lm':'1100', 'sm':'1101', 'lhi':'0011', 'beq':'1000', 'jal':'1001', 'jlr':'1010', 'jri':'1011', 'la':'1110', 'sa' : '1111'}
ex = {'add':'000', 'adc':'010', 'adz':'001', 'adl' : '011', 'ndu':'000', 'ndc':'010', 'ndz':'001'}
r = {'r0':'000','r1':'001','r2':'010','r3':'011','r4':'100','r5':'101','r6':'110','r7':'111'}
with open('code.asm','r') as f:
	cmds = f.readlines()
	for cmd in cmds:
		if cmd == '\n':
			break
		else:
			a = cmd.strip().replace(",", " ").split()
			if a[0] == 'add' or a[0] == 'adc' or a[0] == 'adz' or a[0] == 'adl' or a[0] == 'ndu' or a[0] == 'ndc' or a[0] == 'ndz':
				string.append(co[a[0]]+r[a[2]]+r[a[3]]+r[a[1]]+ex[a[0]])
			elif a[0] == 'adi':
				string.append(co[a[0]]+r[a[2]]+r[a[1]]+a[3])
			elif a[0] == 'sm' or a[0] == 'lm' or a[0] == 'lhi' or a[0] == 'jal' or a[0] == 'la' or a[0] == 'sa' or a[0] == 'jri':
				string.append(co[a[0]]+r[a[1]]+a[2])
			elif a[0] == 'lw' or a[0] == 'sw' or a[0] == 'beq':
				string.append(co[a[0]]+r[a[1]]+r[a[2]]+a[3])
			elif a[0] == 'jlr':
				string.append(co[a[0]]+r[a[1]]+r[a[2]]+'000000')

			
with open('imemory.h','w') as f:
	string = [hex(int(i[:4], 2)).replace('0x', '')+hex(int(i[4:8], 2)).replace('0x', '')+hex(int(i[8:12], 2)).replace('0x', '')+hex(int(i[12:], 2)).replace('0x', '')+' //'+j.rstrip() for i,j in zip(string, cmds)]	
	f.writelines(["%s\n" %item for item in string])

length = len(list(string))-1

val=[]
with open('imemory.v', 'r') as write:
	val=write.readlines()


with open('imemory.v', 'w') as write:
	val[31]= f'reg [`datasize-1:0] mem [0:{length}];\n'
	write.writelines(val)

