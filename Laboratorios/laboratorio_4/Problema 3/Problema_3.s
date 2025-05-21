.global _start
_start:

	
	MOV r0, #20 //Valor inicial de contador(posicion del sprite)
	MOV r1, #0x2000 //Direccion de memoria de la posicion
	STR r0, [r1] //Guarda la posicion initial
	MOV r3, #0x1000 //Direccion de memoria de la tecla

	loop:
	
		LDR r2, [r3] //Carga la tecla pulsada
		
		//Compara si se pulso la tecla arriba
		MOV r4, #0xE048
		CMP r2, r4
		BEQ flechaArriba
		
		//Compara si se pulso la tecla abajo
		MOV r4, #0xE050
		CMP r2, r4
		BEQ flechaAbajo
		
		//Repite loop si no se presiono ninguna tecla
		B loop
		
		flechaArriba: //Suma 1 al contador si se pulso la tecla arriba
			ADD r0, r0, #1
			B storeCount
		flechaAbajo: //Resta 1 al contador si se pulso la tecla abajo
			SUB r0, r0, #1
			B storeCount
		storeCount: //Guarda en memoria el contador modificado
			STR r0, [r1, #0x500]
			B loop




