program Menu;
uses crt;

type registro = record
  nome, cidade, civil, clienteinvestir : string;
  idade, daytradeDay, posicao: integer;
  sexo, nomeinvest : string;
  investir : string;
	M, total : real;
end;
        
var
  cliente : array [0..100] of registro;
  funcionarios : array [0..100] of registro;
  investimento_conta : array[0..100, 0..100] of registro;
	nomecliente, nomefuncionario, clienteM : string; 
	clienteinv, funcionarioDay, funcionarioDayt, investimento : string;
  menu_principal, menu_cadastro, menu_relatorios, menu_servicos, civil, opcaoservico, menugeral : integer; 
	indicebusca, i, x, z, d, indiceC, indiceF, indiceM, indiceD, fiminvest : integer; 
	sexo_genero, opcao : char; 
	C, T, IT, J, total : real;
  achou, finalizar, loop : boolean;
  number, daytrade, menosdayt : integer;
	arq, arq2 : text;
	local : string; 
  opcaobanco : integer; 
  
procedure Menu;
begin
	writeln('');
	writeln('               --- Corretora Multi-Investimentos ---');
	writeln('');
	writeln('|-------------|  |-------------|  |---------------------|  |----------|');
	writeln('| 1-Cadastros |  |  2-Serviços |  |  3-Relatórios/Busca |  |  4-Sair  |');
	writeln('|-------------|  |-------------|  |---------------------|  |----------|');
	writeln();
	writeln('Digite uma opcao:');
	readln(menu_principal);
end;
  
procedure Cadastro;
begin
	writeln('');
	writeln(' --- Cadastros ---');
  writeln('');
  writeln('[1] Cadastrar Cliente');
  writeln('[2] Cadastrar Funcionários');
  writeln('[3] Sair');
  writeln('');
  writeln('Digite uma opçao:');	
end;
  
procedure Servicos;
begin
	textcolor(14);
	textbackground(4);
	writeln('Atençao, todos os serviços estao utilizando as melhores taxas para os clientes');
	writeln('Sinta-se a vontade para consultar nossos funcionários caso alguma dúvida');
	textbackground(16);
	textcolor(15);
	writeln('');
	writeln(' --- Serviços ---');
	writeln('Lista de investimentos possíveis');
	writeln('');
	writeln('[1] Tesouro Direto préfixado');
	writeln('[2] CDB préfixado');
	writeln('[3] LCI/LCA préfixado');
	writeln('[4] Mercado de Açoes');
	writeln('[5] Fundos de investimentos');
	writeln('[6] Sair');
	writeln('');
	writeln('Digite uma opçao:');
end;

procedure ClienteFuncao;
begin	
	writeln('');
	writeln('--- Tipo de serviço ---');
	writeln(''); 
	writeln('[1] Cliente');
	writeln('[2] Daytrade');
	writeln('[3] Sair');
	writeln('Digite uma opçao:');
	readln(opcaoservico);
end;

procedure NomeClienteInvestir;
begin
	clrscr;
	writeln('');
	writeln('Digite o nome do cliente:');
	readln(investimento_conta[x,1].clienteinvestir);
	loop := true;
end;

procedure Relatorio;
begin
	writeln('');
	writeln(' --- Relatórios --- ');
	writeln('');
	writeln('[1] Relatório de clientes');
	writeln('[2] Relatório de funcionários');
	writeln('[3] Relatório de Invst./DayT');
	writeln('[4] Gerar banco de dados');
	writeln('[5] Sair');
	writeln('');
	writeln('Digite uma opçao:');
end;
									  
function Cadsex(sexo_genero : char) : string; 
var             
	se : string;
	
begin
	if (sexo_genero = 'm') then
	begin
		se := 'Masculino';
	end
	
	else if (sexo_genero = 'f') then
	begin
		se := 'Feminino';
	end
		
	else
	begin
		writeln('Dado inválido');
		writeln('Digite corretamente o sexo:');
		readln(sexo_genero);
	end;	
	Cadsex := se;
end;
	 
Begin
	textcolor(15);
  repeat
  	clrscr;
		Menu;
		case menu_principal of  
		
		1:begin
				clrscr;             
		    Cadastro;
		    read(menu_cadastro);   
	    
				case menu_cadastro of  
					1:begin
							clrscr;
							for i := 0 to 100 do
							begin
								if (cliente[i].nome = '') then
								begin							
									writeln('');
									writeln('--- Cadastro Cliente ---');
									writeln('');
					        write('Digite o nome do cliente: ');
					        readln(cliente[i].nome);
					        write('Digite a idade do cliente: ');
					        readln(cliente[i].idade);
					        write('Digite a cidade do cliente: ');
					        readln(cliente[i].cidade);
					        write('Digite o sexo do cliente, <m>asculino - <f>eminio: ');
					        readln(sexo_genero);
					        Cadsex(sexo_genero);
					        cliente[i].sexo := Cadsex(sexo_genero);
									writeln('Digite o Est.Civil do cliente: ');
									writeln('[1] Solteiro(a) | [2] Casado(a) | [3] Viúvo(a) | [4] Divorciado(a)');
					        readln(civil);
									
									case civil of
										1:begin
												cliente[i].civil := 'Solteiro(a)';
											end;
											
										2:begin
												cliente[i].civil := 'Casado(a)';
											end;	
									
										3:begin
												cliente[i].civil := 'Viúvo(a)';
											end;
										
										4:begin
												cliente[i].civil := 'Divorciado(a)';
											end;
									end;
					        	
									if (cliente[i].idade <= 14) then
									begin
										writeln('');
										writeln('Cliente muito jovem! Ou a idade foi inserida incorretamente');
										writeln('Digite corretamente a idade do cliente:');
										readln(cliente[i].idade);
										
										if (cliente[i].idade >= 15) then
										begin
											writeln('');
											writeln('Cliente cadastrado com sucesso.');
											writeln('Precione ENTER para continuar');
											readln;
											break;
										end;
									end
									
									else
									begin
										writeln('');
										writeln('Cliente cadastrado com sucesso.');
				        		writeln('Precione ENTER para continuar');
										readln;
										break;
									end;
								end;
							end;
						end;
			    
			    2:begin
				    	clrscr;
				    	for z := 0 to 100 do
				    	begin
				    		if (funcionarios[z].nome = '') then
				    		begin
						    	writeln('');
						    	writeln('--- Cadastro Funcionário(a) ---');
						    	writeln('');
					        write('Digite o nome do funcionário(a): ');
					        readln(funcionarios[z].nome);
					        write('Digite a idade do funcionário(a): ');
					        readln(funcionarios[z].idade);
					        write('Digite a cidade do funcionário(a): ');
					        readln(funcionarios[z].cidade);
					        write('Digite o sexo do funcionário(a), <m>asculino - <f>eminino: ');
					        readln(sexo_genero);
					        Cadsex(sexo_genero);
					        funcionarios[z].sexo := Cadsex(sexo_genero);
							    writeln('Digite o Est.Civil do funcinário(a):');
					        writeln('[1] Solteiro(a) | [2] Casado(a) | [3] Viúvo(a) | [4] Divorciado(a)');
					        readln(civil);
									
									case civil of
										1:begin
												funcionarios[z].civil := 'Solteiro(a)';
											end;
											
										2:begin
												funcionarios[z].civil := 'Casado(a)';
											end;	
									
										3:begin
												funcionarios[z].civil := 'Viúvo(a)';
											end;
										
										4:begin
												funcionarios[z].civil := 'Divorciado(a)';
											end;
									end;
		
									if (funcionarios[z].idade <= 14) then
									begin
										writeln('');
										writeln('Nao contratamos menor aprendiz, altere essa idade!');
										writeln('Digite outra idade:');
										readln(funcionarios[z].idade);
										
										if (funcionarios[z].idade >= 18) then
										begin
											writeln('');
											writeln('Funcionário cadastrado com sucesso.');
											writeln('Precione ENTER para continuar');
											readln;
											break;
										end;
									end
									
									else
									begin
										writeln('');
										writeln('Funcionário cadastrado com sucesso.');
					        	writeln('Precione ENTER para continuar');
										readln;
										break;	
									end;
								end;
							end;
						end;  
					
					3:begin
						end;
				end;		
			end;
		 
		2:begin
				clrscr;
				ClienteFuncao;	
				    
				if (opcaoservico = 1) then
				begin
          clrscr;
					
					for x := 0 to 100 do 
					begin
						if (investimento_conta[x,1].clienteinvestir = '') then
						begin
							NomeClienteInvestir;
									
							while (loop = true) do
							begin
								clrscr;
								Servicos;
								readln(menu_servicos);
								
								case (menu_servicos) of
									1:begin
											clrscr;
											IT := 2.07;
											writeln('');
											writeln('A taxa desse investimento é de, ', IT:0:2,'%');
											writeln('Deseja continuar? (s)im | (n)ao');
											readln(opcao);
											
											if (opcao = 's') then
											begin
												cliente[x].nomeinvest := 'Tesouro Direto préfixado';
												writeln('');
												writeln('--- Tesouro Direto préfixado ---');
										  	writeln('Digite o valor do Capital:');
										  	readln(C);
										  	writeln('Tempo de investimento(a.a.):');
										  	readln(T);
										  	writeln('');
										  	writeln('Capital: ', C:0:2,' reais, Tempo(a.a.): ', T:0:0,' ano(s), Taxa(a.a.): ', IT:0:2,'%');
												J := (C * IT * T) / 100;
												writeln('Os juros gerados foram de, ', J:0:2,' reais');
												writeln('');
												cliente[x].M := J + C;
												writeln('O montante para liquides será de, ', cliente[x].M:0:2,' reais');
												writeln('Precione ENTER para continuar');
												readln;
												cliente[x].total := cliente[x].total + cliente[x].M;
											end
											
											else
											begin
												loop := true;
											end;  
										end;
										
									2:begin
											clrscr;
											IT := 0.09;
											writeln('');
											writeln('A taxa do investimento é de, ', IT:0:2,'%');
											writeln('Deseja continuar? (s)im | (n)ao');
											readln(opcao);
											
											if (opcao = 's') then
											begin
												cliente[x].nomeinvest := 'CBD préfixado';
												writeln('');
												writeln('--- CDB préfixado ---');
												writeln('Digite o valor do capital:');
												readln(C);
												writeln('Digite o Tempo do investimento:');
												readln(T);
												writeln('');
												writeln('Capital: ', C:0:2,' reais, Tempo(a.a.): ', T:0:0,' ano(s), Taxa(a.a.): ', IT:0:2,'%');
												J := C * IT * T;
												writeln('Os juros gerados foram de, ', J:0:2,' reais');
												writeln('');
												cliente[x].M := J + C;
												writeln('O montante para liquides será de, ', cliente[x].M:0:2,' reais');
												writeln('Precione ENTER para continuar');
												readln;
												cliente[x].total := cliente[x].total + cliente[x].M;
										  end
										  
										  else
										  begin
										  	loop := true;
										  end;
										end;
										
									3:begin
									  	clrscr;
									  	writeln('');
									  	IT := 0.01;
									  	writeln('A taxa do investimento é de, ', IT:0:2,'%');
									  	writeln('Deseja continuar? (s)im | (n)ao');
									  	readln(opcao);
									  	
									  	if (opcao = 's') then
									  	begin
									  		cliente[x].nomeinvest := 'LCI/LCA préfixado';
									  		writeln('');
									  		writeln('--- LCI/LCA préfixado ---');
												writeln('Digite o valor do investimento:');
									  		readln(C);
									  		writeln('Digite o tempo do investimento(a.a):');
									  		readln(T);
									  		writeln('');
									  		writeln('Capital: ', C:0:2,' reais, Tempo(a.a.): ', T:0:0,' ano(s), Taxa(a.a.): ',  IT:0:2,'%');
									  		J := C * IT * T;
									  		writeln('Os juros gerados foram de, ', J:0:2,' reais');
									  		writeln('');
									  		cliente[x].M := J + C;
									  		writeln('O montante pada liquides será de, ', cliente[x].M:0:2,' reais');
									  		writeln('Precione ENTER para continuar');
									  		readln;
									  		cliente[x].total := cliente[x].total + cliente[x].M;			  		
									  	end;	
										end;
										
									4:begin
											clrscr;
											IT := 5.33;
											writeln('');
											writeln('A taxa desse investimento é de, ', IT:0:2,'%');
											writeln('Deseja continuar? (s)im | (n)ao');
											readln(opcao);
											
											if (opcao = 's') then
											begin
												cliente[x].nomeinvest := 'Mercado de acões';
												writeln('');
												writeln('--- Mercado de açoes ---');
												writeln('Digite o valor do capital:');
												readln(C);
												writeln('Tempo de investimento(a.a.):');
												readln(T);
												writeln('');
												writeln('Capital: ', C:0:2,' reais, Tempo(a.a.): ', T:0:0,' ano(s), Taxa(a.a.): ', IT:0:2,'%');
												writeln('');
												cliente[x].M := C * (1 + IT) * T * T;                    
												writeln('O montante para liquidez será de, ', cliente[x].M:0:2,' reais');
												writeln('Precione ENTER para continuar');
												readln;
												cliente[x].total := cliente[x].total + cliente[x].M;
										  end
										  
										  else
										  begin
										  	loop := true;
										  end;

										end;
										
									5:begin
											clrscr;
											IT := 8.02;
											writeln('');
											writeln('A taxa de investimento é de, ', IT:0:2,'%');
											writeln('Deseja continuar? (s)im | (n)ao');
											readln(opcao);
											
											if (opcao = 's') then
											begin
												cliente[x].nomeinvest := 'Fundos de investimento';
												writeln('');
												writeln('--- Fundos de investimentos ---');
												writeln('Digite o valor do capital:');
												readln(C);
												writeln('Tempo de investimento(a.a.):');
												readln(T);
												writeln('');
												writeln('Capital: ', C:0:2,' reais, Tempo(a.a.): ', T:0:0,' ano(s), Taxa(a.a.): ', IT:0:2,'%');
												writeln('');
												cliente[x].M := C * (1 + IT) * T * T;
												writeln('O montante para liquides será de, ', cliente[x].M:0:2,' reais');
												writeln('Precione ENTER para continuar');
												readln;
												cliente[x].total := cliente[x].total + cliente[x].M;
											end
											
											else
											begin          
												loop := true;
											end;		
										end;
										
									6:begin
											writeln('');
											writeln('Deseja fazer mais algum investimento?');
											writeln('[1] Sim');
											writeln('[2] Nao');
											writeln('Digite uma opcao:');
											readln(fiminvest);
											
											if (fiminvest = 1) then
											begin
												loop := true;
											end
											
											else
											begin
												loop := false;
											end;
										end;	
								end;
							end;
							break;
						end;
					end;
				end
				
				else if (opcaoservico = 2) then
				begin
				
					clrscr;
					writeln('');
					writeln('Digite o nome do funcionário:');
					readln(funcionarioDay);
					writeln('');
					
					for z := 0 to 100 do
					begin
						for d := 0 to 100 do
						begin
							if (funcionarioDay = funcionarios[z].nome) then
							begin
								if (funcionarios[z].nome = funcionarios[d].nome) then
								begin
									achou := true;
								end;
							end;
						end;
					end;
					
					for d := 0 to 100 do
					begin
						if (funcionarios[d].daytradeDay = 0) and (achou = true) then
						begin
							randomize;
							number := random(101);
							menosdayt := menosdayt + 1;
							
							if (menosdayt >= 0) and (menosdayt < 3) then
							begin
								daytrade := daytrade + number;
								writeln('A liquidez é de: ',daytrade);
							end
							
							else if (menosdayt = 3) then
							begin
								daytrade := daytrade - number;
								writeln('A liquidez é de: ',daytrade);
								menosdayt := 0;	 
							end;
							
							readln;
							funcionarios[d].daytradeDay := daytrade;
							break;
						end
						
						else
						begin
							writeln('Funcionário nao cadastrado');
							writeln('Precione ENTER para continuar');
							readln;
							break;
						end;
					end;
				end
			end;
			
		3:begin
				loop := true;
				while (loop = true) do
				begin
					
				clrscr;
				Relatorio;
				readln(menu_relatorios);
				
					case menu_relatorios of
						1:begin
								clrscr;
					      achou := false; 
					      writeln('');
								writeln('--- Busca de clientes ---');
								writeln('Digite o nome do cliente');
								readln(nomecliente);
					      
					      for i := 0 to 100 do
					      begin
					        if nomecliente = cliente[i].nome then
					        begin
						      	achou := true;
									  indicebusca := i;
						      end;
					      end;
					      
					      if achou = true then
					      begin
					      	writeln('');
					        writeln('--- Dados Do Cliente ---');
					        writeln('');
					        writeln('Nome --> ', cliente[indicebusca].nome);
					        writeln('Idade -> ', cliente[indicebusca].idade);
					        writeln('Cidade -> ', cliente[indicebusca].cidade);
					        writeln('Sexo -> ', cliente[indicebusca].sexo);
					        writeln('Est.Civil -> ', cliente[indicebusca].civil);
					        writeln('');
					        writeln('Precione ENTER para continuar');
					        readln;
					      end
					      
					      else
					      begin
					        writeln('');
					        writeln('Cliente nao cadastrado');
					        readln;
				      	end;
							end;
							
						2:begin
								clrscr;
					      achou := false; 
					      writeln('');
					      writeln('--- Busca de Funcionários ---');
					      writeln('Digite o nome do funcionário');
					      readln(nomefuncionario);
					      
					      for z := 0 to 100 do
					      begin
					        if (nomefuncionario = funcionarios[z].nome) then
					        begin
					          achou := true;
					          indicebusca := z;
					        end;
					      end;
					      
					      if achou = true then
					      begin
					        writeln('');
					        writeln('--- Dados Do Funcionário ---');
					        writeln('');
					        writeln('Nome --> ', funcionarios[indicebusca].nome);
					        writeln('Idade -> ', funcionarios[indicebusca].idade);
					        writeln('Cidade -> ', funcionarios[indicebusca].cidade);
					        writeln('Sexo -> ', funcionarios[indicebusca].sexo);
					        writeln('Est.Civil -> ', funcionarios[indicebusca].civil);
					        writeln('');
					        writeln('Precione ENTER para continuar');
					        readln;
					      end
					      
					      else
					      begin
					        writeln('');
					        writeln('Funcionário nao cadastrado');
					        readln;
				      	end;
							end;
							
						3:begin
								clrscr;
								writeln('');
								writeln('--- Relatórios Invst./DayT. ---');
								writeln('');
								writeln('[1] Cliente');
								writeln('[2] Funcionário');
								writeln('[3] Sair');
								writeln('Digite uma opcao:');
								readln(menugeral);
								
								case menugeral of
								1:begin
										clrscr;
										achou := false;
										writeln('');
										writeln('Digite o nome do cliente:');
										readln(clienteM);
										
										
										for i := 0 to 100 do
										begin
											if (clienteM = cliente[i].nome) then
											begin
												for x := 0 to 100 do
												begin
													if (clienteM = investimento_conta[x,1].clienteinvestir) then
													begin
														achou := true;
														indicebusca := x;
														total := cliente[x].total;
														break; 
													end;
												end;
												
												for x := 0 to 100 do 
												begin
													if (clienteM = cliente[x].nome) then
													begin
														investimento := cliente[x].nomeinvest;
													end;
												end;
	
												if (achou = true) then
												begin
													writeln('');
													writeln('--- Relatório de Investimentos ---');
													writeln('');
													writeln('O cliente ', cliente[indicebusca].nome,' investiu com o total de:');
													writeln('R$', total:0:2);
													writeln('Precione ENTER para continuar');
													readln;
												end
												
												else
												begin
													writeln('');
													writeln('Cliente nao cadastrado');
													writeln('Precione ENTER para continuar');
													readln;
												end;
											end;
										end; 
									end;
									
								2:begin
										clrscr;
										achou := false;
										writeln('');
										writeln('Digite o nome do funcionário:');
										readln(funcionarioDayt);
										
										for z := 0 to 100 do
										begin
											for d := 0 to 100 do
											begin
												if (funcionarioDayt = funcionarios[z].nome) then
												begin
													if (funcionarios[z].nome = funcionarios[d].nome) then
													begin
														achou := true;   
														indicebusca := d;
													end;
												end;
											end;
										end;
										
										if (achou = true) then
										begin		
											
											writeln('');
											writeln('--- Relatório DayTrade ---');
											writeln('');
											writeln('Funcionário: ', funcionarios[indicebusca].nome);
											writeln('A montante gerado: R$', funcionarios[indicebusca].daytradeday);
											writeln('');
											writeln('Precione ENTER para continuar');
											readln;
										end
										
										else
										begin
											writeln('Funcionário nao cadastrado');
											writeln('Precione ENTER para continuar');
											readln;
										end;
									end;
								
								3:begin
									end;
							end;
				end;		
				
						4:begin
								clrscr;
								writeln('');
								writeln('--- Banco de dados ---');
								writeln('');
								writeln('[1] Cliente');
								writeln('[2] Funcionário');
								writeln('[3] Sair');
								writeln('');
								writeln('Digite a opcao do banco que deseja gerar:');
								readln(opcaobanco);
								
								case opcaobanco of
								1:begin
										clrscr;
							      achou := false; 
										writeln('Digite o nome do cliente:');
										readln(nomecliente);
							      
							      for x := 0 to 100 do
										begin
											for i := 0 to 100 do
											begin
												if (nomecliente = cliente[x].nome) then
												begin
													if (cliente[x].nome = cliente[i].nome) then
													begin
														achou := true; 
														indicebusca := i;
													end;
												end;
											end;
										end;
							      
							      if (achou = true) then
							      begin
							      	clrscr;
							      	writeln('');
							    		writeln('Cliente encontrado');
											
											local := 'RelatorioCliente.txt';
											assign(arq,'RelatorioCliente.txt');
											rewrite(arq);
											reset(arq);
											writeln(arq, 'Relatório do Cliente');
											writeln(arq, '');
											writeln(arq,'Nome --> ', cliente[indicebusca].nome);
											writeln(arq,'Idade -> ', cliente[indicebusca].idade);
											writeln(arq,'Cidade -> ', cliente[indicebusca].cidade);
											writeln(arq,'Sexo -> ', cliente[indicebusca].sexo);
											writeln(arq,'Est.Civil -> ', cliente[indicebusca].civil);
											writeln(arq,'Valor investido -> R$', total:0:2);
											close(arq);
											writeln('');
											write('Criando banco');delay(900);write('.');delay(900);write('.');delay(900);write('.');
											delay(950);
											writeln('');
											writeln('');
											writeln('Banco de dados criado com sucesso');
											writeln('Precione ENTER para continuar');
											readln;
									  end
									  
									  else
									  begin
									  	writeln('');
									  	writeln('Cliente nao encontrado');
									  	writeln('Precione ENTER para continuar');
											readln;
									  end;
									end;
								
								2:begin
										clrscr;
							      achou := false;
							      writeln('Digite o nome do funcionário');
							      readln(nomefuncionario);
							      
							      for i := 0 to 100 do
							      begin
							        if (nomefuncionario = funcionarios[z].nome) then
							        begin
							          achou := true;
							          indicebusca := z;
							        end;
							      end;
							      
							      if (achou = true) then
							      begin
							      	clrscr;
							        writeln('');
							        writeln('Funcionário encontrado');
											
											local := 'RelatorioFuncionario.txt';
											assign(arq2,'RelatorioFuncionario.txt');
											rewrite(arq2);
											reset(arq2);
											writeln(arq, 'Relatório do Cliente');
											writeln(arq, '');
											writeln(arq2,'Nome --> ', funcionarios[indicebusca].nome);
											writeln(arq2,'Idade -> ', funcionarios[indicebusca].idade);
											writeln(arq2,'Cidade -> ', funcionarios[indicebusca].cidade);
											writeln(arq2,'Sexo -> ', funcionarios[indicebusca].sexo);
											writeln(arq2,'Est.Civil -> ', funcionarios[indicebusca].civil);
											writeln(arq2,'DayTrade -> ', daytrade);
											close(arq2);
											writeln('');
											write('Criando banco');delay(900);write('.');delay(900);write('.');delay(900);write('.');
											delay(950);
											writeln('');
											writeln('');
											writeln('Banco de dados criado com sucesso');
											writeln('Precione ENTER para continuar');
											readln;
									  end
									  
									  else
									  begin
									  	writeln(''); 
									  	writeln('Funcionário nao encontrado');
									  	writeln('Precione ENTER para continuar');
									  	readln;
									  end;
									end;
								
								3:begin
										loop := true;	
									end;
								end;	 
							end;
												
						5:begin
								loop := false;
							end;
					end;	
				end; 
		  end;
		  
		4:begin
				clrscr;
				writeln('');
				write('Finalizando'); delay(900); write('.'); delay(900); write('.'); delay(900); write('.');
				writeln('');
				writeln('');
				delay(900);
				finalizar := true;
			end; 
		end;
	
	until (finalizar = true);
  
End.