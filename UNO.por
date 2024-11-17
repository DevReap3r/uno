programa{
	
	inclua biblioteca Util --> u 
	inclua biblioteca Texto --> tx
	inclua biblioteca Tipos --> tip
	cadeia topo_carta,interior1_carta,interior2_carta,interior3_carta,numero_carta,fundo_carta, cor, carta
	cadeia CARTAS[54][3] = {{"+4","ESPECIAL","4"},{" Ͼ","ESPECIAL","4"}, {" 0","VERMELHO","1"},{" 0","VERDE","1"},{" 0","AMARELO","1"},{" 0","AZUL","1"},{" 1","VERMELHO","2"},{" 1","VERDE","2"},{" 1","AMARELO","2"},{" 1","AZUL","2"},{" 2","VERMELHO","2"},{" 2","VERDE","2"},{" 2","AMARELO","2"},{" 2","AZUL","2"},{" 3","VERMELHO","2"},{" 3","VERDE","2"},{" 3","AMARELO","2"},{" 3","AZUL","2"},{" 4","VERMELHO","2"},{" 4","VERDE","2"},{" 4","AMARELO","2"},{" 4","AZUL","2"},{" 5","VERMELHO","2"},{" 5","VERDE","2"},{" 5","AMARELO","2"},{" 5","AZUL","2"},{" 6","VERMELHO","2"},{" 6","VERDE","2"},{" 6","AMARELO","2"},{" 6","AZUL","2"},{" 7","VERMELHO","2"},{" 7","VERDE","2"},{" 7","AMARELO","2"},{" 7","AZUL","2"},{" 8","VERMELHO","2"},{" 8","VERDE","2"},{" 8","AMARELO","2"},{" 8","AZUL","2"},{" 9","VERMELHO","2"},{" 9","VERDE","2"},{" 9","AMARELO","2"},{" 9","AZUL","2"},{"+2","VERMELHO","2"},{"+2","VERDE","2"},{"+2","AMARELO","2"},{"+2","AZUL","2"},{" Ѳ","VERMELHO","2"},{" Ѳ","","2"},{" Ѳ","AMARELO","2"},{" Ѳ","AZUL","2"},{" Ѻ","VERMELHO","2"},{" Ѻ","VERDE","2"},{" Ѻ","AMARELO","2"},{" Ѻ","AZUL","2"}}					
	inteiro numero
	cadeia teste

	funcao sorteio(inteiro n){
			numero  = u.sorteia(0, 53)
			carta = CARTAS[numero][0]
			cor = CARTAS[numero][1]
			CARTAS[numero][2] = tip.inteiro_para_cadeia(tip.cadeia_para_inteiro(CARTAS[numero][2],10) - 1, 10)
			teste = CARTAS[numero][2]
	}
		
	funcao inicio()
	{
		sorteio(1)
		carta_mesa(carta)
		escreva (cor +"\n" + teste)
		//sorteio_carta(1)
		//carta_mesa(carta)
		//cartas_jogador(2)
		
	}
	funcao carta_mesa(cadeia c){
		topo_carta = "▄▄▄▄▄▄▄▄▄▄▄ "
		interior1_carta = "▌▒▒▒▒▒▒▒▒▒▐ "
		interior2_carta = "▌▒▒▒   ▒▒▒▐ "
		interior3_carta = "▌▒▒     ▒▒▐ "
		numero_carta = "▌▒  "+c+"   ▒▐ "
		fundo_carta = "▀▀▀▀▀▀▀▀▀▀▀ "
		escreva(topo_carta,"\n",interior1_carta,"\n",interior2_carta,"\n",interior3_carta,"\n",numero_carta,"\n",interior3_carta,"\n",interior2_carta,"\n",interior1_carta,"\n",fundo_carta,"\n")
	}
	funcao sorteio_carta(inteiro qnt_cartas)
	{
		para(inteiro i = 1; i < qnt_cartas; i++){
			numero = u.sorteia(0, 11)
			
			se (numero >= 10){
				cor = "ESPECIAL"
				escolha(numero){
					caso 10:
						carta = " ○"
					caso 11:
						carta = "+4"
				}
			}senao{
				escolha(u.sorteia(1,4)){
					caso 1:
						cor = "VERMELHO"
					caso 2:
						cor = "VERDE"
					caso 3:
						cor = "AMARELO"
					caso 4:
						cor = "AZUL"
				}
				carta = " " + numero
			}
		}
	}
	funcao cartas_jogador(inteiro qnt_cartas)
	{
		//para(inteiro i = 1; i < qnt_cartas; i++){

			//sorteio_carta(qnt_cartas)
			//deck_jogador[i-1][0] = carta
			//deck_jogador[i-1][1] = cor
			
			//topo_carta += "▄▄▄▄▄▄▄▄▄▄▄ "
			interior1_carta += "▌▒▒▒▒▒▒▒▒▒▐ "
			interior2_carta += "▌▒▒▒   ▒▒▒▐ "
			interior3_carta += "▌▒▒     ▒▒▐ "
			//numero_carta += "▌▒  "+deck_jogador[i-1][0]+"   ▒▐ "
			fundo_carta += "▀▀▀▀▀▀▀▀▀▀▀ "
		}
	    // escreva(topo_carta,"\n",interior1_carta,"\n",interior2_carta,"\n",interior3_carta,"\n",numero_carta,"\n",interior3_carta,"\n",interior2_carta,"\n",interior1_carta,"\n",fundo_carta,"\n")
		//escreva(deck_jogador[0][1],"\n")	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3002; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, matriz, funcao;
 */