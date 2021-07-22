programa
{
	inclua biblioteca Objetos --> o

	inclua biblioteca Util--> u


	cadeia nomeAtendente[] = {"Atendente1 ", "Atendente2", "Atendente3"}
	inteiro id[] = {1,2,3}
	real comisaoAten[] = {0.0,0.0,0.0}

	real valores[] ={21.50,120.00,9.90,14.90,29.90,14.00,4.90,55.90,16.10,21.90,34.80,99.00,14.90,54.90,29.90,19.90,26.90,34.90,69.90,49.90}
	real comissoes[] = {15.0,15.0,10.0,10.0,15.0,10.0,10.0,15.0,10.0,15.0,15.0,15.0,10.0,15.0,15.0,15.0,15.0,15.0,15.0,15.0}

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

	inteiro produtosVendidos[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

	funcao inicio()
	{
		menu()
	}

	funcao menu()
	{
		
		inteiro opcao

		enquanto(verdadeiro)
		{
			escreva("Ola bem vindo!\nDigite o numero corespondente\n")
			escreva("1 - Vender Produto\n2 - Informações\n3 - Mudar Nomes\n0 - Sair\n")
			leia(opcao)
			limpa()

			
			se(opcao == 0)
			{
				pare
			}
			

			se(opcao == 1)
			{

				enquanto(verdadeiro)
				{
					
					listaProdutos()
					inteiro idV = 1,idAtendenteV=1,quantidade
					inteiro sair
					escreva("\n")
					
					listaAtendente()
	
					escreva("\nQual id do Atendente que iria vender o produto? para sair aparte 0\n")
					leia(idAtendenteV)
					se(idAtendenteV == 0)
					{
						pare
					}

					se(idAtendenteV <= 3 e idAtendenteV >=1)
					{
						
						escreva("\nQual produto de acordo com seu ID gostaria de vender? para sair aperte 0\n") 
						leia(idV)
						se(idV == 0)
						{
							pare
						}

						se(idV <= 20 e idV >= 1)
						{
			
							escreva("Quantidade de unidades:\n")
							leia(quantidade)
				
							venderComissao(idV,idAtendenteV,quantidade)
		
							escreva("Gostaria de compra outro produto? 1 - SIM 2 - NAO")
							leia(sair)
							limpa()
							
							se(sair == 2)
							{
								pare
							}
						}									
					}

					se(idAtendenteV < 3 e idAtendenteV >1 )
					{
						escreva("Id do antendente não existe")
						limpa()
					}

					se(idV < 20 e idV > 1)
					{
						escreva("Id do produtor nao existe")
					}
					

				}
				
			}

			se(opcao == 2)
			{
				escreva("\nInformações sobre o sistema\n")
				inteiro sair

				escreva("Comissão dos antendentes\n")
				para(inteiro i=0 ; i<u.numero_elementos(comisaoAten) ;i++)
				{
					escreva("Nome: ", nomeAtendente[i], " ; Comissão: ", comisaoAten[i],"\n")
				}
				escreva("\n----------------------------------------------------------------------\n")
				para(inteiro i=0 ; i<u.numero_elementos(produtosVendidos) ; i++)
				{
					escreva("Nome: ",produtos[i]," ; Unidades Vendidas:",produtosVendidos[i],"\n")
					
				}
				escreva("\n----------------------------------------------------------------------\n")
				
				escreva("Para sair aperte 0 para sair" )
				leia(sair)
				limpa()

				se(sair == 0)
				{
					escreva("\n")
				}
				
			}	

			se(opcao == 3)
			{
				enquanto(verdadeiro)
					
					escreva("Lista de atendentes\n")
					listaAtendente()
					
					inteiro mudar,sair
					cadeia novoNome
					
					escreva("\nDigite o Id do atendente que deseja mudar o nome\n")
					leia(mudar)
					escreva("Digite o novo nome\n")
					leia(novoNome)
					
					nomeAtendente[mudar] = novoNome

					escreva("Para sair digite 0")
					leia(sair)
				 		
					se(sair == 0)
					{
						pare
					}
			}
		
		}
	}

	funcao listaProdutos()
	{
		escreva("Lista Com todos os produtos da loja\n")

		para(inteiro i = 0; i<20 ; i++)
		{
			escreva("ID = ",i+1," - ", produtos[i]," || Valor - ", valores[i] ," || Comissão - ", comissoes[i],"\n")
		}
		
			
	}

	funcao listaAtendente()
	{

		inteiro tam
		para(inteiro i = 0 ; i < 3 ;i++)
		{
			escreva("ID = ",id[i] ,"|| Nome = ", nomeAtendente[i],"\n")
		}
		
	}

	funcao venderComissao(inteiro idV, inteiro idAtendenteV, inteiro quantidade)
	{
		idV = idV-1
		cadeia nome = nomeAtendente[idAtendenteV]
		real valor = valores[idV]
		real comissao = comissoes[idV]
	
		real totalRecebido = (valor * (comissao/100)) * quantidade
		comisaoAten[idAtendenteV] += totalRecebido
		produtosVendidos[idV] += 1*quantidade
		
		escreva("\nPRODUTO VENDIDO: ", produtos[idV],"\nUNIDADES: ",quantidade,"\nVALOR POR UNIDADE: ",valor ," TOTAL = " ,valor*quantidade,
			   "\nNOME DO ATENDENTE: ",nome,"\nCOMISSÃO DO ATENDENTE: ", totalRecebido,"\n\n")
		
	}
	
}











/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4602; 
 * @DOBRAMENTO-CODIGO = [14, 55, 126, 184];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */