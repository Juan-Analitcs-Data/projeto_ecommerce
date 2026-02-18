use ecommerce_final;

INSERT INTO categoria (nome) VALUES
('Eletrônicos'),
('Vestimenta'),
('Brinquedos'),
('Alimentos'),
('Móveis');

INSERT INTO cliente (primeiro_nome, sobrenome, cpf, endereco) VALUES
('Maria', 'Silva', '12345678901', 'Rua das Flores, 100 - Rio de Janeiro'),
('Matheus', 'Oliveira', '98765432100', 'Av. Central, 200 - São Paulo'),
('Julia', 'França', '45678912300', 'Rua das Laranjeiras, 50 - Belo Horizonte'),
('Ricardo', 'Pereira', '78912345600', 'Av. Brasil, 300 - Recife');

INSERT INTO produto (nome, descricao, preco, infantil, avaliacao, id_categoria) VALUES
('Fone Bluetooth', 'Fone de ouvido sem fio', 199.90, FALSE, 4.5, 1),
('Smart TV 50"', 'TV 4K UHD', 2899.00, FALSE, 4.8, 1),
('Boneca Elsa', 'Boneca infantil temática', 129.90, TRUE, 4.3, 3),
('Camiseta Básica', 'Camiseta 100% algodão', 59.90, FALSE, 4.0, 2),
('Sofá Retrátil', 'Sofá retrátil 3 lugares', 1899.90, FALSE, 4.6, 5);

INSERT INTO fornecedor (razao_social, cnpj, telefone) VALUES
('Almeida & Filhos LTDA', '12345678000199', '21987654321'),
('Eletrônicos Brasil SA', '98765432000188', '11987654321');

INSERT INTO vendedor (nome, cnpj, cpf, telefone, cidade) VALUES
('Tech Store', '11122233000155', NULL, '21999998888', 'Rio de Janeiro'),
('Moda Center', NULL, '12312312399', '11999997777', 'São Paulo');

INSERT INTO produto_fornecedor (id_produto, id_fornecedor, quantidade) VALUES
(1, 1, 300),
(2, 2, 150),
(3, 1, 200),
(4, 1, 400),
(5, 2, 50);

INSERT INTO produto_vendedor (id_produto, id_vendedor, quantidade, status) VALUES
(1, 1, 50, 'Disponivel'),
(2, 1, 20, 'Disponivel'),
(4, 2, 100, 'Disponivel'),
(3, 2, 30, 'Disponivel');

INSERT INTO estoque (id_produto, localizacao, quantidade) VALUES
(1, 'Centro RJ', 120),
(2, 'Centro SP', 60),
(3, 'Centro RJ', 80),
(4, 'Centro SP', 200),
(5, 'Centro BH', 15);

INSERT INTO pedido (id_cliente, status, valor_frete, pagamento_cartao) VALUES
(1, 'Confirmado', 25.00, TRUE),
(2, 'Em Andamento', 40.00, FALSE),
(3, 'Confirmado', 30.00, TRUE);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 199.90),
(1, 3, 1, 129.90),
(2, 4, 3, 59.90),
(3, 2, 1, 2899.00);
