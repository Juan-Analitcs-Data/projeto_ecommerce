create database Ecommerce;
use Ecommerce;

-- criar tabelas cliente
create table cliente(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_cliente unique(CPF)
);
alter table cliente auto_increment=1;

ALTER TABLE cliente 
MODIFY Address VARCHAR(100);

desc cliente;
-- criar tabelas produto
alter table produto auto_increment=1;
create table produto(
	idProduto int auto_increment primary key,
    Pname varchar(20),
    Classificationkids bool,
    Category enum("Eletronico","Vestimenta","Brinquedos","Alimentos","Móveis") not null,
    Address varchar(30),
    avaliacao float default 0,
    size varchar(10)
);
alter table produto auto_increment=1;
-- criar tabela payment
create table payment(
	idpaClient int,
    idPayment int,
    typePayment enum('Boleto','Cartao','Dois cartoes'),
    limitAvailabe float,
    primary key(idpaClient,idPayment),
    constraint fk_payment_client foreign key (idpaClient) references cliente(idClient)
);

-- criar tabelas pedido
create table pedido(
	idPedido int auto_increment primary key,
    idPeClient int,
    peStatus enum('Cancelado','Confirmado','Em Andamento'),
    peDescripition varchar(255),
    sendValor float default 10,
    paymentcah bool default false,
    constraint fk_pedido_cliente foreign key (idPeClient) references cliente(idClient)
);
alter table pedido auto_increment=1;
-- criar tabela Estoque 

create table estoque(
	idEstoque int auto_increment primary key,
    estoqueLocation varchar(255),
    quantidade int default 0
);
alter table estoque auto_increment=1;
-- criar tabela Fornecedor 
create table fornecedor(
	idFornecedor int auto_increment primary key,
    Socialname varchar(255) not null,
    CNPJ char(15),
    contato char(11) not null,
    constraint unique_fornecedor_cnpj unique (CNPJ)
);
alter table fornecedor auto_increment=1;
-- criar tabela terceiro vendedor

create table vendedor(
	idVendedor int auto_increment primary key,
    Socialname varchar(255) not null,
    CNPJ char(15),
    CPF char(11),
    contato char(11) not null,
    location varchar(255),
    constraint unique_fornecedor_cnpj unique (CNPJ),
    constraint unique_fornecedor_cpf unique (CPF)
);
alter table vendedor auto_increment=1;
create table produtovendedor(
	idPVendedor int,
    idPProduto int,
    quantity int default 1,
    postatus enum('Disponivel','Sem estoque'),
    primary key(idPvendedor,idPProduto),
    constraint fk_produto_vendedor foreign key	(idPvendedor) references vendedor(idVendedor),
    constraint fk_produtp_produtp foreign key (idPProduto) references produto (idProduto)
);

create table localestoque(
	idLproduto int,
    idLestoque int,
    location varchar(255) not null,
    primary key (idLproduto,idLestoque),
    constraint fk_eproduto_produto foreign key (idLproduto) references produto(idProduto),
    constraint fk_eproduto_estoque foreign key (idLestoque) references estoque(idEstoque)
);

create table produtopedido(
	idPPproduto int,
    idPPpedido int,
    ppQuantidade int default 1,
    ppStatus enum('Disponivel','Sem Estoque') default 'Disponível',
    primary key (idPPproduto,idPPpedido),
    constraint fk_PP_produto foreign key (idPPproduto) references produto(idProduto),
    constraint fk_PP_ppedido foreign key (idPPpedido) references pedido(idPedido)    
);

create table produtofornecedor(
	idpfFornecedor int,
    idpfProduto int,
    quantity int not null,
    primary key(idpfFornecedor,idpfProduto),
    constraint fk_pf_fornecedor foreign key (idpfFornecedor) references fornecedor(idFornecedor),
    constraint fk_pf_produto foreign key (idpfProduto) references produto(idProduto)
);
show tables;

desc cliente;
desc produto;

