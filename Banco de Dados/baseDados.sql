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
    nome character varying(255) COLLATE pg_catalog."default",
    senha text COLLATE pg_catalog."default",
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
    nome character varying(255) COLLATE pg_catalog."default" NOT NULL,
    apelido_ml character varying(255) COLLATE pg_catalog."default",
    fone character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    cep character varying(10) COLLATE pg_catalog."default",
    n_endereco character varying(255) COLLATE pg_catalog."default",
    logradouro character varying(255) COLLATE pg_catalog."default",
    bairro character varying(255) COLLATE pg_catalog."default",
    cidade character varying(255) COLLATE pg_catalog."default",
    uf character varying(5) COLLATE pg_catalog."default",
    email_alt character varying(255) COLLATE pg_catalog."default",
    celular character varying(10) COLLATE pg_catalog."default",
    cnpj_cpf character varying(14) COLLATE pg_catalog."default",
    cmun character varying(7) COLLATE pg_catalog."default",
    ie character varying(14) COLLATE pg_catalog."default",
    isuf character varying(9) COLLATE pg_catalog."default",
    logradouro_cpl character varying(60) COLLATE pg_catalog."default",
    tipo_c character varying(2) COLLATE pg_catalog."default",
    endereco_ent_dif character varying(2) COLLATE pg_catalog."default",
    d_nome character varying(100) COLLATE pg_catalog."default",
    d_cep character varying(10) COLLATE pg_catalog."default",
    d_n_endereco character varying(60) COLLATE pg_catalog."default",
    d_logradouro character varying(100) COLLATE pg_catalog."default",
    d_bairro character varying(100) COLLATE pg_catalog."default",
    d_cidade character varying(100) COLLATE pg_catalog."default",
    d_uf character varying(2) COLLATE pg_catalog."default",
    d_logradouro_cpl character varying(60) COLLATE pg_catalog."default",
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
    nome character varying(255) COLLATE pg_catalog."default",
    cep character varying(10) COLLATE pg_catalog."default",
    fone character varying(15) COLLATE pg_catalog."default",
    fax character varying(15) COLLATE pg_catalog."default",
    cnpj_cpf character varying(15) COLLATE pg_catalog."default",
    inscr_estadual character varying(15) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    contato character varying(255) COLLATE pg_catalog."default",
    n_endereco character varying(255) COLLATE pg_catalog."default",
    tipo_c character varying(2) COLLATE pg_catalog."default",
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
    id_uf character varying(2) COLLATE pg_catalog."default",
    id_cidade integer,
    bairro_nome character varying(72) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS bairro
    OWNER to unicesumar;


-- -----------------------------------------------------------

-- Table: estado

-- DROP TABLE IF EXISTS estado;

CREATE TABLE IF NOT EXISTS estado
(
    id_uf character varying(2) COLLATE pg_catalog."default" NOT NULL,
    estado_nome character varying(72) COLLATE pg_catalog."default",
    faixa_cep1_ini character varying(8) COLLATE pg_catalog."default",
    faixa_cep1_fim character varying(8) COLLATE pg_catalog."default",
    faixa_cep2_ini character varying(8) COLLATE pg_catalog."default",
    faixa_cep2_fim character varying(8) COLLATE pg_catalog."default",
    pac numeric(10,2),
    sedex numeric(10,2),
    capital character varying(255) COLLATE pg_catalog."default",
    prazo_capital_pac character varying(255) COLLATE pg_catalog."default",
    prazo_capital_sedex character varying(255) COLLATE pg_catalog."default",
    prazo_noc_pac character varying(255) COLLATE pg_catalog."default",
    prazo_noc_sedex character varying(255) COLLATE pg_catalog."default"
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
    id_uf character varying(2) COLLATE pg_catalog."default",
    cidade_nome character varying(60) COLLATE pg_catalog."default",
    cep character varying(9) COLLATE pg_catalog."default",
    codigo_municipio character varying(7) COLLATE pg_catalog."default"
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
    nome character varying(250) COLLATE pg_catalog."default",
    uf character varying(2) COLLATE pg_catalog."default"
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
    id_uf character varying(2) COLLATE pg_catalog."default",
    id_cidade integer,
    id_bairro integer,
    endereco_nome character varying(72) COLLATE pg_catalog."default",
    cep character varying(8) COLLATE pg_catalog."default",
    complemento character varying(100) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS endereco
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: forma_pagamento

-- DROP TABLE IF EXISTS forma_pagamento;

CREATE TABLE IF NOT EXISTS forma_pagamento
(
    descricao character varying(255) COLLATE pg_catalog."default" NOT NULL,
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
    unidade character varying(6) COLLATE pg_catalog."default" NOT NULL
    
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS unidade
    OWNER to unicesumar;


-- -----------------------------------------------------------

