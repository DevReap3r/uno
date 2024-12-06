programa{
	
	inclua biblioteca Util --> u 
	inclua biblioteca Texto --> tx
	inclua biblioteca Tipos --> tip
	cadeia topo_carta,uno,interior1_carta,interior2_carta,interior3_carta,numero_carta,fundo_carta, cor_carta, lbl_comprar = "COMPRAR CARTA(0) "
	cadeia deck_mesa[2], deck_jogador[108][2], deck_pc[108][2]
	cadeia CARTAS[54][3] = {{"+4","ESPECIAL","4"},{" Ͼ","ESPECIAL","4"}, {" 0","VERMELHO","1"},{" 0","VERDE   ","1"},{" 0","AMARELO ","1"},{" 0","AZUL    ","1"},{" 1","VERMELHO","2"},{" 1","VERDE   ","2"},{" 1","AMARELO ","2"},{" 1","AZUL    ","2"},{" 2","VERMELHO","2"},{" 2","VERDE   ","2"},{" 2","AMARELO ","2"},{" 2","AZUL    ","2"},{" 3","VERMELHO","2"},{" 3","VERDE   ","2"},{" 3","AMARELO ","2"},{" 3","AZUL    ","2"},{" 4","VERMELHO","2"},{" 4","VERDE   ","2"},{" 4","AMARELO ","2"},{" 4","AZUL    ","2"},{" 5","VERMELHO","2"},{" 5","VERDE   ","2"},{" 5","AMARELO ","2"},{" 5","AZUL    ","2"},{" 6","VERMELHO","2"},{" 6","VERDE   ","2"},{" 6","AMARELO ","2"},{" 6","AZUL    ","2"},{" 7","VERMELHO","2"},{" 7","VERDE   ","2"},{" 7","AMARELO ","2"},{" 7","AZUL    ","2"},{" 8","VERMELHO","2"},{" 8","VERDE   ","2"},{" 8","AMARELO ","2"},{" 8","AZUL    ","2"},{" 9","VERMELHO","2"},{" 9","VERDE   ","2"},{" 9","AMARELO ","2"},{" 9","AZUL    ","2"},{"+2","VERMELHO","2"},{"+2","VERDE   ","2"},{"+2","AMARELO ","2"},{"+2","AZUL    ","2"},{" Ѳ","VERMELHO","2"},{" Ѳ","VERDE   ","2"},{" Ѳ","AMARELO ","2"},{" Ѳ","AZUL    ","2"},{" ϟ","VERMELHO","2"},{" ϟ","VERDE   ","2"},{" ϟ","AMARELO ","2"},{" ϟ","AZUL    ","2"}}					
	inteiro numero,carta_jogada,qnt_cartas_jogador = 0,qnt_cartas_pc = 0, cor_coringa,qnt_especial_pc = 0,qnt_vermelhas_pc = 0,qnt_verde_pc = 0,qnt_amarelo_pc = 0,qnt_azul_pc = 0
	logico validar_compra_pc = falso,validar_comprar = verdadeiro, validar_uno = falso, ataque_maisdois_vermelho = falso,ataque_maisdois_verde = falso,ataque_maisdois_amarelo = falso,ataque_maisdois_azul = falso,ataque_bloqueio_vermelho = falso,ataque_bloqueio_verde = falso,ataque_bloqueio_azul = falso,ataque_bloqueio_amarelo = falso, ataque_reverso_vermelho = falso , ataque_reverso_verde = falso , ataque_reverso_amarelo = falso , ataque_reverso_azul = falso  
	cadeia jogador
	cadeia play
	//função responsavel por definir qual jogador sera o primeiro a joga e chama as funções responsaveis de distribuir e mostrar as cartas
	funcao iniciar_jogo(){
		limpa()
		//sorteia, entre 0 e 1, quem começara, onde 0 define que o primeiro a jogar sera o computador e 1 define que sera o jogador
		escolha(u.sorteia(0, 1)){
			caso 0:
				jogador = "PC"
				pare
			caso 1:
				jogador = "JOGADOR"
				pare
		}
		//chama as funções de distribuir as cartas
		distribuicao_cartas(7, 'J')
		distribuicao_cartas(7, 'P')
		distribuicao_cartas(1, 'M')
		//chama as funcções de mostrar as cartas
		mostrar_cartas_pc(7)
		mostrar_cartas_mesa(deck_mesa[0], deck_mesa[1])
		mostrar_cartas_jogador(7)
	}
	//função responsavel por mostrar o vencedor do jogo utilizando ascii art para a escrita
	funcao finalizar_jogo(){
		limpa()
		se (qnt_cartas_jogador == 0){
			escreva(" **      **   *******     ******  ********       **      ** ******** ****     **   ******  ******** **     ** **\n")
			escreva("/**     /**  **/////**   **////**/**/////       /**     /**/**///// /**/**   /**  **////**/**///// /**    /**/**\n")
			escreva("/**     /** **     //** **    // /**            /**     /**/**      /**//**  /** **    // /**      /**    /**/**\n")
			escreva("//**    ** /**      /**/**       /*******       //**    ** /******* /** //** /**/**       /******* /**    /**/**\n")
			escreva(" //**  **  /**      /**/**       /**////         //**  **  /**////  /**  //**/**/**       /**////  /**    /**/**\n")
			escreva("  //****   //**     ** //**    **/**              //****   /**      /**   //****//**    **/**      /**    /**// \n")
			escreva("   //**     //*******   //****** /********         //**    /********/**    //*** //****** /********//*******  **\n")
			escreva("    //       ///////     //////  ////////           //     //////// //      ///   //////  ////////  ///////  // \n")
		}senao se (qnt_cartas_pc == 0){
			escreva(" **      **   *******     ******  ********       *******  ******** *******   *******   ******** **     ** **\n")
			escreva("/**     /**  **/////**   **////**/**/////       /**////**/**///// /**////** /**////** /**///// /**    /**/**\n")
			escreva("/**     /** **     //** **    // /**            /**   /**/**      /**   /** /**    /**/**      /**    /**/**\n")
			escreva("//**    ** /**      /**/**       /*******       /******* /******* /*******  /**    /**/******* /**    /**/**\n")
			escreva(" //**  **  /**      /**/**       /**////        /**////  /**////  /**///**  /**    /**/**////  /**    /**/**\n")
			escreva("  //****   //**     ** //**    **/**            /**      /**      /**  //** /**    ** /**      /**    /**// \n")
			escreva("   //**     //*******   //****** /********      /**      /********/**   //**/*******  /********//*******  **\n")
			escreva("    //       ///////     //////  ////////       //       //////// //     // ///////   ////////  ///////  // \n")
		}
	}
	//função responsavel pela habilidade da carta coringa
	funcao coringa(inteiro c){
		escolha (c){
			caso 1:
				deck_mesa[1] = "VERMELHO"
				pare
			caso 2:
				deck_mesa[1] = "VERDE   "
				pare	
			caso 3:
				deck_mesa[1] = "AMARELO "
				pare	
			caso 4:
				deck_mesa[1] = "AZUL    "
				pare	
		}
	}
	//função responsavel pela habilidade da carta +4
	funcao mais_quatro(caracter p, inteiro c){
		escolha (p){
			caso 'P':
				jogador = "JOGADOR"
				pare
			caso 'J':
				jogador = "PC"	
				pare
		}
		comprar_carta(4, p, verdadeiro)
		coringa(c)
		
	}
	//função responsavel pela habilidade da carta +2
	funcao mais_dois(caracter p){
		escolha (p){
			caso 'P':
				jogador = "JOGADOR"
				pare
			caso 'J':
				jogador = "PC"	
				pare
		}
		comprar_carta(2, p, verdadeiro)
	}
	//função responsavel pelas habilidades das cartas bloqueio e reverso
	funcao reverter_bloquear(cadeia p){
		se (p == "JOGADOR"){
			jogador = "PC"		
		}senao{
			jogador = "JOGADOR"
		}
		lbl_comprar = "COMPRAR CARTA(0)"
	}
	//função responsavel na análise das cartas da mão do computador
	funcao analise_pc(){
		qnt_amarelo_pc = 0
		qnt_azul_pc = 0
		qnt_vermelhas_pc = 0
		qnt_verde_pc = 0
		qnt_especial_pc = 0
		ataque_maisdois_vermelho = falso
		ataque_maisdois_verde = falso
		ataque_maisdois_amarelo = falso
		ataque_maisdois_azul = falso
		ataque_reverso_vermelho = falso
		ataque_reverso_verde = falso
		ataque_reverso_amarelo = falso
		ataque_reverso_azul = falso
		ataque_bloqueio_vermelho = falso
		ataque_bloqueio_verde = falso
		ataque_bloqueio_azul = falso
		ataque_bloqueio_amarelo = falso
		validar_compra_pc = falso
		//define a quantidade de cartas cada cor presente na mao do computador e se existe cartas de ataque desta cor e quantidade de cartas especiasis
		para (inteiro i = 0; i < qnt_cartas_pc; i++){
			se(deck_pc[i][1] == "VERMELHO"){
				qnt_vermelhas_pc++
				se(deck_pc[i][0] == "+2"){
				ataque_maisdois_vermelho = verdadeiro
				}senao se(deck_pc[i][0] == " Ѳ"){
					ataque_bloqueio_vermelho = verdadeiro
				}senao se(deck_pc[i][0] == " ϟ"){
					ataque_reverso_vermelho = verdadeiro
				}
			}senao se(deck_pc[i][1] == "VERDE   "){
				qnt_verde_pc++
				se(deck_pc[i][0] == "+2"){
				ataque_maisdois_verde = verdadeiro
				}senao se(deck_pc[i][0] == " Ѳ"){
					ataque_bloqueio_verde = verdadeiro
				}senao se(deck_pc[i][0] == " ϟ"){
					ataque_reverso_verde = verdadeiro
				}
			}senao se(deck_pc[i][1] == "AMARELO "){
				qnt_amarelo_pc++
				se(deck_pc[i][0] == "+2"){
				ataque_maisdois_amarelo = verdadeiro
				}senao se(deck_pc[i][0] == " Ѳ"){
					ataque_bloqueio_amarelo = verdadeiro
				}senao se(deck_pc[i][0] == " ϟ"){
					ataque_reverso_amarelo = verdadeiro
				}
			}senao se(deck_pc[i][1] == "AZUL    "){
				qnt_azul_pc++
				se(deck_pc[i][0] == "+2"){
				ataque_maisdois_azul = verdadeiro
				}senao se(deck_pc[i][0] == " Ѳ"){
					ataque_bloqueio_azul = verdadeiro
				}senao se(deck_pc[i][0] == " ϟ"){
					ataque_reverso_azul = verdadeiro
				}
			}senao se(deck_pc[i][1] == "ESPECIAL"){
				qnt_especial_pc++
			}
		}
	}
	//função responsavel na tomada de decisão do computador com base nos critérios analisados na função de analise da mao do computador e na carta virada na mesa
	funcao decisao_jogada_pc(){
		//verifica se a cor da carta da mesa e se o computador possui cartas desta cor
		se(deck_mesa[1] == "VERMELHO" e qnt_vermelhas_pc > 0){
			//verifica se possui carta +2 desta cor
			se (ataque_maisdois_vermelho == verdadeiro){
				inteiro vi = 0
				//localiza a posicao da carta +2
				enquanto(deck_pc[vi][0] != "+2" ou deck_pc[vi][1] != "VERMELHO"){
					vi++
				}
				//armazena a posição da carta para jogala
				carta_jogada = vi
			////verifica se possui carta bloqueio desta cor
			}senao se (ataque_bloqueio_vermelho == verdadeiro){
				inteiro vi = 0
				//localiza a posicao da carta bloqueio
				enquanto(deck_pc[vi][0] != " Ѳ" ou deck_pc[vi][1] != "VERMELHO"){
					vi++
				}
				//armazena a posição da carta para jogala
				carta_jogada = vi
			//verifica se possui carta reverso desta cor
			}senao se (ataque_reverso_vermelho == verdadeiro){
				inteiro vi = 0
				//localiza a posicao da carta reverso
				enquanto(deck_pc[vi][0] != " ϟ" ou deck_pc[vi][1] != "VERMELHO"){
					vi++
				}
				//armazena a posição da carta para jogala
				carta_jogada = vi
			//se nao houver cartas de ataque procura carta com mesma cor
			}senao{
				inteiro vi = 0
				//localiza a posicao da carta de mesma cor
				enquanto(deck_pc[vi][1] != "VERMELHO"){
					vi++
				}
				//armazena a posição da carta para jogala
				carta_jogada = vi
			}
		//verifica se a cor da carta da mesa e se o computador possui cartas desta cor
		}senao se(deck_mesa[1] == "VERDE   " e qnt_verde_pc > 0){
			//verifica se possui carta +2 desta cor
			se (ataque_maisdois_verde == verdadeiro){
				inteiro vri = 0
				//localiza a posicao da carta +2
				enquanto(deck_pc[vri][0] != "+2" ou deck_pc[vri][1] != "VERDE   "){
					vri++
				}
				//armazena a posição da carta para jogala
				carta_jogada = vri
			////verifica se possui carta bloqueio desta cor
			}senao se (ataque_bloqueio_verde == verdadeiro){
				inteiro vri = 0
				//localiza a posicao da carta bloqueio
				enquanto(deck_pc[vri][0] != " Ѳ" ou deck_pc[vri][1] != "VERDE   "){
					vri++
				}
				//armazena a posição da carta para jogala
				carta_jogada = vri
			//verifica se possui carta reverso desta cor
			}senao se (ataque_reverso_verde == verdadeiro){
				inteiro vri = 0
				//localiza a posicao da carta reverso
				enquanto(deck_pc[vri][0] != " ϟ" ou deck_pc[vri][1] != "VERDE   "){
					vri++
				}
				//armazena a posição da carta para jogala
				carta_jogada = vri
			//se nao houver cartas de ataque procura carta com mesma cor
			}senao{
				inteiro vri = 0
				//localiza a posicao da carta de mesma cor
				enquanto(deck_pc[vri][1] != "VERDE   "){
					vri++
				}
				//armazena a posição da carta para jogala
				carta_jogada = vri
			}
		//verifica se a cor da carta da mesa e se o computador possui cartas desta cor
		}senao se(deck_mesa[1] == "AMARELO " e qnt_amarelo_pc > 0){
			//verifica se possui carta +2 desta cor
			se (ataque_maisdois_amarelo == verdadeiro){
				inteiro ai = 0
				//localiza a posicao da carta +2
				enquanto(deck_pc[ai][0] != "+2" ou deck_pc[ai][1] != "AMARELO "){
					ai++
				}
				//armazena a posição da carta para jogala
				carta_jogada = ai
			////verifica se possui carta bloqueio desta cor
			}senao se (ataque_bloqueio_amarelo == verdadeiro){
				inteiro ai = 0
				//localiza a posicao da carta bloqueio
				enquanto(deck_pc[ai][0] != " Ѳ" ou deck_pc[ai][1] != "AMARELO "){
					ai++
				}
				//armazena a posição da carta para jogala
				carta_jogada = ai
			//verifica se possui carta reverso desta cor
			}senao se (ataque_reverso_amarelo == verdadeiro){
				inteiro ai = 0
				//localiza a posicao da carta reverso
				enquanto(deck_pc[ai][0] != " ϟ" ou deck_pc[ai][1] != "AMARELO "){
					ai++
				}
				//armazena a posição da carta para jogala
				carta_jogada = ai
			//se nao houver cartas de ataque procura carta com mesma cor
			}senao{
				inteiro ai = 0
				//localiza a posicao da carta de mesma cor
				enquanto(deck_pc[ai][1] != "AMARELO "){
					ai++
				}
				//armazena a posição da carta para jogala
				carta_jogada = ai
			}
		//verifica se a cor da carta da mesa e se o computador possui cartas desta cor
		}senao se(deck_mesa[1] == "AZUL    " e qnt_azul_pc > 0){
			//verifica se possui carta +2 desta cor
			se (ataque_maisdois_azul == verdadeiro){
				inteiro azi = 0
				//localiza a posicao da carta +2
				enquanto(deck_pc[azi][0] != "+2" ou deck_pc[azi][1] != "AZUL    "){
					azi++
				}
				//armazena a posição da carta para jogala
				carta_jogada = azi
			////verifica se possui carta bloqueio desta cor
			}senao se (ataque_bloqueio_azul == verdadeiro){
				inteiro azi = 0
				//localiza a posicao da carta bloqueio
				enquanto(deck_pc[azi][0] != " Ѳ" ou deck_pc[azi][1] != "AZUL    "){
					azi++
				}
				//armazena a posição da carta para jogala
				carta_jogada = azi
			//verifica se possui carta reverso desta cor
			}senao se (ataque_reverso_azul == verdadeiro){
				inteiro azi = 0
				//localiza a posicao da carta reverso
				enquanto(deck_pc[azi][0] != " ϟ" ou deck_pc[azi][1] != "AZUL    "){
					azi++
				}
				//armazena a posição da carta para jogala
				carta_jogada = azi
			//se nao houver cartas de ataque procura carta com mesma cor
			}senao{
				inteiro azi = 0
				//localiza a posicao da carta de mesma cor
				enquanto(deck_pc[azi][1] != "AZUL    "){
					azi++
				}
				//armazena a posição da carta para jogala
				carta_jogada = azi
			}
		//se nao houver cartas de mesma cor porcura cartas com o mesmo numero
		}senao{
			inteiro ni = 0
			//localiza posicao da carta de mesmo numero
			enquanto(deck_pc[ni][0] != deck_mesa[0] e ni < qnt_cartas_pc){
				ni++
			}
			//se a ultima carta verificada nao for a carta com mesmo numero da carta da mesa verifica se tem carta especial
			se(deck_pc[ni][0] != deck_mesa[0]){
				inteiro ei = 0
				se(qnt_especial_pc > 0 ){
					enquanto(deck_pc[ei][0] != "+4" e deck_pc[ei][1] != "ESPECIAL" e deck_pc[ei][0] != " Ͼ"){
							ei++
					}
					//se encontrada carta especial armazena ela para jogala
					carta_jogada = ei
				//se nao encontrada carta especial compra uma carta, apos nova analise ainda sim nao tiver carta para jogar passa a vez
				}senao{
					validar_compra_pc = verdadeiro
					carta_jogada = 0
				}
			//armazena a carta com mesmo numero localizada para jogala
			}senao{
				carta_jogada = ni
			}
		}
	}
	//responsavel pela distribuicao de cartas da mesa, jogador e computador utilizando parametros para diferenciar quantidade e destino
	funcao distribuicao_cartas(inteiro n, caracter player){
		//repete o processo ate a quantidade necessaria de cartas estiver compreendida
		para (inteiro s = 0; s < n; s++){
			//sorteia e faz a verificacao se a carta esta disposivel de acordo com a quantidade presente no deck geral
			faca{
				numero  = u.sorteia(0, 53)
			}enquanto (CARTAS[numero][2] == "0")
			//se a carta for para a mesa verfica se a carta sorteada nao e uma carta de ataque ou especial, se for, refaz sorteio da carta
			se (player == 'M'){
				enquanto (CARTAS[numero][2] == "0" ou numero <= 1 ou numero >=42){
					numero  = u.sorteia(0, 53)
				}
			}
			//diminiu a quantidade de carta disponiveis no deck geral
			CARTAS[numero][2] = tip.inteiro_para_cadeia(tip.cadeia_para_inteiro(CARTAS[numero][2],10) - 1, 10)
			//armazena a carta nos respectivos decks de acordo com o parametro declarado
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
	//responsavel em mostrar a carta da mesa utilizando ascii art
	funcao mostrar_cartas_mesa(cadeia carta,cadeia cor){
		topo_carta = tx.preencher_a_esquerda(' ',48, "▄▄▄▄▄▄▄▄▄▄▄ ")
		interior1_carta = tx.preencher_a_esquerda(' ',48, "▌▒▒▒▒▒▒▒▒▒▐ ")
		interior2_carta = tx.preencher_a_esquerda(' ',48,"▌▒▒▒   ▒▒▒▐ ")
		interior3_carta = tx.preencher_a_esquerda(' ',48,"▌▒▒     ▒▒▐ ")
		numero_carta = tx.preencher_a_esquerda(' ',48,"▌▒  "+carta+"   ▒▐ ")
		fundo_carta = tx.preencher_a_esquerda(' ',48,"▀▀▀▀▀▀▀▀▀▀▀ ")
		escreva(topo_carta+"\n"+interior1_carta+"\n"+interior2_carta+"\n"+interior3_carta+"\n"+numero_carta+tx.preencher_a_esquerda(' ',34, "TURNO: "+ jogador)+"\n"+interior3_carta+"\n"+interior2_carta+tx.preencher_a_esquerda(' ',38, lbl_comprar)+"\n"+interior1_carta+"\n"+fundo_carta+"\n")
		escreva(tx.preencher_a_esquerda(' ',45, cor+"\n"))
	}
	//responsavel em mostrar a carta do computador utilizando ascii art
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
	//responsavel em mostrar a carta do jogador utilizando ascii art
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
	//responsavel por mostrar titulo do jogo para poder comecar a jogar
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
	//responsavel por avisar que jogador esta de uno e remostrar a mesa
	funcao chamar_uno(){
		limpa()
		escreva(" **     ** ****     **   ******* \n")
		escreva("/**    /**/**/**   /**  **/////** \n")
		escreva("/**    /**/**//**  /** **     //** \n")
		escreva("/**    /**/** //** /**/**      /** \n")
		escreva("/**    /**/**  //**/**/**      /** \n")
		escreva("/**    /**/**   //****//**     ** \n")
		escreva("//******* /**    //*** //******* \n")
		escreva(" ///////  //      ///   /////// \n")
		u.aguarde(3000)
		limpa()
		mostrar_cartas_pc(qnt_cartas_pc)
		mostrar_cartas_mesa(deck_mesa[0],deck_mesa[1])
		mostrar_cartas_jogador(qnt_cartas_jogador)
	}
	funcao inicio()
	{	
		//verifica a resposta do jogador para poder comecar o jogo
		faca{
			limpa()
			logo()
			leia(play)
		}enquanto(tx.caixa_alta(play) != "S" e tx.caixa_alta(play) != "N")
		//fecha o jogo caso o jogador nao queira jogar
		se (tx.caixa_alta(play) == "N") 
			limpa()
		//inicia o jogo
		senao{
			iniciar_jogo()
			//repete os processos do jogo enquanto ambos os jogadores possuem cartas
			enquanto(qnt_cartas_jogador > 0 e qnt_cartas_pc > 0){
				//se vez do computador chama suas funcoes responsaveis pela analise e tomada de decisao
				se (jogador == "PC"){
					analise_pc()
					decisao_jogada_pc()
					u.aguarde(5000)
					//se comprar carta chama a funcao para comprar a carta de desabilita a mesma ate o proximo turno
					se(carta_jogada == 0 e validar_comprar == verdadeiro e validar_compra_pc == verdadeiro){
						lbl_comprar = "PASSAR VEZ(0)"
						comprar_carta(1, 'P',falso)
						validar_comprar = falso
						u.aguarde(5000)
					//se a funcao comprar estiver desabilitada passa a vez
					}senao se(carta_jogada == 0 e validar_comprar == falso e validar_compra_pc == verdadeiro){
						jogador = "JOGADOR"
						lbl_comprar = "COMPRAR CARTA(0)"
						validar_comprar = verdadeiro
						limpa()
						mostrar_cartas_pc(qnt_cartas_pc)
						mostrar_cartas_mesa(deck_mesa[0],deck_mesa[1])
						mostrar_cartas_jogador(qnt_cartas_jogador)
					//faz a jogada do computador chamando sua funcao responsavel e reaativa a funcao comprar
					}senao{
						lbl_comprar = "COMPRAR CARTA(0)"
						jogar_carta_pc(carta_jogada)
						validar_comprar = verdadeiro
					}
				//se jogador pede para que jogador escolha qual carta joga e chama a funcao responsavel em jogar a carta
				}senao se(jogador == "JOGADOR"){
					escreva("\n")
					escreva("DIGITE O NUMERO CORRESPONDENTE DA CARTA QUE DESEJA JOGAR:\n")
					leia(carta_jogada)
					//se comprar carta chama a funcao para comprar a carta de desabilita a mesma ate o proximo turno
					se(carta_jogada == 0 e validar_comprar == verdadeiro){
						lbl_comprar = "PASSAR VEZ(0)"
						comprar_carta(1, 'J',falso)
						validar_comprar = falso
					//se a funcao comprar estiver desabilitada passa a vez
					}senao se(carta_jogada == 0 e validar_comprar == falso){
						jogador = "PC"
						lbl_comprar = "COMPRAR CARTA(0)"
						validar_comprar = verdadeiro
						limpa()
						mostrar_cartas_pc(qnt_cartas_pc)
						mostrar_cartas_mesa(deck_mesa[0],deck_mesa[1])
						mostrar_cartas_jogador(qnt_cartas_jogador)
					}senao{
						//verifica se a carta escolhida e valida para ser jogada se nao recarrega a mesa e pede que escolha uma nova carta
						se (deck_jogador[carta_jogada-1][0] != deck_mesa[0] e deck_jogador[carta_jogada-1][1] != deck_mesa[1] e deck_jogador[carta_jogada-1][1] != "ESPECIAL" ou carta_jogada > qnt_cartas_jogador){
							limpa()
							mostrar_cartas_pc(qnt_cartas_pc)
							mostrar_cartas_mesa(deck_mesa[0],deck_mesa[1])
							mostrar_cartas_jogador(qnt_cartas_jogador)
						//chama a funcao de jogar a carta e reaativa a funcao comprar
						}senao{
							lbl_comprar = "COMPRAR CARTA(0)"
							jogar_carta_jogador()
							validar_comprar = verdadeiro
						}
					}
				}
			}
			//chama a funcao finalizar jogo se um dos jogadores ficar sem cartas
			finalizar_jogo()				
		}
	}
	//responsavel por jogar carta do jogador
	funcao jogar_carta_jogador(){
		//se jogador tiver 2 cartas chama a funcao uno para declarar que jogador so possui uma carta
		se(qnt_cartas_jogador == 2){
			chamar_uno()
		}
		//define que a nova carta da mesa e a carta escolhida pelo jogador
		deck_mesa[0] = deck_jogador[carta_jogada - 1][0]
		deck_mesa[1] = deck_jogador[carta_jogada - 1][1]
		//define que a vez agora e do computador
		jogador = "PC"
		//verifica se a carta jogada é especial ou de ataque para chamar suas funcoes de habilidades 
		se (deck_jogador[carta_jogada - 1][0] == " Ͼ"){
			limpa()
			escreva("Escolha uma cor:\nVERMELHO(1) | VERDE(2) | AMARELO(3) | AZUL(4)\n")
			leia(cor_coringa)
			coringa(cor_coringa)
		}senao se (deck_jogador[carta_jogada - 1][0] == "+4"){
			limpa()
			escreva("Escolha uma cor:\nVERMELHO(1) | VERDE(2) | AMARELO(3) | AZUL(4)\n")
			leia(cor_coringa)
			mais_quatro('P',cor_coringa)
		}senao se(deck_jogador[carta_jogada - 1][0] == "+2"){
			mais_dois('P')
		}senao se (deck_jogador[carta_jogada - 1][0] == " ϟ" ou deck_jogador[carta_jogada - 1][0] == " Ѳ"){
			reverter_bloquear(jogador)
		}
		//reescreve o deck de cartas do jogador excluindo a carta jogada
		para(inteiro i = 0; i<= qnt_cartas_jogador - 1 ; i++){
			se (i < carta_jogada - 1){
				deck_jogador[i][0] = deck_jogador[i][0]
				deck_jogador[i][1] = deck_jogador[i][1]
			}
			senao se (i > carta_jogada - 1){
				deck_jogador[i-1][0] = deck_jogador[i][0]
				deck_jogador[i-1][1] = deck_jogador[i][1]
			}
		}
		//diminiu a quantidade de cartas do jogador e reconstroi a mesa com sua nova disposicao
		qnt_cartas_jogador--
		limpa()
		mostrar_cartas_pc(qnt_cartas_pc)
		mostrar_cartas_mesa(deck_mesa[0],deck_mesa[1])
		mostrar_cartas_jogador(qnt_cartas_jogador)
	}
	//responsavel em analisar e decidir qual cor sera escolhida devida a utilizacao de uma carta especial pelo computador
	funcao decidir_cor_coringa(){
		se(qnt_amarelo_pc>qnt_azul_pc ou qnt_amarelo_pc>qnt_verde_pc ou qnt_amarelo_pc>qnt_vermelhas_pc){
				cor_coringa = 3
			}senao se(qnt_vermelhas_pc>qnt_amarelo_pc ou qnt_vermelhas_pc>qnt_verde_pc ou qnt_vermelhas_pc>qnt_azul_pc){
				cor_coringa = 1
			}senao se(qnt_verde_pc>qnt_vermelhas_pc ou qnt_verde_pc>qnt_amarelo_pc ou qnt_verde_pc>qnt_azul_pc){
				cor_coringa = 2
			}senao se(qnt_azul_pc>qnt_vermelhas_pc ou qnt_azul_pc>qnt_amarelo_pc ou qnt_azul_pc>qnt_verde_pc){
				cor_coringa = 4
			}senao se(qnt_vermelhas_pc == qnt_amarelo_pc e qnt_vermelhas_pc > qnt_verde_pc ou qnt_vermelhas_pc == qnt_amarelo_pc e qnt_vermelhas_pc > qnt_azul_pc){
				escolha (u.sorteia(0,1)){
					caso 0:
						cor_coringa = 1
						pare
					caso 1:
						cor_coringa = 3
						pare
				}
			}senao se(qnt_vermelhas_pc == qnt_verde_pc e qnt_vermelhas_pc > qnt_amarelo_pc ou qnt_vermelhas_pc == qnt_verde_pc e qnt_vermelhas_pc > qnt_azul_pc){
				escolha (u.sorteia(0,1)){
					caso 0:
						cor_coringa = 1
						pare
					caso 1:
						cor_coringa = 2
						pare
				}
			}senao se(qnt_vermelhas_pc == qnt_azul_pc e qnt_vermelhas_pc > qnt_amarelo_pc ou qnt_vermelhas_pc == qnt_azul_pc e qnt_vermelhas_pc > qnt_verde_pc){
				escolha (u.sorteia(0,1)){
					caso 0:
						cor_coringa = 1
						pare
					caso 1:
						cor_coringa = 4
						pare
				}
			}senao se(qnt_amarelo_pc == qnt_azul_pc e qnt_amarelo_pc > qnt_vermelhas_pc ou qnt_amarelo_pc == qnt_azul_pc e qnt_amarelo_pc > qnt_verde_pc){
				escolha (u.sorteia(0,1)){
					caso 0:
						cor_coringa = 3
						pare
					caso 1:
						cor_coringa = 4
						pare
				}
			}senao se(qnt_amarelo_pc == qnt_verde_pc e qnt_amarelo_pc > qnt_vermelhas_pc ou qnt_amarelo_pc == qnt_verde_pc e qnt_amarelo_pc > qnt_azul_pc){
				escolha (u.sorteia(0,1)){
					caso 0:
						cor_coringa = 3
						pare
					caso 1:
						cor_coringa = 4
						pare
				}
			}senao se(qnt_verde_pc == qnt_azul_pc e qnt_verde_pc > qnt_vermelhas_pc ou qnt_verde_pc == qnt_azul_pc e qnt_verde_pc > qnt_amarelo_pc){
				escolha (u.sorteia(0,1)){
					caso 0:
						cor_coringa = 3
						pare
					caso 1:
						cor_coringa = 4
						pare
				}
			}senao se(qnt_vermelhas_pc == qnt_verde_pc e qnt_vermelhas_pc == qnt_azul_pc e qnt_vermelhas_pc>qnt_amarelo_pc){
				escolha (u.sorteia(0,2)){
					caso 0:
						cor_coringa = 1
						pare
					caso 1:
						cor_coringa = 2
						pare
					caso 2:
						cor_coringa = 4
						pare
				}
			}senao se(qnt_vermelhas_pc == qnt_verde_pc e qnt_vermelhas_pc == qnt_amarelo_pc e qnt_vermelhas_pc>qnt_azul_pc){
				escolha (u.sorteia(0,2)){
					caso 0:
						cor_coringa = 1
						pare
					caso 1:
						cor_coringa = 2
						pare
					caso 2:
						cor_coringa = 3
						pare
				}
			}senao se(qnt_vermelhas_pc == qnt_amarelo_pc e qnt_vermelhas_pc == qnt_azul_pc e qnt_vermelhas_pc>qnt_verde_pc){
				escolha (u.sorteia(0,2)){
					caso 0:
						cor_coringa = 1
						pare
					caso 1:
						cor_coringa = 3
						pare
					caso 2:
						cor_coringa = 4
						pare
				}
			}senao se(qnt_amarelo_pc == qnt_verde_pc e qnt_amarelo_pc == qnt_azul_pc e qnt_amarelo_pc>qnt_vermelhas_pc){
				escolha (u.sorteia(0,2)){
					caso 0:
						cor_coringa = 3
						pare
					caso 1:
						cor_coringa = 2
						pare
					caso 2:
						cor_coringa = 4
						pare
				}
			}senao{
				cor_coringa = u.sorteia(1, 4)
			}
	}
	//responsavel em jogar a carta do computador
	funcao jogar_carta_pc(inteiro c){
		//verifica se o computador possui duas cartas para chamar a funcao uno
		se (qnt_cartas_pc == 2){
			chamar_uno()
		}
		//define a vez para o jogador
		jogador = "JOGADOR"
		//define que a carta da mesa agora é a escolhida pelo computador
		deck_mesa[0] = deck_pc[c][0]
		deck_mesa[1] = deck_pc[c][1]
		//verifica se a carta escolhida é uma carta especial ou de ataque para chamar sua funcao de habilidade
		se (deck_pc[c][0] == " Ͼ"){
			limpa()
			decidir_cor_coringa()
			coringa(cor_coringa)
		}senao se (deck_pc[c][0] == "+4"){
			limpa()
			decidir_cor_coringa()
			mais_quatro('J',cor_coringa)
		}senao se(deck_pc[c][0] == "+2"){
			mais_dois('J')
		}senao se (deck_pc[c][0] == " ϟ" ou deck_pc[c][0] == " Ѳ"){
			reverter_bloquear(jogador)
		}
		//reescreve o deck de cartas do computador
		para(inteiro i = 0; i<= qnt_cartas_pc - 1; i++){
			se (i < c){
				deck_pc[i][0] = deck_pc[i][0]
				deck_pc[i][1] = deck_pc[i][1]
			}
			senao se (i > c){
				deck_pc[i-1][0] = deck_pc[i][0]
				deck_pc[i-1][1] = deck_pc[i][1]
			}
		}
		//diminui a quantidade de cartas do computador e remonta a mesa de acordo com sua nova disposicao
		qnt_cartas_pc--
		limpa()
		mostrar_cartas_pc(qnt_cartas_pc)
		mostrar_cartas_mesa(deck_mesa[0],deck_mesa[1])
		mostrar_cartas_jogador(qnt_cartas_jogador)
	}
	//responsavel e distribir novas cartas aos jogadores
	funcao comprar_carta(inteiro n, caracter p, logico carta){
		//executa ate a quantidade de cartas estabelecidas com o parametro declarado
		para (inteiro i = 0; i < n; i++){
			//verifica disponibilidade da carta de acordo com a quantidade no deck geral
			faca{
				numero  = u.sorteia(0, 53)
			}enquanto (CARTAS[numero][2] == "0")
			//reduz a quantidade desta carta no deck geral
			CARTAS[numero][2] = tip.inteiro_para_cadeia(tip.cadeia_para_inteiro(CARTAS[numero][2],10) - 1, 10)
			//verifica para quem é a carta de acordo com o parametro declarado
			escolha(p){
				caso 'J':
					deck_jogador[qnt_cartas_jogador][0] = CARTAS[numero][0]
					deck_jogador[qnt_cartas_jogador][1] = CARTAS[numero][1]
					qnt_cartas_jogador++
					pare
				caso 'P':
					deck_pc[qnt_cartas_pc][0] = CARTAS[numero][0]
					deck_pc[qnt_cartas_pc][1] = CARTAS[numero][1]
					qnt_cartas_pc++
					pare
			}
			//verifica se as cartas estao sendo compradas por habilidade de cartas ou nao
			se(carta == falso){
				limpa()
				mostrar_cartas_pc(qnt_cartas_pc)
				mostrar_cartas_mesa(deck_mesa[0], deck_mesa[1])
				mostrar_cartas_jogador(qnt_cartas_jogador)
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 30084; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {deck_jogador, 7, 22, 12};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, matriz, funcao;
 */