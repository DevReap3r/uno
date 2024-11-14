programa
{
	inclua biblioteca Texto --> tx
	cadeia topo_carta,interior1_carta,interior2_carta,interior3_carta,numero_carta,fundo_carta

	 
	
	funcao inicio()
	{
		topo_carta = "▄▄▄▄▄▄▄▄▄▄▄ "
		interior1_carta = "▌▒▒▒▒▒▒▒▒▒▐ "
		interior2_carta = "▌▒▒▒   ▒▒▒▐ "
		interior3_carta = "▌▒▒     ▒▒▐ "
		numero_carta = "▌▒   9   ▒▐ "
		fundo_carta = "▀▀▀▀▀▀▀▀▀▀▀ "
		carta_mesa('3',"AMARELO",1)
		carta_mesa('5',"vermelho",1)
		
	}
	funcao carta_mesa(caracter carta, cadeia cor, inteiro qnt_cartas)
	{
	     escreva(topo_carta,topo_carta,"\n")
	     escreva(interior1_carta,interior1_carta,"\n")
	     escreva(interior2_carta,interior2_carta,"\n")
	     escreva(interior3_carta,interior3_carta,"\n")
	     escreva(numero_carta,numero_carta,"\n")
	     escreva(interior3_carta,interior3_carta,"\n")
	     escreva(interior2_carta,interior2_carta,"\n")
	     escreva(interior1_carta,interior1_carta,"\n")
	     escreva(fundo_carta,fundo_carta,"\n")
		escreva(cor,"\n")	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 959; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */