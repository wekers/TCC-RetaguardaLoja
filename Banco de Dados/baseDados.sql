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
    nome character varying(255),
    senha text,
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
    nome character varying(100)  NOT NULL,
    apelido_ml character varying(255),
    fone character varying(15),
    email character varying(100),
    cep character varying(10),
    n_endereco character varying(6),
    logradouro character varying(120),
    bairro character varying(100),
    cidade character varying(80),
    uf character varying(2),
    email_alt character varying(100),
    celular character varying(15),
    cnpj_cpf character varying(14) unique,
    cmun character varying(7),
    ie character varying(14),
    isuf character varying(9),
    logradouro_cpl character varying(60),
    tipo_c character(1),
    endereco_ent_dif character(1),
    d_nome character varying(100),
    d_cep character varying(10),
    d_n_endereco character varying(60),
    d_logradouro character varying(100),
    d_bairro character varying(100),
    d_cidade character varying(100),
    d_uf character varying(2),
    d_logradouro_cpl character varying(60),
    CONSTRAINT clientes_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS clientes
    OWNER to unicesumar;

INSERT INTO clientes(nome)
	VALUES ('VENDA LOCAL');
-- -----------------------------------------------------------

-- Table: fornecedor

-- DROP TABLE IF EXISTS fornecedor;

CREATE TABLE IF NOT EXISTS fornecedor
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    nome character varying(120),
    cep character varying(10),
    fone character varying(15),
    fax character varying(15),
    cnpj_cpf character varying(15) unique,
    inscr_estadual character varying(15),
    email character varying(80),
    contato character varying(60),
    n_endereco character varying(6),
    tipo_c character(1),
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
    id_uf character varying(2),
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
    estado_nome character varying(72),
    faixa_cep1_ini character varying(8),
    faixa_cep1_fim character varying(8),
    faixa_cep2_ini character varying(8),
    faixa_cep2_fim character varying(8),
    pac numeric(10,2),
    sedex numeric(10,2),
    capital character varying(70),
    prazo_capital_pac character varying(40),
    prazo_capital_sedex character varying(40),
    prazo_noc_pac character varying(40),
    prazo_noc_sedex character varying(40) 
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
    id_uf character varying(2),
    cidade_nome character varying(60),
    cep character varying(9),
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
    nome character varying(250),
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
    id_uf character varying(2),
    id_cidade integer,
    id_bairro integer,
    endereco_nome character varying(72),
    cep character varying(8),
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
    descricao character varying(80)  NOT NULL,
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
    id Integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ) PRIMARY KEY,
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
    id Integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ) PRIMARY KEY,
    descricao character varying(80) NOT NULL
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
    desconto integer DEFAULT 0,
    saldo integer DEFAULT 0,
    id_fornecedor integer,
    preco_final_venda numeric(7,2),
    id_categoria int NOT NULL,
    codigo_barras character varying(14),
    ncm character varying(8),
    peso numeric(5,3),
    status character(1) DEFAULT 'A',
    estacao varchar(15),
    FOREIGN KEY ("id_fornecedor") REFERENCES fornecedor ("id"),
    FOREIGN KEY ("id_categoria") REFERENCES categoria ("id")
   
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS produto
    OWNER to unicesumar;

-- -----------------------------------------------------------


-- Table: movimento_entrada

-- DROP TABLE IF EXISTS movimento_entrada;

CREATE TABLE IF NOT EXISTS movimento_entrada
(
    id Integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ) PRIMARY KEY,
    id_fornecedor integer,
    n_nota integer,
    data_entrada date,
    valor_total numeric(7,2),
    usuario character varying(10),
    FOREIGN KEY ("id_fornecedor") REFERENCES fornecedor ("id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS movimento_entrada
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: entrada_produtos

-- DROP TABLE IF EXISTS entrada_produtos;

CREATE TABLE IF NOT EXISTS entrada_produtos
(
    id Integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ) PRIMARY KEY,
    codigo character varying(12)  NOT NULL,
    quantidade integer,
    codigo_movimento integer,
    preco_custo numeric(7,2),
    FOREIGN KEY ("codigo_movimento") REFERENCES movimento_entrada ("id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS entrada_produtos
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Type: estilo_venda

-- DROP TYPE IF EXISTS estilo_venda;

CREATE TYPE estilo_venda AS ENUM
    ('local', 'ecommerce');

ALTER TYPE estilo_venda
    OWNER TO unicesumar;

-- -----------------------------------------------------------

-- Table: movimento_saida

-- DROP TABLE IF EXISTS movimento_saida;

CREATE TABLE IF NOT EXISTS movimento_saida
(
    id Integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ) PRIMARY KEY,
    data_saida date,
    hora_saida time without time zone DEFAULT now(),
    cod_operador character varying(10),
    cod_vendedor integer,
    valor_total numeric(7,2),
    operacao character varying(150),
    frete character varying(50),
    valor_frete numeric(7,2),
    id_cliente integer NOT NULL,
    tipo_venda estilo_venda, -- ENUM
    CONSTRAINT fk_usuario_vendedor FOREIGN KEY (cod_vendedor) REFERENCES usuarios (cod),
    FOREIGN KEY ("id_cliente") REFERENCES clientes ("id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS movimento_saida
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: saida_produtos

-- DROP TABLE IF EXISTS saida_produtos;

CREATE TABLE IF NOT EXISTS saida_produtos
(
    id Integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ) PRIMARY KEY,
    codigo character varying(12)  NOT NULL,
    quantidade integer,
    codigo_movimento integer,
    preco numeric(7,2),
    desconto integer,
    preco_total numeric(7,2),
    preco_custo numeric(7,2),
    FOREIGN KEY ("codigo_movimento") REFERENCES movimento_saida ("id")

)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS saida_produtos
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: movimento_devolucao

-- DROP TABLE IF EXISTS movimento_devolucao;

CREATE TABLE IF NOT EXISTS movimento_devolucao
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ) PRIMARY KEY,
    data date DEFAULT now(),
    cod_operador character varying(10),
    n_doc_venda character varying(12)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS movimento_devolucao
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: devolucao_produtos

-- DROP TABLE IF EXISTS devolucao_produtos;

CREATE TABLE IF NOT EXISTS devolucao_produtos
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ) PRIMARY KEY,
    codigo integer NOT NULL,
    quantidade integer,
    codigo_movimento integer,
    preco numeric(7,2),
    FOREIGN KEY ("codigo_movimento") REFERENCES movimento_devolucao ("id")
    
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS devolucao_produtos
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: movimento_ajuste

-- DROP TABLE IF EXISTS movimento_ajuste;

CREATE TABLE IF NOT EXISTS movimento_ajuste
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ) PRIMARY KEY,
    data date DEFAULT now(),
    cod_operador character varying(10),
    tipo character varying(150)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS movimento_ajuste
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: ajuste_produtos

-- DROP TABLE IF EXISTS ajuste_produtos;

CREATE TABLE IF NOT EXISTS ajuste_produtos
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ) PRIMARY KEY,
    codigo character varying(12) NOT NULL,
    quantidade integer,
    codigo_movimento integer,
    preco_custo numeric(7,2),
    motivo text,
    FOREIGN KEY ("codigo_movimento") REFERENCES movimento_ajuste ("id") 
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS ajuste_produtos
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: m_cadastro

-- DROP TABLE IF EXISTS m_cadastro;

CREATE TABLE IF NOT EXISTS m_cadastro
(
    cod integer NOT NULL,
    m_clientes smallint NOT NULL DEFAULT 0,
    m_fornecedor smallint NOT NULL DEFAULT 0,
    m_produto smallint NOT NULL DEFAULT 0,
    m_formadepagamento smallint NOT NULL DEFAULT 0,
    m_categoria smallint NOT NULL DEFAULT 0,
    m_unidadedoproduto smallint NOT NULL DEFAULT 0,
    m_alterar smallint NOT NULL DEFAULT 0,
    m_alterar_fornecedor smallint NOT NULL DEFAULT 0,
    m_alterar_produto smallint NOT NULL DEFAULT 0,
    CONSTRAINT m_cadastro_pkey PRIMARY KEY (cod),
    CONSTRAINT m_cadastro_cod_fkey FOREIGN KEY (cod)
        REFERENCES usuarios (cod) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS m_cadastro
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: m_consulta

-- DROP TABLE IF EXISTS m_consulta;

CREATE TABLE IF NOT EXISTS public.m_consulta
(
    cod integer NOT NULL,
    m_consulta_estoque smallint NOT NULL DEFAULT 0,
    m_consulta_vendas smallint NOT NULL DEFAULT 0,
    m_consulta_vendasdetalhado smallint NOT NULL DEFAULT 0,
    m_consulta_movimentacaodeestoque smallint NOT NULL DEFAULT 0,
    m_consulta_doc smallint NOT NULL DEFAULT 0,
    m_doc_ajustedeestoque smallint NOT NULL DEFAULT 0,
    m_doc_entrada smallint NOT NULL DEFAULT 0,
    m_doc_venda smallint NOT NULL DEFAULT 0,
    m_doc_devolucao smallint NOT NULL DEFAULT 0,
    CONSTRAINT m_consulta_pkey PRIMARY KEY (cod),
    CONSTRAINT m_consulta_cod_fkey FOREIGN KEY (cod)
        REFERENCES usuarios (cod) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS m_consulta
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: m_estoque

-- DROP TABLE IF EXISTS m_estoque;

CREATE TABLE IF NOT EXISTS m_estoque
(
    cod integer NOT NULL,
    m_entradadeprodutos smallint NOT NULL DEFAULT 0,
    m_vendas smallint NOT NULL DEFAULT 0,
    m_devolucao smallint NOT NULL DEFAULT 0,
    m_ajustedeestoque smallint NOT NULL DEFAULT 0,
    CONSTRAINT m_estoque_pkey PRIMARY KEY (cod),
    CONSTRAINT m_estoque_cod_fkey FOREIGN KEY (cod)
        REFERENCES usuarios (cod) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS m_estoque
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: m_relatorio

-- DROP TABLE IF EXISTS m_relatorio;

CREATE TABLE IF NOT EXISTS m_relatorio
(
    cod integer NOT NULL,
    m_produtosvendidos smallint NOT NULL DEFAULT 0,
    m_entradasdetalhado smallint NOT NULL DEFAULT 0,
    m_inventario smallint NOT NULL DEFAULT 0,
    m_produtosnegativos smallint NOT NULL DEFAULT 0,
    CONSTRAINT m_relatorio_pkey PRIMARY KEY (cod),
    CONSTRAINT m_relatorio_cod_fkey FOREIGN KEY (cod)
        REFERENCES usuarios (cod) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS m_relatorio
    OWNER to unicesumar;

-- -----------------------------------------------------------

-- Table: m_usuarios

-- DROP TABLE IF EXISTS m_usuarios;

CREATE TABLE IF NOT EXISTS m_usuarios
(
    cod integer NOT NULL,
    m_cadastro_usuario smallint NOT NULL DEFAULT 0,
    m_trocarusuario smallint NOT NULL DEFAULT 1,
    m_alterarsenha smallint NOT NULL DEFAULT 1,
    CONSTRAINT m_usuarios_pkey PRIMARY KEY (cod),
    CONSTRAINT m_usuarios_cod_fkey FOREIGN KEY (cod)
        REFERENCES usuarios (cod) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS m_usuarios
    OWNER to unicesumar;