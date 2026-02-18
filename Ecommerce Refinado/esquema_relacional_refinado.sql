CREATE DATABASE ecommerce_final;
USE ecommerce_final;

-- cliente
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    endereco VARCHAR(150),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- categoria
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- produto
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    infantil BOOLEAN DEFAULT FALSE,
    avaliacao DECIMAL(2,1) DEFAULT 0,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- fornecedor

CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL
);

-- vendedor

CREATE TABLE vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cnpj CHAR(14) UNIQUE,
    cpf CHAR(11) UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    cidade VARCHAR(100)
);

-- produto fornecedor

CREATE TABLE produto_fornecedor (
    id_produto INT,
    id_fornecedor INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_produto, id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

-- produto vendedor
CREATE TABLE produto_vendedor (
    id_produto INT,
    id_vendedor INT,
    quantidade INT DEFAULT 1,
    status ENUM('Disponivel','Sem Estoque') DEFAULT 'Disponivel',
    PRIMARY KEY (id_produto, id_vendedor),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);

-- estoque 

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    quantidade INT DEFAULT 0,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

-- pedido

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Cancelado','Confirmado','Em Andamento') DEFAULT 'Em Andamento',
    valor_frete DECIMAL(10,2) DEFAULT 0,
    pagamento_cartao BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- item pedido
	
CREATE TABLE item_pedido (
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);



