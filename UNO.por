programa
{
	inclua biblioteca Tipos --> tip
	inclua biblioteca Util --> u 
	inclua biblioteca Texto --> tx
	cadeia topo_carta,interior1_carta,interior2_carta,interior3_carta,numero_carta,fundo_carta, cor, carta = ""
	cadeia deck_jogador[108][2], cartas_usadas[108][3]
	const cadeia CORES[5] = {"VERMELHO","AMARELO","VERDE","AZUL","ESPECIAL"}
	const cadeia CARTAS[15] = {" 0"," 1"," 2"," 3"," 4"," 5"," 6"," 7"," 8"," 9"," Ѳ"," Ѻ","+2"," Ͼ","+4"}
	const inteiro QNT_CARTAS[2] = {2,4}						
	inteiro numero
	

	 
	
	funcao inicio()
	{
		sorteio_carta(1)
		carta_mesa(carta)
		cartas_jogador(2)
		
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
	funcao sorteio(inteiro n){
		para (inteiro i = 1; i < n; i++){
			faca{
				numero = u.sorteia(0, 14)
			}enquanto(cartas_usadas[numero][1] != CORES[4] e tip.cadeia_para_inteiro(cartas_usadas[numero][2], 10) == QNT_CARTAS[0] ou cartas_usadas[numero][1] == CORES[4] e tip.cadeia_para_inteiro(cartas_usadas[numero][2], 10) == QNT_CARTAS[1])
			cartas_usadas[i][0] = 
		}
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
		para(inteiro i = 1; i < qnt_cartas; i++){

			sorteio_carta(qnt_cartas)
			deck_jogador[i-1][0] = carta
			deck_jogador[i-1][1] = cor
			
			topo_carta += "▄▄▄▄▄▄▄▄▄▄▄ "
			interior1_carta += "▌▒▒▒▒▒▒▒▒▒▐ "
			interior2_carta += "▌▒▒▒   ▒▒▒▐ "
			interior3_carta += "▌▒▒     ▒▒▐ "
			numero_carta += "▌▒  "+deck_jogador[i-1][0]+"   ▒▐ "
			fundo_carta += "▀▀▀▀▀▀▀▀▀▀▀ "
		}
	     escreva(topo_carta,"\n",interior1_carta,"\n",interior2_carta,"\n",interior3_carta,"\n",numero_carta,"\n",interior3_carta,"\n",interior2_carta,"\n",interior1_carta,"\n",fundo_carta,"\n")
		escreva(deck_jogador[0][1],"\n")	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1385; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {cartas_usadas, 7, 30, 13};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, matriz, funcao;
 */