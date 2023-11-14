-- Role: unicesumar
-- DROP ROLE IF EXISTS unicesumar;

CREATE ROLE unicesumar WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  REPLICATION;

-- -----------------------------------------------------------

ALTER ROLE unicesumar
	PASSWORD '$TCCunicesumar2023';

-- -----------------------------------------------------------
-- Database: TccRetaguarda

-- DROP DATABASE IF EXISTS "TccRetaguarda";

CREATE DATABASE "TccRetaguarda"
    WITH
    OWNER = unicesumar
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- -----------------------------------------------------------

-- Table: usuarios

-- DROP TABLE IF EXISTS usuarios;

CREATE TABLE IF NOT EXISTS usuarios
(
    cod integer NOT NULL,
    nome character varying(255) ,
    senha text ,
    CONSTRAINT usuarios_pkey PRIMARY KEY (cod)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS usuarios
    OWNER to unicesumar;

-- -----------------------------------------------------------

INSERT INTO usuarios(cod, nome, senha)
	VALUES (99999, 'DESENVOLVEDOR', 'MjAxNDU3NjMtNQ==');
-- senha: 20145763-5

INSERT INTO usuarios(cod, nome, senha)
	VALUES (99, 'ADMIN', 'dW5pY2VzdW1hcg==');
-- senha: unicesumar

-- -----------------------------------------------------------

-- Table: clientes

-- DROP TABLE IF EXISTS clientes;

CREATE TABLE IF NOT EXISTS clientes
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    nome character varying(255)  NOT NULL,
    apelido_ml character varying(255) ,
    fone character varying(255) ,
    email character varying(255) ,
    cep character varying(10) ,
    n_endereco character varying(255) ,
    logradouro character varying(255) ,
    bairro character varying(255) ,
    cidade character varying(255) ,
    uf character varying(5) ,
    email_alt character varying(255) ,
    celular character varying(10) ,
    cnpj_cpf character varying(14) ,
    cmun character varying(7) ,
    ie character varying(14) ,
    isuf character varying(9) ,
    logradouro_cpl character varying(60) ,
    tipo_c character varying(2) ,
    endereco_ent_dif character varying(2) ,
    d_nome character varying(100) ,
    d_cep character varying(10) ,
    d_n_endereco character varying(60) ,
    d_logradouro character varying(100) ,
    d_bairro character varying(100) ,
    d_cidade character varying(100) ,
    d_uf character varying(2) ,
    d_logradouro_cpl character varying(60) ,
    CONSTRAINT clientes_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS clientes
    OWNER to unicesumar;
-- -----------------------------------------------------------

-- Table: fornecedor

-- DROP TABLE IF EXISTS fornecedor;

CREATE TABLE IF NOT EXISTS fornecedor
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    nome character varying(255) ,
    cep character varying(10) ,
    fone character varying(15) ,
    fax character varying(15) ,
    cnpj_cpf character varying(15) ,
    inscr_estadual character varying(15) ,
    email character varying(255) ,
    contato character varying(255) ,
    n_endereco character varying(255) ,
    tipo_c character varying(2) ,
    CONSTRAINT fornecedor_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS fornecedor
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: bairro

-- DROP TABLE IF EXISTS bairro;

CREATE TABLE IF NOT EXISTS bairro
(
    id_bairro integer NOT NULL,
    id_uf character varying(2) ,
    id_cidade integer,
    bairro_nome character varying(72) 
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS bairro
    OWNER to unicesumar;


-- -----------------------------------------------------------

-- Table: estado

-- DROP TABLE IF EXISTS estado;

CREATE TABLE IF NOT EXISTS estado
(
    id_uf character varying(2)  NOT NULL,
    estado_nome character varying(72) ,
    faixa_cep1_ini character varying(8) ,
    faixa_cep1_fim character varying(8) ,
    faixa_cep2_ini character varying(8) ,
    faixa_cep2_fim character varying(8) ,
    pac numeric(10,2),
    sedex numeric(10,2),
    capital character varying(255) ,
    prazo_capital_pac character varying(255) ,
    prazo_capital_sedex character varying(255) ,
    prazo_noc_pac character varying(255) ,
    prazo_noc_sedex character varying(255) 
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS estado
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: cidade

-- DROP TABLE IF EXISTS cidade;

CREATE TABLE IF NOT EXISTS cidade
(
    id_cidade integer NOT NULL,
    id_uf character varying(2) ,
    cidade_nome character varying(60) ,
    cep character varying(9) ,
    codigo_municipio character varying(7) 
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS cidade
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: cidade_ibge

-- DROP TABLE IF EXISTS cidade_ibge;

CREATE TABLE IF NOT EXISTS cidade_ibge
(
    id integer NOT NULL,
    id_estado integer,
    codigo_municipio integer,
    nome character varying(250) ,
    uf character varying(2) 
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS cidade_ibge
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: endereco

-- DROP TABLE IF EXISTS endereco;

CREATE TABLE IF NOT EXISTS endereco
(
    id_endereco integer NOT NULL,
    id_uf character varying(2) ,
    id_cidade integer,
    id_bairro integer,
    endereco_nome character varying(72) ,
    cep character varying(8) ,
    complemento character varying(100) 
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS endereco
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: forma_pagamento

-- DROP TABLE IF EXISTS forma_pagamento;

CREATE TABLE IF NOT EXISTS forma_pagamento
(
    descricao character varying(255)  NOT NULL,
    ativo integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS forma_pagamento
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: unidade

-- DROP TABLE IF EXISTS unidade;

CREATE TABLE IF NOT EXISTS unidade
(
    id serial PRIMARY KEY,
    unidade character varying(6)  NOT NULL
    
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS unidade
    OWNER to unicesumar;


-- -----------------------------------------------------------

-- Table: categoria

-- DROP TABLE IF EXISTS categoria;

CREATE TABLE IF NOT EXISTS categoria
(
    id serial PRIMARY KEY,
    descricao character varying(255) NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS categoria
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: produto

-- DROP TABLE IF EXISTS produto;

CREATE TABLE IF NOT EXISTS produto
(
    codigo character varying(12) PRIMARY KEY,
    descricao text NOT NULL,
    und character varying(10) NOT NULL,
    preco_custo numeric(7,2) NOT NULL,
    preco_venda numeric(7,2),
    desconto integer,
    saldo double precision,
    id_fornecedor integer,
    preco_final_venda numeric(7,2),
    id_categoria int NOT NULL,
    codigo_barras character varying(14),
    ncm character varying(8),
    peso numeric(5,3),
    status character varying(1) DEFAULT 'A',
    estacao varchar(15),
    FOREIGN KEY ("id_fornecedor") REFERENCES fornecedor ("id"),
    FOREIGN KEY ("id_categoria") REFERENCES categoria ("id")
   
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS produto
    OWNER to unicesumar;
