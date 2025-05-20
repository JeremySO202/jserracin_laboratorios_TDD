.global _start
_start:

	MOV r0, #5	//Valor a obtener factorial
	MOV r1, #1 //Valor de inicio

	loopfact:
		CMP r0, #1	//Compara si el valor a resolver es igual a 1
		BLE endloop //Si es igual o menor detiene el loop
		MUL r1, r0, r1 //Multiplica el valor actual por el resultado, ej: 1 * 5 * 4 * 3 * 2
		SUB r0, r0, #1 //Resta al valor actual
		B loopfact //Repite el proceso


	endloop:



