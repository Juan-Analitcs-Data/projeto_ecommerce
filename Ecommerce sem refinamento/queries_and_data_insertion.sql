use Ecommerce;

insert into cliente (Fname, Minit, Lname, CPF,Address)
	values('Maria','M','Silva', 12346789,'rua silva de prata 29, Carangola'),
		('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro'),
		('Ricardo','F','Silva', 45678913, 'avenida alemeda vinha 1009,'),
		('Julia','S','França', 789123456, 'rua lareijras 861, Centro'),
		('Roberta','G','Assis', 98745631, 'avenidade koller 19, Centro'),
		('Isabela','M','Cruz', 654789123, 'rua alemeda das flores 28');
        

	
insert into produto (Pname, Classificationkids, Category,Address, avaliacao, size) values
					('Fone de ouvido', false,'Eletrônico',null,'4',null),
					('Barbie Elsa', true,'Brinquedos',null,'3',null),
					('Body Carters', true,'Vestimenta',null,'5',null),
					('Microfone Vedo', False,'Eletronico',null,'4',null),
					('Sofa retratil',False,'Moveis',null,'3','3x57x80'),
					('Farinha de arroz', False, 'Alimentos',null,'2',null),
					('Fire Stick Amazon', False,'Eletrônico',null,'3',null);
desc pedido;
				
insert into pedido (idPeClient, peStatus, peDescripition, sendValor, paymentCah) values
						(1, null,'compra via aplicativo',null,1),
						(2,null,'compra via aplicativo',50,0),
						(3,'Confirmado',null,null,1),
						(4,null,'compra via web site',150,0);
select * from produto;
desc produtopedido;
insert into produtopedido (idPPproduto, idPPpedido, ppQuantidade, ppStatus) values
							(15,1,2,null),
							(16,1,1,null),
							(17,2,1,null);

insert into estoque (estoqueLocation, quantidade) values
							('Rio de Janeiro',1000),
							('Rio de Janeiro',500),
							('São Paulo',10),
							('São Paulo',100),
							('São Paulo',10),
							('Brasilia',60); 
                            
select * from estoque;

insert into localestoque (idLproduto,idLestoque,location) values
							(15,2,'RJ'),
                            (16,6,'GO');
desc fornecedor;
insert into fornecedor(SocialName,CNPJ,contato)
			values ('Almeida e filhos', 123456789123456, '21985474' ),
					('Eletrônicos Silva', 854519649143457, '21985484' ),
					('Eletrônicos Valma', 934567893934695, '21975474');
                    
desc produtofornecedor;
insert into produtofornecedor(idpfFornecedor,idpfProduto,quantity) values
								(1,15,500),
								(1,16,400),
								(2,18,633),
								(3,17,5),
								(2,19,10);
desc vendedor;	

insert into vendedor (SocialName,CNPJ,CPF,contato,location) values
			('Tech eletronics',  123456789456321, null, 219946287, 'Rio de Janeiro'),
			('Botique Durgas', null,123456783, 219567895,'Rio de Janeiro'),
			('Kids World',456789123654485,null, 1198657484,'São Paulo');	

desc produtovendedor;
insert into produtovendedor (idPVendedor,idPProduto,quantity,postatus) values
						(1,20,80,null),
                        (2,21,10,null);
select count(*) as numerodecliente from cliente;
desc pedido;
select * from cliente c , pedido o where c.idClient = o.idpeClient;

