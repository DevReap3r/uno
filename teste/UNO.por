programa
{
	caracter carta
	cadeia cor 
	funcao inicio()
	{
		escreva ("Qual carta deseja jogar?: ")
		leia (carta)
		escreva("\nQual cor deseja?: ")
		leia(cor)
		carta_mesa()
	}
	funcao carta_mesa()
	{
		
	     escreva("▄▄▄▄▄▄▄▄▄▄▄\n")
		escreva("▌▒▒▒▒▒▒▒▒▒▐\n")
		escreva("▌▒▒▒   ▒▒▒▐\n")
		escreva("▌▒▒     ▒▒▐\n")
		escreva("▌▒   ",carta,"   ▒▐\n")
		escreva("▌▒▒     ▒▒▐\n")
		escreva("▌▒▒▒   ▒▒▒▐\n")
		escreva("▌▒▒▒▒▒▒▒▒▒▐\n")
		escreva("▀▀▀▀▀▀▀▀▀▀▀\n")
		escreva(cor)	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 482; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */