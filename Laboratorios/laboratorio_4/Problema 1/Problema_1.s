.data
array: .word 0, 10, 20, 30, 40, 50, 60, 70, 80, 90

.text
.global _start
_start:
	MOV r0, #0 // Contador

	MOV r1, #50 // Un valor específico

loop:
	CMP r0, #10 // Recorre de 0 a 9, cuando es menor a 10
	BGE endloop

	ldr r2, =array        // Dirección base del array
	LSL r4, r0, #2        // r4 = r0 * 4
	ADD r4, r2, r4        // r4 = dirección base + desplazamiento
	LDR r3, [r4]          // Carga el valor desde la dirección calculada

	CMP r3, r1            // Compara array[i] con y
	BGE mult

	B sum

mult:
	MOV r5, r3
	MUL r3, r5, r1
	B last

sum:
	ADD r3, r3, r1
	B last

last:
	LSL r4, r0, #2        // r4 = r0 * 4
	ADD r4, r2, r4        // r4 = dirección base + desplazamiento
	STR r3, [r4]          // Guarda el valor actualizado
	ADD r0, r0, #1 
	B loop

endloop:
