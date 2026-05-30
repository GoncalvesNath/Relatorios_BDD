-- ============================================
-- PARTE I - RELACIONAMENTO 1:N
-- Uma editora publica vários livros
-- ============================================

CREATE TABLE EDITORA (
    id_editora INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE LIVRO (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_editora INT NOT NULL,

    FOREIGN KEY (id_editora)
        REFERENCES EDITORA(id_editora)
);

-- ============================================
-- PARTE II - RELACIONAMENTO N:N
-- ============================================

CREATE TABLE AUTOR (
    id_autor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE LIVRO_AUTOR (
    id_livro INT,
    id_autor INT,

    PRIMARY KEY (id_livro, id_autor),

    FOREIGN KEY (id_livro)
        REFERENCES LIVRO(id_livro),

    FOREIGN KEY (id_autor)
        REFERENCES AUTOR(id_autor)
);

-- ============================================
-- PARTE III - RELACIONAMENTO 1:1
-- ============================================

CREATE TABLE DETALHES_LIVRO (
    id_livro INT PRIMARY KEY,
    resumo VARCHAR(500),

    FOREIGN KEY (id_livro)
        REFERENCES LIVRO(id_livro)
);

-- ============================================
-- AMPLIAÇÃO DO DESAFIO
-- ============================================

CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE PEDIDO (
    id_pedido INT PRIMARY KEY,
    id_cliente INT NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE ITEM_PEDIDO (
    id_pedido INT,
    id_livro INT,

    PRIMARY KEY (id_pedido, id_livro),

    FOREIGN KEY (id_pedido)
        REFERENCES PEDIDO(id_pedido),

    FOREIGN KEY (id_livro)
        REFERENCES LIVRO(id_livro)
);
