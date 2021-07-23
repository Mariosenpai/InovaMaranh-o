programa
{
	inclua biblioteca Mouse --> m 
	inclua biblioteca Tipos --> t
	inclua biblioteca Texto -->tx
	inclua biblioteca Teclado --> tcl
	inclua biblioteca Util-->u
	inclua biblioteca Graficos --> g
	inclua biblioteca Matematica --> mat

	real valores[] ={21.50,120.00,9.90,14.90,29.90,14.00,4.90,55.90,16.10,21.90,34.80,99.00,14.90,54.90,29.90,19.90,26.90,34.90,69.90,49.90}
	real comissoes[] = {15.0,15.0,10.0,10.0,15.0,10.0,10.0,15.0,10.0,15.0,15.0,15.0,10.0,15.0,15.0,15.0,15.0,15.0,15.0,15.0}
	real comisaoAten[] = {0.000,0.000,0.000}
	inteiro produtosVendidos[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	cadeia nomeAtendente[] = {"Atendente1 ", "Atendente2", "Atendente3"}
	cadeia produtos[] = {"Bandeja Higiênica para Gato G",
						"CLEAN PERFUME - BLUE PUPPY 500ML",
						"Pente Duplo Antipulga para Cães e Gatos",
						"Condicionador Famous Pet Argan Dr. Rey 500ml",
						"Hidrante Educador de cães para xixi Sanitário",
						"Creme Dental Pet Clean para Cães e Gatos 60gr",
						"Escova Dental Care Dupla para Cães",
						"Ração Golden Gatos Filhotes Sabor Frango 3kg",
						"Biscoito Golden Cookie para Cães Filhores 400g",
						"Ração Golden Fórmula Mini Bits para Cães Adultos de Pequeno Porte Sabor Salmão e Arroz 1Kg",
						"DOG PELUCIA FOFINHOS ANIMAIS",
						"Caminha Iglu Cubo para Cães",
						"Brinquedo Mordedor para Cães - Bolinho Patinha 12cm",
						"Bolsa de transporte para Pet Cães e Gatos - Fêmea",
						"Roupinhas para Cães - Vestidos em Soft",
						"Manta SOFT para Cães e Gatos",
						"Fantasia Chapolin Colorado - Tam G",
						"Peitoral Confort para Cães M - The Pets Brasil",
						"Guia Coleira Refletível Ajustável para Cães",
						"Guia e Peitoral para Gatos Moderna Ajustável"}
		

	real tamanho_fonte = 25.0
	logico v = verdadeiro, f = falso
	inteiro esq = m.BOTAO_ESQUERDO
	cadeia atendente1 = "Atendente1"
	cadeia atendente2 = "Atendente2"
	cadeia atendente3 = "Atendente3"

	inteiro tabela = g.carregar_imagem("D:\\Programação\\Inova\\Tabela de produtos.png")

	
	inteiro largura = 800
	inteiro altura = 600

	inteiro botao_largura = largura/4
	inteiro botao_altura = altura/8
	
	inteiro posicao_botao_x = (largura-botao_largura)/2
	inteiro posicao_botao_y = (altura - botao_altura)/2

	inteiro mini_botao_largura = botao_largura/4
	inteiro mini_botao_altura = botao_altura/4
	
	//bostoes menu
	inteiro botao_vender = 100
	inteiro botao_info = 0
	inteiro botao_nome = -100
	//botoes menu

	//botoes venda
	inteiro botao_sair = -200
	//atendentes
	inteiro botao_a1 = 180
	inteiro botao_a2 = 80
	inteiro botao_a3 = -20
	//antendentes
	inteiro botao_compra = 0
	

	logico rodando = verdadeiro
	logico passa = falso
	//cor
	inteiro cor_botao1 = g.criar_cor(100, 100, 100)
	inteiro cor_fundo = g.criar_cor(255,255,255)

	//cor

	inteiro produto = 1
	inteiro unidades = 1

	real lucro_total = 0.0

	
	funcao inicio()
	{

		criarJanela(largura,altura,"Inova Maranhão")
		
		enquanto(rodando)
		{
			cor_fundo_padrao(cor_fundo)
			//precionar botao
			logico click_vender = mouse_interacao(posicao_botao_x, posicao_botao_y - botao_vender ,botao_largura,botao_altura)
			logico click_info = mouse_interacao(posicao_botao_x, posicao_botao_y - botao_info ,botao_largura,botao_altura)
			logico click_nome = mouse_interacao(posicao_botao_x, posicao_botao_y - botao_nome ,botao_largura,botao_altura)

			cadeia t = "Seja Bem Vindo!!"
			criar_text(largura/2 , altura/10, t)

			//menu
			criar_botao(posicao_botao_x,posicao_botao_y,botao_largura,botao_altura,botao_vender,"Vender")
			criar_botao(posicao_botao_x,posicao_botao_y,botao_largura,botao_altura,botao_info,"Informações")
			criar_botao(posicao_botao_x,posicao_botao_y,botao_largura,botao_altura,botao_nome,"Sair")						
			//menu

			//venda
			venda(click_vender)
			//venda

			//info
			info(click_info)
			//info

			//sair
			se(click_nome e m.botao_pressionado(esq))
			{
				pare
			}
			
			g.renderizar()
		}	
			
	}

	funcao info(logico click_info)
	{
		se(click_info e m.botao_pressionado(esq))
			{
				u.aguarde(250)
				enquanto(verdadeiro)
				{	
					logico click_sair = mouse_interacao(posicao_botao_x/4 , posicao_botao_y - botao_sair,botao_largura,botao_altura)
					cor_fundo_padrao(cor_fundo)


					criar_text(largura/4, altura/100 + 10, "Informações Gerais")
					g.definir_tamanho_texto(20.0)
					criar_text(largura/4,altura/10 ,"Lucro Total: " +mat.arredondar(lucro_total,2))
					g.definir_tamanho_texto(20.0)
					criar_text(largura/4,altura/10 + 25 ,""+nomeAtendente[0]+"; Comissão: " +mat.arredondar(comisaoAten[0],2 ))
					g.definir_tamanho_texto(20.0)
					criar_text(largura/4,altura/10 + 25 * 2 ,""+nomeAtendente[1]+"; Comissão: " +mat.arredondar(comisaoAten[1],2))
					g.definir_tamanho_texto(20.0)
					criar_text(largura/4,altura/10 + 25 * 3,""+nomeAtendente[2]+"; Comissão: " +mat.arredondar(comisaoAten[2],2 ) )
					
					g.desenhar_imagem((largura/2), altura/10, tabela)
					g.definir_tamanho_texto(30.0)
					criar_text(largura/2 + 150 , altura/100 + 10, "Tabela de Preços")
					g.definir_tamanho_texto(15.0)
					criar_text(largura/2 - 10, altura/20 - 10 , "Unidades")
					g.definir_tamanho_texto(15.0)
					criar_text(largura/2 - 10, altura/20 + 10 , "Vendidas:")
					para(inteiro i=1 ; i<=20 ; i++)
					{
						g.definir_tamanho_texto(15.0)
						criar_text((largura/2 -10), altura/10 + (27*i) - 27, "" +produtosVendidos[i - 1] +"")
					}
						
					criar_botao(posicao_botao_x/4, posicao_botao_y,botao_largura,botao_altura,botao_sair, "Volta")
					se(click_sair e m.botao_pressionado(esq))
					{
						pare
					}
					
					g.renderizar()
				}
				
			}
	}

	funcao venda(logico click_vender)
	{
		se(click_vender e m.botao_pressionado(esq))
		{	//escolher atendente
			u.aguarde(500)
			enquanto(verdadeiro)
			{
				cor_fundo_padrao(cor_fundo)
				//venda
				logico click_sair = mouse_interacao(posicao_botao_x, posicao_botao_y - botao_sair ,botao_largura,botao_altura)
				//atendentes
				logico click_a1 = mouse_interacao(posicao_botao_x, posicao_botao_y - botao_a1 ,botao_largura,botao_altura)
				logico click_a2 = mouse_interacao(posicao_botao_x, posicao_botao_y - botao_a2 ,botao_largura,botao_altura)
				logico click_a3 = mouse_interacao(posicao_botao_x, posicao_botao_y - botao_a3 ,botao_largura,botao_altura)
				//venda
				passa = falso
				inteiro idAtendente = 0
				

				
				criar_text(largura/2, altura/14, "Selecione o atendente que efetuou a venda")

				
				criar_botao(posicao_botao_x, posicao_botao_y,botao_largura,botao_altura,botao_sair, "Sair")
				
				//botoes atendentes
				criar_botao(posicao_botao_x , posicao_botao_y,botao_largura,botao_altura,botao_a1, atendente1)
				criar_botao(posicao_botao_x , posicao_botao_y,botao_largura,botao_altura,botao_a2, atendente2)
				criar_botao(posicao_botao_x , posicao_botao_y,botao_largura,botao_altura,botao_a3, atendente3)
				//botoes atendentes

				se(click_a1 e m.botao_pressionado(esq))
				{
					passa = verdadeiro
					idAtendente = 0
				}
				se(click_a2 e m.botao_pressionado(esq))
				{
					passa = verdadeiro
					idAtendente = 1
				}
				se(click_a3 e m.botao_pressionado(esq))
				{
					passa = verdadeiro
					idAtendente = 2 
				}					
				//escolher produto
				se(passa == verdadeiro)
				{
					u.aguarde(250)
					enquanto(verdadeiro)
					{

						logico click_sair_v = mouse_interacao(posicao_botao_x/3, posicao_botao_y - botao_sair ,botao_largura,botao_altura)

						//compra
					
						cor_fundo_padrao(cor_fundo)
						//texto
						criar_text(largura/4, altura/100, "Escolha o produto com a")
						g.definir_tamanho_texto(25.0)
						criar_text(largura/4, altura/100 + 30, "seta para cima e para baixo")
						g.definir_tamanho_texto(25.0)
						criar_text(largura/4, altura/100 + 60, "aperte ENTER para confirmar")

						criar_text(largura/4, altura/4, t.inteiro_para_cadeia(produto,10))
						//texto

						criar_botao(posicao_botao_x/3, posicao_botao_y,botao_largura,botao_altura,botao_sair, "Sair")
						
						g.desenhar_imagem(  largura/2 , 25, tabela)

						se(produto >= 20)
						{
							produto = 20
						}
						se(produto <= 1)
						{
							produto = 1
						}
						se(tcl.tecla_pressionada(tcl.TECLA_SETA_ACIMA))
						{
							produto++
							u.aguarde(150)
						}
						se(tcl.tecla_pressionada(tcl.TECLA_SETA_ABAIXO))
						{
							produto--
							u.aguarde(150)
						}
						

						se(tcl.tecla_pressionada(tcl.TECLA_ENTER))
						{	//escolher unidade
							u.aguarde(250)
							enquanto(verdadeiro)
							{
								
								logico click_sair_v1 = mouse_interacao(posicao_botao_x/3, posicao_botao_y - botao_sair ,botao_largura,botao_altura)

								cor_fundo_padrao(cor_fundo)
								
								g.desenhar_imagem(  largura/2 , 25, tabela)
								
								//texto
								criar_text(largura/4, altura/100, "Escolha o produto com a")
								g.definir_tamanho_texto(25.0)
								criar_text(largura/4, altura/100 + 30, "seta para cima e para baixo")
								g.definir_tamanho_texto(25.0)
								criar_text(largura/4, altura/100 + 60, "aperte ENTER para confirmar")
								
								criar_text(largura/4, altura/2 - 40, "Unidades")
								criar_text(largura/4, altura/2, t.inteiro_para_cadeia(unidades,10))

																
								criar_text(largura/4, altura/4, t.inteiro_para_cadeia(produto,10))
						
								criar_botao(posicao_botao_x/3, posicao_botao_y,botao_largura,botao_altura,botao_sair, "Sair")

								
								se(unidades <= 1)
								{
									unidades = 1
								}
								se(tcl.tecla_pressionada(tcl.TECLA_SETA_ACIMA))
								{
									unidades++
									u.aguarde(150)
								}
								se(tcl.tecla_pressionada(tcl.TECLA_SETA_ABAIXO))
								{
									unidades--
									u.aguarde(150)
								}

								se(tcl.tecla_pressionada(tcl.TECLA_ENTER) )
								{	//confirma compra
									u.aguarde(250)
									enquanto(verdadeiro)
									{
										
										logico click_sair_v2 = mouse_interacao(posicao_botao_x/3, posicao_botao_y - botao_sair ,botao_largura,botao_altura)
										logico click_confirma = mouse_interacao(posicao_botao_x/3, posicao_botao_y - botao_altura - 10 - botao_sair,botao_largura,botao_altura)
										
										
										cor_fundo_padrao(cor_fundo)
										
										g.desenhar_imagem(  largura/2 , 25, tabela)
										
										//texto
										criar_text(largura/4, altura/100, "Escolha o produto com a")
										g.definir_tamanho_texto(25.0)
										criar_text(largura/4, altura/100 + 30, "seta para cima e para baixo")
										g.definir_tamanho_texto(25.0)
										criar_text(largura/4, altura/100 + 60, "aperte ENTER para confirmar")
										//texto
										
										criar_text(largura/4, altura/2 - 40, "Unidades")
										criar_text(largura/4, altura/2, t.inteiro_para_cadeia(unidades,10))									
																		
										criar_text(largura/4, altura/4, t.inteiro_para_cadeia(produto,10))
	
										
										criar_botao(posicao_botao_x/3, posicao_botao_y - botao_altura - 10  ,botao_largura,botao_altura,botao_sair, "Confirmar")
										criar_botao(posicao_botao_x/3, posicao_botao_y,botao_largura,botao_altura,botao_sair, "Sair")
										//processa pagamento
										se(click_confirma e m.botao_pressionado(esq) ou tcl.tecla_pressionada(tcl.TECLA_ENTER))
										{
											
											//calculo da compra
											produto--
											real com = comissoes[produto]
											real val = valores[produto ]
											real total_recebido = (val * (com/100)) * unidades
											comisaoAten[idAtendente] += total_recebido
											produtosVendidos[produto] += unidades
											lucro_total += val * unidades
											//calculo da compra
											enquanto(verdadeiro)
											{	
												logico click_sair_v3 = mouse_interacao(posicao_botao_x, posicao_botao_y - botao_sair ,botao_largura,botao_altura)
										
											
												cor_fundo_padrao(cor_fundo)
												criar_text(largura/2,altura/100 + 20,"COMPRA EFETUADA")

												g.definir_tamanho_texto(20.0)
												criar_text(largura/2, altura/10, "NOME DO PRODUTO: "+produtos[produto])
												g.definir_tamanho_texto(20.0)
												criar_text(largura/2, altura/10 + 24, "VALOR POR UNIDADE("+ unidades +"): R$ "+val)
												g.definir_tamanho_texto(20.0)
												criar_text(largura/2, altura/10 + 24*2, "VALOR TOTAL: R$ "+mat.arredondar( val*unidades,2))
												g.definir_tamanho_texto(20.0)
												criar_text(largura/2, altura/10 + 24*3, "NOME DO ATENDENTE: "+ nomeAtendente[idAtendente] )
												g.definir_tamanho_texto(20.0)
												criar_text(largura/2, altura/10 + 24*4, "COMISSÃO DO ATENDENTE: R$ "+ mat.arredondar(comisaoAten[idAtendente],2) )
										
												criar_botao(posicao_botao_x, posicao_botao_y,botao_largura,botao_altura,botao_sair, "Volta")
												se(click_sair_v3 e m.botao_pressionado(esq))
												{
													produto = 0
													unidades = 0
													pare
												}
												
												g.renderizar()
											}
											
											
											
										}
										//processa pagamento
										se(click_sair_v2 e m.botao_pressionado(esq))
										{
											produto = 0
											unidades = 0
											pare
										}
										g.renderizar()
									}
								}	//confirma compra

								se(click_sair_v1 e m.botao_pressionado(esq))
								{
									produto = 0
									unidades = 0
									pare
								}
								g.renderizar()
							}
						}	//escolher unidades
							
						

						se(click_sair_v e m.botao_pressionado(esq))
						{
							produto = 0
							unidades = 0							
							pare
						}
						g.renderizar()
					}

					
				}
				//escolher produto
				

				se(click_sair e m.botao_pressionado(esq))
				{
					pare
				}

				g.renderizar()
			}
			//escolher atendente	
		}
	}

	funcao criar_text(inteiro x, inteiro y, cadeia texto)
	{	
		real tam = 40.0
		g.definir_cor(g.COR_PRETO)
		g.desenhar_texto(x - (g.largura_texto(texto)/2), y, texto)
		g.definir_tamanho_texto(tam)
	}

	funcao criar_botao(inteiro posicao_botao_xf, inteiro posicao_botao_yf,inteiro botao_larguraf,inteiro botao_alturaf,inteiro alturaf,cadeia frase)
	{
			g.definir_tamanho_texto(tamanho_fonte)
			
			g.definir_cor(cor_botao1)
			g.desenhar_retangulo(posicao_botao_xf, posicao_botao_yf - alturaf, botao_larguraf, botao_alturaf, v, v)

			//texto
			g.definir_cor(g.COR_BRANCO)
			inteiro text_x =(posicao_botao_xf + (botao_larguraf/2) ) - (g.largura_texto(frase)/2)
			inteiro text_y = (posicao_botao_yf + (botao_alturaf/2)) - (g.altura_texto(frase)/2)
			g.desenhar_texto(text_x  ,text_y - alturaf , frase)


			se(mouse_interacao(posicao_botao_xf, posicao_botao_yf - alturaf ,botao_larguraf ,botao_alturaf)  )
			{
				g.desenhar_retangulo(posicao_botao_xf, posicao_botao_yf - alturaf, botao_larguraf+2, botao_alturaf+2, v, f)
				g.definir_cor(g.COR_PRETO)
			}
			
	}

	funcao logico mouse_interacao(inteiro x ,inteiro y, inteiro larguraf, inteiro alturaf)
	{
		inteiro mouse_x = m.posicao_x()
		inteiro mouse_y = m.posicao_y()

		se(mouse_x >= x e mouse_y >= y e mouse_x <= x+larguraf e mouse_y <= y+alturaf)
		{
			retorne verdadeiro
		}senao{
			retorne falso
		}
		
	}

	funcao criarJanela(inteiro larguraf, inteiro alturaf, cadeia titulo)
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(larguraf,alturaf)
		g.definir_titulo_janela(titulo)


	}

	funcao cor_fundo_padrao(inteiro cor)
	{
		g.definir_cor(cor)
		g.limpar()	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 8154; 
 * @DOBRAMENTO-CODIGO = [15, 130, 435, 443, 465, 479, 488];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */