programa{
	
	inclua biblioteca Util --> u 
	inclua biblioteca Texto --> tx
	inclua biblioteca Tipos --> tip
	cadeia topo_carta,interior1_carta,interior2_carta,interior3_carta,numero_carta,fundo_carta, cor_carta
	cadeia deck_mesa[2], deck_jogador[108][2], deck_pc[108][2]
	cadeia CARTAS[54][3] = {{"+4","ESPECIAL","4"},{" Ͼ","ESPECIAL","4"}, {" 0","VERMELHO","1"},{" 0","VERDE","1"},{" 0","AMARELO","1"},{" 0","AZUL","1"},{" 1","VERMELHO","2"},{" 1","VERDE","2"},{" 1","AMARELO","2"},{" 1","AZUL","2"},{" 2","VERMELHO","2"},{" 2","VERDE","2"},{" 2","AMARELO","2"},{" 2","AZUL","2"},{" 3","VERMELHO","2"},{" 3","VERDE","2"},{" 3","AMARELO","2"},{" 3","AZUL","2"},{" 4","VERMELHO","2"},{" 4","VERDE","2"},{" 4","AMARELO","2"},{" 4","AZUL","2"},{" 5","VERMELHO","2"},{" 5","VERDE","2"},{" 5","AMARELO","2"},{" 5","AZUL","2"},{" 6","VERMELHO","2"},{" 6","VERDE","2"},{" 6","AMARELO","2"},{" 6","AZUL","2"},{" 7","VERMELHO","2"},{" 7","VERDE","2"},{" 7","AMARELO","2"},{" 7","AZUL","2"},{" 8","VERMELHO","2"},{" 8","VERDE","2"},{" 8","AMARELO","2"},{" 8","AZUL","2"},{" 9","VERMELHO","2"},{" 9","VERDE","2"},{" 9","AMARELO","2"},{" 9","AZUL","2"},{"+2","VERMELHO","2"},{"+2","VERDE","2"},{"+2","AMARELO","2"},{"+2","AZUL","2"},{" Ѳ","VERMELHO","2"},{" Ѳ","","2"},{" Ѳ","AMARELO","2"},{" Ѳ","AZUL","2"},{" Ѻ","VERMELHO","2"},{" Ѻ","VERDE","2"},{" Ѻ","AMARELO","2"},{" Ѻ","AZUL","2"}}					
	inteiro numero,carta_jogada,qnt_cartas_jogador = 0,qnt_cartas_pc = 0  
	cadeia jogador
	cadeia play

	funcao iniciar_jogo(){
		limpa()
		escolha(u.sorteia(0, 1)){
			caso 0:
				jogador = "PC"
				pare
			caso 1:
				jogador = "JOGADOR"
				pare
		}
		distribuicao_cartas(7, 'J')
		distribuicao_cartas(7, 'P')
		distribuicao_cartas(1, 'M')
		mostrar_cartas_pc(7)
		mostrar_cartas_mesa(deck_mesa[0], deck_mesa[1])
		mostrar_cartas_jogador(7)
	}
	funcao distribuicao_cartas(inteiro n, caracter player){
		para (inteiro s = 0; s < n; s++){
			faca{
				numero  = u.sorteia(0, 53)
			}enquanto (CARTAS[numero][2] == "0")
			se (player == 'M'){
				enquanto (CARTAS[numero][2] == "0" ou numero <= 1 ou numero >=42){
					numero  = u.sorteia(0, 53)
				}
			}
			CARTAS[numero][2] = tip.inteiro_para_cadeia(tip.cadeia_para_inteiro(CARTAS[numero][2],10) - 1, 10)
			escolha(player){
	 			caso 'M':
					deck_mesa[0] = CARTAS[numero][0]
					deck_mesa[1] = CARTAS[numero][1]
					pare
				caso 'J':
					deck_jogador[s][0] = CARTAS[numero][0]
					deck_jogador[s][1] = CARTAS[numero][1]
					qnt_cartas_jogador++
					pare
				caso 'P':
					deck_pc[s][0] = CARTAS[numero][0]
					deck_pc[s][1] = CARTAS[numero][1]
					qnt_cartas_pc++
					pare
			}
		}
	}
	funcao mostrar_cartas_mesa(cadeia carta,cadeia cor){
		topo_carta = tx.preencher_a_esquerda(' ',48, "▄▄▄▄▄▄▄▄▄▄▄ ")
		interior1_carta = tx.preencher_a_esquerda(' ',48, "▌▒▒▒▒▒▒▒▒▒▐ ")
		interior2_carta = tx.preencher_a_esquerda(' ',48,"▌▒▒▒   ▒▒▒▐ ")
		interior3_carta = tx.preencher_a_esquerda(' ',48,"▌▒▒     ▒▒▐ ")
		numero_carta = tx.preencher_a_esquerda(' ',48,"▌▒  "+carta+"   ▒▐ ")
		fundo_carta = tx.preencher_a_esquerda(' ',48,"▀▀▀▀▀▀▀▀▀▀▀ ")
		escreva(topo_carta+"\n"+interior1_carta+"\n"+interior2_carta+"\n"+interior3_carta+"\n"+numero_carta+tx.preencher_a_esquerda(' ',34, "TURNO: "+ jogador)+"\n"+interior3_carta+"\n"+interior2_carta+tx.preencher_a_esquerda(' ',38, "COMPRAR CARTA(0) ")+"\n"+interior1_carta+"\n"+fundo_carta+"\n")
		escreva(tx.preencher_a_esquerda(' ',45, cor+"\n"))
	}
	funcao mostrar_cartas_pc(inteiro qnt_cartas){
		topo_carta = "▄▄▄▄▄▄▄▄▄▄▄ "
		interior1_carta = "▌▒▒▒▒▒▒▒▒▒▐ "
		interior2_carta = "▌▒▒▒▒▒▒▒▒▒▐ "
		interior3_carta = "▌▒▒▒▒▒▒▒▒▒▐ "
		numero_carta = "▌▒▒▒▒▒▒▒▒▒▐ "
		fundo_carta = "▀▀▀▀▀▀▀▀▀▀▀ "
		para(inteiro i = 1; i<qnt_cartas;i++){
			topo_carta += "▄▄▄▄▄▄▄▄▄▄▄ "
			interior1_carta += "▌▒▒▒▒▒▒▒▒▒▐ "
			interior2_carta += "▌▒▒▒▒▒▒▒▒▒▐ "
			interior3_carta += "▌▒▒▒▒▒▒▒▒▒▐ "
			numero_carta += "▌▒▒▒▒▒▒▒▒▒▐ "
			fundo_carta += "▀▀▀▀▀▀▀▀▀▀▀ "
		}
		escreva(topo_carta+"\n"+interior1_carta+"\n"+interior2_carta+"\n"+interior3_carta+"\n"+numero_carta+"\n"+interior3_carta+"\n"+interior2_carta+"\n"+interior1_carta+"\n"+fundo_carta)
		escreva("\n")
	}
	funcao mostrar_cartas_jogador(inteiro qnt_cartas){
		topo_carta = "▄▄▄▄▄▄▄▄▄▄▄ "
		interior1_carta = "▌▒▒▒▒▒▒▒▒▒▐ "
		interior2_carta = "▌▒▒▒   ▒▒▒▐ "
		interior3_carta = "▌▒▒     ▒▒▐ "
		numero_carta = "▌▒  "+deck_jogador[0][0]+"   ▒▐ "
		fundo_carta = "▀▀▀▀▀▀▀▀▀▀▀ "
		cor_carta = deck_jogador[0][1] +"(1)"
		para(inteiro i = 1; i<qnt_cartas;i++){
			topo_carta += "▄▄▄▄▄▄▄▄▄▄▄ "
			interior1_carta += "▌▒▒▒▒▒▒▒▒▒▐ "
			interior2_carta += "▌▒▒▒   ▒▒▒▐ "
			interior3_carta += "▌▒▒     ▒▒▐ "
			numero_carta += "▌▒  "+deck_jogador[i][0]+"   ▒▐ "
			fundo_carta += "▀▀▀▀▀▀▀▀▀▀▀ "
			cor_carta += tx.preencher_a_esquerda(' ',12, deck_jogador[i][1]+"("+(i+1)+")")
		}
		escreva(topo_carta+"\n"+interior1_carta+"\n"+interior2_carta+"\n"+interior3_carta+"\n"+numero_carta+"\n"+interior3_carta+"\n"+interior2_carta+"\n"+interior1_carta+"\n"+fundo_carta)
		escreva("\n"+cor_carta)
	}
	funcao logo(){
		escreva(" **     ** ****     **   ******* \n")
		escreva("/**    /**/**/**   /**  **/////** \n")
		escreva("/**    /**/**//**  /** **     //** \n")
		escreva("/**    /**/** //** /**/**      /** \n")
		escreva("/**    /**/**  //**/**/**      /** \n")
		escreva("/**    /**/**   //****//**     ** \n")
		escreva("//******* /**    //*** //******* \n")
		escreva(" ///////  //      ///   /////// \n")
		escreva("COMEÇAR O JOGO? [S/N]\n")
	}
	
	funcao inicio()
	{	
		faca{
			limpa()
			logo()
			leia(play)
		}enquanto(tx.caixa_alta(play) != "S" e tx.caixa_alta(play) != "N")
		se (tx.caixa_alta(play) == "N") 
			limpa()
		senao{
			iniciar_jogo()
			se (jogador == "PC"){
				
			}senao se(jogador == "JOGADOR"){
				leia(carta_jogada)
				se(carta_jogada == 0){
					comprar_carta(1, 'J')
					
				}senao{
					enquanto(deck_jogador[carta_jogada-1][0] != deck_mesa[0] e deck_jogador[carta_jogada-1][1] != deck_mesa[1]){
						limpa()
						mostrar_cartas_mesa(deck_mesa[0],deck_mesa[1])
						mostrar_cartas_jogador(qnt_cartas_jogador)
						escreva("\n")
					}
				}
			}
				jogar_carta_jogador()				
		}
	}
	funcao jogar_carta_jogador(){
		deck_mesa[0] = deck_jogador[carta_jogada - 1][0]
		deck_mesa[1] = deck_jogador[carta_jogada - 1][1]
		para(inteiro i = 0; i< qnt_cartas_jogador - 1; i++){
			se (i < carta_jogada - 1){
				deck_jogador[i][0] = deck_jogador[i][0]
				deck_jogador[i][1] = deck_jogador[i][1]
			}
			senao se (i > carta_jogada - 1){
				deck_jogador[i-1][0] = deck_jogador[i][0]
				deck_jogador[i-1][1] = deck_jogador[i][1]
			}
		}
		limpa()
		mostrar_cartas_pc(qnt_cartas_pc)
		mostrar_cartas_mesa(deck_mesa[0],deck_mesa[1])
		mostrar_cartas_jogador(qnt_cartas_jogador-1)
	}
	funcao jogar_carta_pc(inteiro c){
		deck_mesa[0] = deck_jogador[c - 1][0]
		deck_mesa[1] = deck_jogador[c - 1][1]
		para(inteiro i = 0; i< qnt_cartas_jogador - 1; i++){
			se (i < c - 1){
				deck_pc[i][0] = deck_pc[i][0]
				deck_pc[i][1] = deck_pc[i][1]
			}
			senao se (i > c - 1){
				deck_pc[i-1][0] = deck_pc[i][0]
				deck_pc[i-1][1] = deck_pc[i][1]
			}
		}
		limpa()
		mostrar_cartas_pc(qnt_cartas_pc - 1)
		mostrar_cartas_mesa(deck_mesa[0],deck_mesa[1])
		mostrar_cartas_jogador(qnt_cartas_jogador)
	}
	funcao comprar_carta(inteiro n, caracter p){
		para (inteiro i = 0; i < n; n++){
			faca{
				numero  = u.sorteia(0, 53)
			}enquanto (CARTAS[numero][2] == "0")
			CARTAS[numero][2] = tip.inteiro_para_cadeia(tip.cadeia_para_inteiro(CARTAS[numero][2],10) - 1, 10)
			escolha(p){
				caso 'J':
					deck_jogador[qnt_cartas_jogador-1][0] = CARTAS[numero][0]
					deck_jogador[qnt_cartas_jogador-1][1] = CARTAS[numero][1]
					qnt_cartas_jogador++
					pare
				caso 'P':
					deck_pc[qnt_cartas_pc][0] = CARTAS[numero][0]
					deck_pc[qnt_cartas_pc][1] = CARTAS[numero][1]
					qnt_cartas_pc++
					pare
			}
			limpa()
			mostrar_cartas_pc(qnt_cartas_pc)
			mostrar_cartas_mesa(deck_mesa[0], deck_mesa[1])
			mostrar_cartas_jogador(qnt_cartas_jogador)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5827; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, matriz, funcao;
 */