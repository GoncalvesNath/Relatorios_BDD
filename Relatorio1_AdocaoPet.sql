-- ============================================
-- TABELA ONG
-- ============================================

CREATE TABLE ONG (
    id_ong            INT          PRIMARY KEY,
    nome_fantasia     VARCHAR(100) NOT NULL,    -- VARCHAR usado para textos com tamanho variável
    cnpj              CHAR(14)     NOT NULL UNIQUE, -- CHAR usado pois o CNPJ possui tamanho fixo
    endereco          VARCHAR(255) NOT NULL,
    cidade            VARCHAR(100) NOT NULL,
    estado            CHAR(2)      NOT NULL,    -- Estado utiliza apenas 2 caracteres (UF)
    telefone          VARCHAR(20)  NOT NULL,
    email             VARCHAR(150) NOT NULL,
    responsavel       VARCHAR(100) NOT NULL,
    capacidade_animais INT         NOT NULL
);

-- ============================================
-- TABELA ANIMAL
-- ============================================

CREATE TABLE ANIMAL (
    id_animal    INT          PRIMARY KEY,
    id_ong       INT,
    nome         VARCHAR(100) NOT NULL,
    idade        INT          NOT NULL,
    raca         VARCHAR(100) NOT NULL,
    sexo         CHAR(1)      NOT NULL,    -- Sexo armazenado com tamanho fixo (M/F)
    cor          VARCHAR(50)  NOT NULL,
    especie      VARCHAR(50)  NOT NULL,
    data_cadastro DATE        NOT NULL,
    status       VARCHAR(50)  NOT NULL,

    -- Relacionamento com ONG
    FOREIGN KEY (id_ong)
        REFERENCES ONG(id_ong)
);

-- ============================================
-- TABELA USUARIO
-- ============================================

CREATE TABLE USUARIO (
    id_usuario      INT          PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    endereco        VARCHAR(255) NOT NULL,
    cidade          VARCHAR(100) NOT NULL,
    estado          CHAR(2)      NOT NULL,
    profissao       VARCHAR(100) NOT NULL,
    data_nascimento DATE         NOT NULL,
    telefone        VARCHAR(20)  NOT NULL,
    cpf             CHAR(11)     NOT NULL UNIQUE, -- CPF possui tamanho fixo
    email           VARCHAR(150) NOT NULL
);

-- ============================================
-- TABELA VACINA
-- ============================================

CREATE TABLE VACINA (
    id_vacina  INT          PRIMARY KEY,
    fabricante VARCHAR(100) NOT NULL,
    nome       VARCHAR(100) NOT NULL
);

-- ============================================
-- TABELA VETERINARIO
-- ============================================

CREATE TABLE VETERINARIO (
    id_veterinario INT          PRIMARY KEY,
    nome           VARCHAR(100) NOT NULL,
    telefone       VARCHAR(20)  NOT NULL,
    crmv           VARCHAR(20)  NOT NULL UNIQUE,
    especialidade  VARCHAR(100) NOT NULL
);

-- ============================================
-- TABELA ATENDE
-- ============================================

CREATE TABLE ATENDE (
    id_veterinario INT,
    id_animal      INT,

    -- PK composta para relacionamento N:N
    PRIMARY KEY (id_veterinario, id_animal),

    -- Relacionamento com VETERINARIO
    FOREIGN KEY (id_veterinario)
        REFERENCES VETERINARIO(id_veterinario),

    -- Relacionamento com ANIMAL
    FOREIGN KEY (id_animal)
        REFERENCES ANIMAL(id_animal)
);

-- ============================================
-- TABELA RECEBE
-- ============================================

CREATE TABLE RECEBE (
    id_animal INT,
    id_vacina INT,

    -- PK composta para relacionamento N:N
    PRIMARY KEY (id_animal, id_vacina),

    -- Relacionamento com ANIMAL
    FOREIGN KEY (id_animal)
        REFERENCES ANIMAL(id_animal),

    -- Relacionamento com VACINA
    FOREIGN KEY (id_vacina)
        REFERENCES VACINA(id_vacina)
);

-- ============================================
-- TABELA ADOCAO
-- ============================================

CREATE TABLE ADOCAO (
    id_adocao   INT         PRIMARY KEY,
    id_animal   INT,
    id_usuario  INT,
    data_adocao DATE        NOT NULL,
    status      VARCHAR(50) NOT NULL,

    -- Relacionamento com ANIMAL
    FOREIGN KEY (id_animal)
        REFERENCES ANIMAL(id_animal),

    -- Relacionamento com USUARIO
    FOREIGN KEY (id_usuario)
        REFERENCES USUARIO(id_usuario)
);
