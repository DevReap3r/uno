programa
{
	caracter carta
	cadeia cor, molde_carta 
	funcao inicio()
	{
		carta = '7'
		molde_carta = "▄▄▄▄▄▄▄▄▄▄▄\n▌▒▒▒▒▒▒▒▒▒▐\n▌▒▒▒   ▒▒▒▐\n▌▒▒     ▒▒▐\n▌▒      ▒▐\n▌▒▒     ▒▒▐\n▌▒▒▒   ▒▒▒▐\n▌▒▒▒▒▒▒▒▒▒▐\n▀▀▀▀▀▀▀▀▀▀▀\n"
		carta_mesa('c',"AMARELO")
		
	}
	funcao carta_mesa(caracter n, cadeia c)
	{
	     escreva(molde_carta)
		escreva(c)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 252; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */