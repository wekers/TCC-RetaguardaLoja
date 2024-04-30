TRUNCATE TABLE movimento_entrada RESTART IDENTITY CASCADE;
TRUNCATE TABLE entrada_produtos RESTART IDENTITY CASCADE;
TRUNCATE TABLE movimento_saida RESTART IDENTITY CASCADE;
TRUNCATE TABLE saida_produtos RESTART IDENTITY CASCADE;
TRUNCATE TABLE movimento_devolucao RESTART IDENTITY CASCADE;
TRUNCATE TABLE devolucao_produtos RESTART IDENTITY CASCADE;
TRUNCATE TABLE movimento_ajuste RESTART IDENTITY CASCADE;
TRUNCATE TABLE ajuste_produtos RESTART IDENTITY CASCADE;
TRUNCATE TABLE usuarios RESTART IDENTITY CASCADE;
TRUNCATE TABLE categoria RESTART IDENTITY CASCADE;
TRUNCATE TABLE fornecedor RESTART IDENTITY CASCADE;
TRUNCATE TABLE produto RESTART IDENTITY CASCADE;
TRUNCATE TABLE clientes RESTART IDENTITY CASCADE;

-- usuarios
-- ----------------------------------------------------------
INSERT INTO usuarios(cod, nome, senha)
	VALUES (99999, 'DESENVOLVEDOR', 'MjAxNDU3NjMtNQ==');
-- senha: 20145763-5

INSERT INTO usuarios(cod, nome, senha)
	VALUES (99, 'ADMIN', 'dW5pY2VzdW1hcg==');
-- senha: unicesumar

INSERT INTO usuarios(cod, nome, senha) VALUES (10, 'FABIO', 'MTA=');
INSERT INTO usuarios(cod, nome, senha) VALUES (11, 'MARIA CLARA', 'MTE=');
INSERT INTO usuarios(cod, nome, senha) VALUES (12, 'FERNANDO', 'MTI=');
INSERT INTO usuarios(cod, nome, senha) VALUES (13, 'ANA', 'MTM=');

-- fornecedor
-- ----------------------------------------------------------
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('MARLON MODA ME',14407312,1626052865,NULL,65257704000190,13625148264,'marlonmoda@gmail.com','ENZO',174,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('JG PIJAMAS LTDA',13401422,1937124217,NULL,08128832000108,561540695043,'jg.pijamas@gmail.com','RAUL',993,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('BRASC MODAS',8673140,1129910567,NULL,27026633000125,303211380289,'brasc_br@gmail.com','DANIELA',259,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('MAISA MODAS',88113780,4828873919,NULL,44318250000140,852933371,'maisa-modas@gmail.com','BRYAN',32,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('JOLLI VS JOLLI LTDA',88060325,4839407307,NULL,25231531000116,239417372,'jolli.vs@gmail.com','JULIE',97,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('TRIFIL',89221107,4726550766,NULL,15006877000167,265081769,'trifil@gmail.com','ANA',256,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('AMOR PURO',85803344,4529347444,NULL,07800152000118,8477228438,'amor.puro@gmail.com','LUISA',1080,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('QUE FOFINHO',86183759,4335744205,NULL,70872047000120,4649728700,'que_fofinho@gmail.com','ISABELLE',902,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('MARCA PEGA',87307017,4436033628,NULL,00373488000100,7497709452,'marca.pega@gmail.com','SOFIA',231,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('COMSONO MODAS',94045326,5126115232,NULL,83750180000156,1947945243,'comsono.br@gmail.com','DEBORA',52,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('ILHOTA LINGERIE S.A.',88320000,4733425588,NULL,68038580000140,400044900,'ilhota.lingerie@gmail.com','CRISTIANE',890,'N');
INSERT INTO fornecedor(nome,cep,fone,fax,cnpj_cpf,inscr_estadual,email,contato,n_endereco,tipo_c) VALUES ('LOVE LOVE',94858230,5139414727,NULL,61484231000102,8941394951,'love.love@gmail.com','LARISSA',754,'N');

-- categoria
-- ----------------------------------------------------------
INSERT INTO categoria(descricao) VALUES ('PIJAMA / CAMISOLA');
INSERT INTO categoria(descricao) VALUES ('BEBÊ');
INSERT INTO categoria(descricao) VALUES ('MODA ÍNTIMA');

-- clientes
-- ----------------------------------------------------------
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('VENDA LOCAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('GIOVANNA CLARA LUIZA DAS NEVES','GEOCL',6926529230,'giovanna-dasneves76@vemarbrasil.com.br',76814123,330,'RUA BLUMENAU','RONALDO ARAGÃO','PORTO VELHO','RO',NULL,69991246353,7531233800,NULL,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('NELSON MARTIN EDSON VIEIRA','NEOMARTINS',1338587844,'nelson_vieira@edwardmaluf.com.br',11722330,921,'RUA JOSEFINA BAKHITA','VILA SÔNIA','PRAIA GRANDE','SP',NULL,13995297710,7592722208,NULL,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('ANDREA EDUARDA CAROLINA DA ROSA','ANDREDU',NULL,'andrea_darosa@gameecia.com.br',72855150,217,'QUADRA QUADRA 150','PARQUE INDUSTRIAL MINGONE','LUZIÂNIA','GO',NULL,61997770597,51524577332,5208707,NULL,NULL,NULL,'P','S','IGOR',74423010,750,'AVENIDA A','ÁGUA BRANCA','GOIÂNIA','GO','CASA');
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('LAVÍNIA JENNIFER CLARA BARROS',NULL,NULL,'lavinia-barros74@contjulioroberto.com.br',89225890,112,'RUA JACY MACEDO LOBO','AVENTUREIRO','JOINVILLE','SC',NULL,47981296127,80573951926,4209102,NULL,NULL,'CASA','P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('BRYAN DAVI THIAGO','BRYANDAV',NULL,'bryan-figueiredo85@gmail.com',89239130,819,'RUA TRINTA E UM DE OUTUBRO','PIRABEIRABA','JOINVILLE','SC',NULL,47987205761,38081016953,4209102,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('THAISA GOMES',NULL,NULL,'taisa.gomes@gmail.com',89204310,476,'RUA ARARANGUÁ','AMÉRICA','JOINVILLE','SC','taisa.g@north.com.br',47998334500,25849475958,4209102,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('DANIELA VALENTINA',NULL,NULL,'dani_valentina@gmail.com',89224495,931,'RUA MANOEL PIO DE SANTANA','JARDIM IRIRIÚ','JOINVILLE','SC',NULL,47987025245,84412002977,4209102,NULL,NULL,'ED MARCUS AP 201','P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('ANDREA ISABELLA',NULL,4725713584,'andrea-lopes90@timbrasil.com.br',89204358,187,'RUA DUVOISIN','AMÉRICA','JOINVILLE','SC',NULL,47996310726,72651703931,4209102,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('ISABEL RITA ALVES',NULL,NULL,'isabel.rita.alves@mesquita.not.br',89226203,684,'RUA VALDEMAR SCHWALBE','AVENTUREIRO','JOINVILLE','SC',NULL,47992599334,37186230997,4209102,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('JÉSSICA MAITÊ FARIA','JESSM',NULL,'jessicamaitefarias@gmail.com',89206223,571,'RUA ITÁLIA','BOA VISTA','JOINVILLE','SC',NULL,47991214011,87737274901,4209102,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('STELLA KAMILLY DA MATA',NULL,4725817001,'stellakamillydamata@email.tst',89230792,459,'RUA BARRA SANTA SALET','ADHEMAR GARCIA','JOINVILLE','SC',NULL,47996654923,36586436923,4209102,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('JULIANA DAS NEVES',NULL,4729898562,'juliana.neves@gmail.com',89224473,388,'RUA JOSÉ TAMBOSI','JARDIM IRIRIÚ','JOINVILLE','SC',NULL,47981310428,31749254956,4209102,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('LETÍCIA PEREIRA',NULL,4738012556,'leti-pereira@gmail.com',89203495,194,'RUA OTTOKAR DOERFFEL','ANITA GARIBALDI','JOINVILLE','SC',NULL,47992268137,95405950963,4209102,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO clientes(nome,apelido_ml,fone,email,cep,n_endereco,logradouro,bairro,cidade,uf,email_alt,celular,cnpj_cpf,cmun,ie,isuf,logradouro_cpl,tipo_c,endereco_ent_dif,d_nome,d_cep,d_n_endereco,d_logradouro,d_bairro,d_cidade,d_uf,d_logradouro_cpl) VALUES ('AMANDA BETINA CARVALHO','AMABETIN',4738613962,'amanda.betina.carvalho@bravo.com.br',89210655,967,'RUA GUATEMALA','ITAUM','JOINVILLE','SC','amanda.b@gmail.com',47981244733,89146537902,4209102,NULL,NULL,NULL,'P','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-- produto
-- ----------------------------------------------------------
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (1,'CAMISOLA COTTON JG','UND','33.5','62.3',0,0,2,'62.3',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (2,'PIJAMA MANGA C BERMUDA FECHADO P','UND','24.26','68.9',0,0,1,'68.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (3,'PIJAMA MANGA C BERMUDA FECHADO M','UND','24.26','68.9',0,0,1,'68.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (4,'PIJAMA MANGA C BERMUDA FECHADO G','UND','32','68.9',0,0,1,'68.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (5,'PIJAMA MANGA C BERMUDA GG','UND','32','69.9',0,0,1,'69.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (6,'PIJAMA FEM MANGA COM BERMUDA ABERTO P','UND','27.03','68.9',0,0,1,'68.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (7,'PIJAMA FEM MANGA COM BERMUDA ABERTO M','UND','28.13','68.9',0,0,1,'68.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (8,'PIJAMA FEM MANGA COM BERMUDA ABERTO G','UND','29.23','68.9',0,0,1,'68.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (9,'PIJAMA FEM MANGA COM BERMUDA ABERTO GG','UND','31.06','69.9',0,0,1,'69.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (10,'PIJAMA ALGODÃO JG ABERTO FEM P','UND','77.71','144.5',0,0,2,'144.5',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (11,'PIJAMA ALGODÃO JG ABERTO FEM 4772 M','UND','77.71','144.5',0,0,2,'144.5',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (12,'PIJAMA ALGODÃO JG ABERTO FEM 4772 G','UND','77.71','144.5',0,0,2,'144.5',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (13,'PIJAMA ALGODÃO JG ABERTO FEM 4772 GG','UND','77.71','145.6',0,0,2,'145.6',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (14,'PIJAMA APELUCIADO FEMININO ABERTO 3G','UND','55.36','122.3',0,0,1,'122.3',1,NULL,NULL,NULL,'INVERNO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (15,'PIJAMA APELUCIADO FEMININO ABERTO 4G','UND','53.65','122.3',0,0,1,'122.3',1,NULL,NULL,NULL,'INVERNO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (16,'PIJAMA APELUCIADO FEMININO FECHADO 3G','UND','52.49','122.3',0,0,1,'122.3',1,NULL,NULL,NULL,'INVERNO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (17,'PIJAMA APELUCIADO FEMININO FECHADO 4G','UND','53.33','122.3',0,0,1,'122.3',1,NULL,NULL,NULL,'INVERNO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (18,'PIJAMA REGATA JUVENIL FEMININO PV 16','UND','19.17','38.9',0,0,1,'38.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (19,'PIJAMA INFANTIL MASCULINO PV 01','UND','14.35','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (20,'PIJAMA INFANTIL MASCULINO PV 02','UND','15.82','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (21,'PIJAMA  INFANTIL MASCULINO PV 04','UND','16.55','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (22,'PIJAMA  INFANTIL MASCULINO PV 06','UND','16.55','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (23,'PIJAMA INFANTIL MASCULINO PV 08','UND','18.39','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (24,'PIJAMA DE MANGA INFANTIL F/M PV 01','UND','14.35','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (25,'PIJAMA DE MANGA INFANTIL M/F 02','UND','15.82','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (26,'PIJAMA DE MANGA INFANTIL F - M 04','UND','16.55','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (27,'PIJAMA MANGA INFANTIL F - M 06','UND','16.55','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (28,'PIJAMA DE MANGA INFANTIL F -M 08','UND','18.39','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (29,'PIJAMA MANGA JUVENIL MASCULINO 10','UND','19.86','48.9',0,0,1,'48.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (30,'PIJAMA MANGA JUVENIL MASCULINO 12','UND','21.32','48.9',0,0,1,'48.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (31,'PIJAMA DE MANGA JUVENIL MASCULINO PV 14','UND','22.79','48.9',0,0,1,'48.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (32,'PIJAMA DE MANGA JUVENIL MASCULINO PV 16','UND','23.94','55.6',0,0,1,'55.6',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (33,'PIJAMA COMPRIDO PV FEMININO INFANTIL 01','UND','15.13','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (34,'PIJAMA COMPRIDO PV FEMININO INFANTIL 02','UND','16.6','46.7',0,0,1,'46.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (35,'PIJAMA COMPRIDO PV FEMININO INFANTIL 04','UND','19.17','46.7',0,0,1,'46.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (36,'PIJAMA COMPRIDO PV FEMININO INFANTIL 06','UND','20.64','46.7',0,0,1,'46.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (37,'PIJAMA COMPRIDO PV FEMININO INFANTIL 08','UND','23.57','46.7',0,0,1,'46.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (38,'PIJAMA COMPRIDO PV FEMININO JUVENIL 10','UND','26.14','55.6',0,0,1,'55.6',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (39,'PIJAMA COMPRIDO PV FEMININO JUVENIL 12','UND','28.34','55.6',0,0,1,'55.6',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (40,'PIJAMA COMPRIDO FEMININO JUVENIL 14','UND','29.07','55.6',0,0,1,'55.6',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (41,'PIJAMA COMPRIDO PV FEMININO JUVENIL 16','UND','32.74','61.2',0,0,1,'61.2',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (42,'PIJAMA COMPRIDO PV MASCULINO INFANTIL 01','UND','20.27','46.7',0,0,1,'46.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (43,'PIJAMA COMPRIDO PV MASCULINO INFANTIL 02','UND','20.64','46.7',0,0,1,'46.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (44,'PIJAMA COMPRIDO PV MASCULINO INFANTIL 04','UND','20.64','46.7',0,0,1,'46.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (45,'PIJAMA COMPRIDO PV MASCULINO INFANTIL 06','UND','22.1','46.7',0,0,1,'46.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (46,'PIJAMA COMPRIDO PV MASCULINO INFANTIL 08','UND','23.57','46.7',0,0,1,'46.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (47,'PIJAMA INFANTIL CURTO MASCULINO JG 04','UND','24','48.9',0,0,2,'48.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (48,'PIJAMA INFANTIL CURTO MASC JG 06','UND','24','48.9',0,0,2,'48.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (49,'PIJAMA INFANTIL CURTO MASCULINO JG 08','UND','24','48.9',0,0,2,'48.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (50,'PIJAMA JUVENIL CURTO MASC/ FEM  JG 10','UND','26','53.4',0,0,2,'53.4',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (51,'PIJAMA JUVENIL CURTO MASC/ FEM JG 12','UND','26','53.4',0,0,2,'53.4',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (52,'PIJAMA JUVENIL MASC/FEM JG 14','UND','20','53.4',0,0,2,'53.4',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (53,'PIJAMA REGATA MASCULINO P/M/G','UND','29.84','58.9',0,0,2,'58.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (54,'PIJAMA REGATA MASCULINO GG','UND','29.84','59.9',0,0,2,'59.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (55,'PIJAMA MASCULINO CURTO PV 4G','UND','37.43','81.2',0,0,1,'81.2',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (56,'PIJAMA MASCULINO COMPRIDO PV ABERTO P','UND','37.51','86.7',0,0,1,'86.7',1,NULL,NULL,NULL,'INVERNO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (57,'PIJAMA MASCULINO COMPRIDO PV ABERTO M','UND','38.24','82.3',0,0,1,'82.3',1,NULL,NULL,NULL,'INVERNO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (58,'PIJAMA MASCULINO COMPRIDO PV ABERTO G','UND','42.91','82.3',0,0,1,'82.3',1,NULL,NULL,NULL,'INVERNO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (59,'PIJAMA MASCULINO COMPRIDO PV ABERTO GG','UND','42.91','83.4',0,0,1,'83.4',1,NULL,NULL,NULL,'INVERNO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (60,'PIJAMA MASCULINO LONGO JG P','UND','60.59','115.6',0,0,2,'115.6',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (61,'PIJAMA MASCULINO LONGO JG M','UND','60.59','115.6',0,0,2,'115.6',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (62,'PIJAMA MASCULINO LONGO JG G','UND','60.59','115.6',0,0,2,'115.6',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (63,'PIJAMA MASCULINO LONGO JG GG','UND','60.59','145.6',0,0,2,'145.6',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (64,'PIJAMA MASCULINO LONGO 3G/4G','UND','40','88.9',0,0,1,'88.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (65,'PIJAMA MASCULINO CURTO DE PV ABERTO P','UND','29.52','58.9',0,0,1,'58.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (66,'PIJAMA MASCULINO CURTO PV ABERTO M','UND','23.8','46.7',0,0,1,'46.7',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (67,'PIJAMA MASCULINO CURTO PV ABERTO G','UND','29.84','44.5',0,0,1,'44.5',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (68,'PIJAMA MASCULINO CURTO ABERTO PV GG','UND','29.52','45.6',0,0,1,'45.6',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (69,'CAMISOLA FRANZIDA ESTAMPADA P','UND','19.95','35',0,0,1,'35',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (70,'CAMISOLA ALÇA C/ RENDA ESTAMPADA P','UND','16.97','41.2',0,0,1,'41.2',1,NULL,NULL,NULL,'VERÃO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (71,'CAMISOLA ALÇA C/ RENDA ESTAMPADA M','UND','17.33','41.2',0,0,1,'41.2',1,NULL,NULL,NULL,'VERÃO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (72,'CAMISOLA ALÇA C/ RENDA ESTAMPADA G','UND','18.07','41.2',0,0,1,'41.2',1,NULL,NULL,NULL,'VERÃO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (73,'CAMISOLA ALÇA C/ RENDA ESTAMPADA GG','UND','20.27','39.9',0,0,1,'39.9',1,NULL,NULL,NULL,'VERÃO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (74,'CAMISOLA ALÇA C/ RENDA ESTAMPADA 3G','UND','21.74','45.6',0,0,1,'45.6',1,NULL,NULL,NULL,'VERÃO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (75,'CAMISOLA ALÇA C/ RENDA ESTAMPADA 4G','UND','21.74','45.6',0,0,1,'45.6',1,NULL,NULL,NULL,'VERÃO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (76,'CAMISOLA MANGA ABERTA 3G','UND','25.4','66.7',0,0,1,'66.7',1,NULL,NULL,NULL,'ANO TODO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (77,'CAMISOLA REGATA LISA BORDADA DECOTE V GG','UND','19.95','28',0,0,1,'28',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (78,'CAMISOLA REGATA P','UND','16.05','51.2',0,0,1,'51.2',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (79,'CAMISOLA REGATA ESTAMPADA SIMPLES M','UND','22.18','51.2',0,0,1,'51.2',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (80,'CAMISOLA REGATA ESTAMPADA SIMPLES G','UND','22.91','51.2',0,0,1,'51.2',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (81,'CAMISOLA REGATA ESTAMPADA SIMPLES GG','UND','24.38','52.3',0,0,1,'52.3',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (82,'CAMISOLA REGATA ESTAMPADA SIMPLES 3G','UND','25.11','51.2',0,0,1,'51.2',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (83,'CAMISOLA REGATA ESTAMPADA SIMPLES 4G','UND','16.83','51.2',0,0,1,'51.2',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (84,'CAMISETÃO REGATA NADADOR JG 2331 P','UND','24.64','48.9',0,0,2,'48.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (85,'CAMISETÃO REGATA NADADOR JG 2331 M','UND','24.64','48.9',0,0,2,'48.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (86,'CAMISETÃO REGATA NADADOR JG 2331 G','UND','24.64','48.9',0,0,2,'48.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (87,'CAMISETÃO REGATA NADADOR JG 2331 GG','UND','24.64','49.9',0,0,2,'49.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (88,'CAMISOLA MANGA LONGA ESTAMPADA COM BOTÃO GG','UND','19.95','28',0,0,1,'28',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (89,'CAMISOLA MANGA LONGA','UND','19.95','28.9',0,0,1,'28.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (90,'CAMISOLA REGATA BORDADA 3 BOTÃO P','UND','23.33','48.9',0,0,1,'48.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (91,'CAMISOLA REGATA 3 BOTÃO M','UND','25.92','55.6',0,0,1,'55.6',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (92,'CAMISOLA REGATA  3 BOTÃO G','UND','26.66','55.6',0,0,1,'55.6',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (93,'CAMISOLA REGATA  3 BOTÃO GG','UND','27.39','58.9',0,0,1,'58.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (94,'CAMISOLA REGATA 3 BOTÃO 3G','UND','31.06','64.6',0,0,1,'64.6',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (95,'CAMISOLA REGATA BORDADA 3 BOTÃO 4G','UND','31.06','59.9',0,0,1,'59.9',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (96,'CAMISOLA LISA MANGA TODA ABERTA BORDADA P','UND','25.4','52.3',0,0,1,'52.3',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (97,'CAMISOLA LISA MANGA TODA ABERTA BORDADA 3G','UND','25.4','52.3',0,0,1,'52.3',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (98,'CAMISOLA LISA MANGA TODA ABERTA BORDADA 4G','UND','25.4','52.3',0,0,1,'52.3',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (99,'CAMISETÃO ALGODÃO JG MANGA LONGA P','UND','34.43','68.9',0,0,2,'68.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (100,'CAMISETÃO ALGODÃO JG MANGA LONGA M','UND','34.43','68.9',0,0,2,'68.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (101,'CAMISETÃO ALGODÃO JG MANGA LONGA G','UND','34.43','68.9',0,0,2,'68.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (102,'CAMISETÃO ALGODÃO JG MANGA LONGA GG','UND','34.43','69.9',0,0,2,'69.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (103,'CAMISOLA ALGODÃO JG JUVENIL','UND','10.09','22.3',0,0,2,'22.3',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (104,'CAMISOLA MANGA 3 BOTÃO ESTAMPADA P','UND','27','58.9',0,0,1,'58.9',1,NULL,NULL,NULL,'VERÃO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (105,'CAMISOLA MANGA 3 BOTÃO ESTAMPADA M','UND','27','58.9',0,0,1,'58.9',1,NULL,NULL,NULL,'VERÃO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (106,'CAMISOLA MANGA 3 BOTÃO ESTAMPADA G','UND','28.08','58.9',0,0,1,'58.9',1,NULL,NULL,NULL,'ANO TODO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (107,'CAMISOLA MANGA 3 BOTÃO ESTAMPADA GG','UND','28.44','56.7',0,0,1,'56.7',1,NULL,NULL,NULL,'ANO TODO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (108,'CAMISOLA MANGA 3 BOTÃO ESTAMPADA 3G','UND','11','62.3',0,0,1,'62.3',1,NULL,NULL,NULL,'VERÃO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (109,'CAMISOLA MANGA 3 BOTÃO ESTAMPADA 4G','UND','11','62.3',0,0,1,'62.3',1,NULL,NULL,NULL,'VERÃO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (110,'PIJAMA MASCULINO COMPRIDO APELUCIADO FECHADO 3G','UND','65.41','128.9',0,0,1,'128.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (111,'PIJAMA MASCULINO COMPRIDO APELUCIADO FECHADO 4G','UND','69.27','128.9',0,0,1,'128.9',1,NULL,NULL,NULL,'INVERNO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (112,'PIJAMA APELUCIADO MASCULINO ABERTO P','UND','42.77','88.9',0,0,1,'88.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (113,'PIJAMA APELUCIADO MASCULINO ABERTO GG','UND','42.77','88.9',0,0,1,'88.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (114,'MACACÃO MAFESSONI 01/02/03','UND','33','68.9',0,0,3,'68.9',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (115,'SAMBA CANÇAO JG','UND','15','38.9',0,0,2,'38.9',1,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (116,'CEROLA BLUSA/CALÇA CANELADA INFANTIL','UND','18.38','38.9',0,0,2,'38.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (117,'CEROLA CALÇA CANELADA ADULTO FEM/MASC P/GG','UND','20.75','42.3',0,0,2,'42.3',3,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (118,'TRAVESSEIRO ANTI SUFOCANTE','UND','4.4','9.9',0,0,3,'9.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (119,'FRALDA C/ 5 70 X 70','UND','10.33','31.2',0,0,3,'31.2',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (120,'FRALDA CREMER C/ BAINHA','UND','30.5','61.2',0,0,3,'61.2',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (121,'TOALHA FRALDA CREMER','UND','24.75','49.9',0,0,3,'49.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (122,'FRALDA AVULÇA','UND','3.5','7.9',0,0,3,'7.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (123,'TOALHA BORDADA MAISA','UND','5','11.2',0,0,3,'11.2',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (124,'TOALHA FRALDA DENGO','UND','16.5','35',0,0,3,'35',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (125,'CUEIRO AVULÇO COM CROCHE','UND','12','22.3',0,0,3,'22.3',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (126,'CUEIRO AVULÇO BORDADO C/2','UND','19.44','46.7',0,0,3,'46.7',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (127,'CUEIRO COM 3 SIMPLES PEQUENO','UND','9.06','18.9',0,0,3,'18.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (128,'CUEIRO C/ 3 BORDADO','UND','23','44.5',0,0,3,'44.5',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (129,'JOGO LENÇOL','UND','19.78','44.5',0,0,3,'44.5',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (130,'TOALHA COM CAPUZ','UND','10.45','20',0,0,3,'20',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (131,'KIT ESCOVA/PENTE/SABONETEIRA','UND','11.35','22.3',0,0,3,'22.3',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (132,'KIT PANTUFA MAISA','UND','12.9','26.7',0,0,4,'26.7',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (133,'KIT PENTE SMOBY','UND','6.58','13.4',0,0,3,'13.4',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (134,'TROCADOR BAMBI BORDADOS','UND','19.75','38.9',0,0,3,'38.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (135,'TOALHA DE BANHO DIN DON BORDADA','UND','20.61','48.9',0,0,3,'48.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (136,'PIJAMA LONGO JG RIBANA C/ BOTÃO 3 PÇS P','UND','47.3','83.3',0,0,2,'83.3',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (137,'PIJAMA LONGO JG RIBANA C/ BOTÃO 3 PÇS GG','UND','47.3','97.8',0,0,2,'97.8',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (138,'PIJAMA COMPRIDO JG ALGODÃO FEM FECHADO 4388 P','UND','60.46','122.3',0,0,2,'122.3',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (139,'PIJAMA COMPRIDO JG LEG FEM FECHADO 4388 M','UND','60.46','122.3',0,0,2,'122.3',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (140,'PIJAMA LEG JG ALGODÃO FEM FECHADO G','UND','60.46','122.3',0,0,2,'122.3',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (141,'PIJAMA LEG JG ALGODÃO FEM FECHADO GG','UND','60.46','123.4',0,0,2,'123.4',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (142,'PIJAMA LONGO JUVENIL MASC 10','UND','27.24','55.6',0,0,1,'55.6',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (143,'PIJAMALONGO JUVENIL MASC 12','UND','28.34','52.3',0,0,1,'52.3',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (144,'PIJAMA LONGO JUVENIL MASC 14','UND','28.34','55.6',0,0,1,'55.6',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (145,'PIJAMA LONGO JUVENIL MAS 16','UND','32.74','58.9',0,0,1,'58.9',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (146,'SACO DE BEBE','UND','40.8','81.6',0,0,3,'81.6',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (147,'BOLSA GRANDE GOLD','UND','65','144.5',0,0,3,'144.5',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (148,'MASCARA OLHOS','UND','3.5','11.2',0,0,10,'11.2',1,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (149,'GRAVATA','UND','3','8.9',0,0,10,'8.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (150,'PORTA CHUPETA URSO','UND','3.08','8.9',0,0,3,'8.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (151,'MOSQUITEIRO PARA BERÇO SUZANA','UND','61.5','112.3',0,0,3,'112.3',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (152,'MOSQUETEIRO TETO','UND','48.2','86.6',0,0,3,'86.6',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (153,'COBERTOR ESTAMPA SORTIDO JOLI','UND','34.18','81.2',0,0,5,'81.2',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (154,'COBERTOR SORTIDO RACHEL','UND','48.81','107.8',0,0,5,'107.8',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (155,'MORDEDOR BICHINHOS','UND','8.45','16.7',0,0,3,'16.7',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (156,'SAMBA CANÇAO SONHOS','UND','12.49','33.4',0,0,1,'33.4',1,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (157,'CASACO MALHA 1/2/3','UND','9.5','18.9',0,0,3,'18.9',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (158,'MEIA GROSSA BEBE','UND','10','18.9',0,0,3,'18.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (159,'MEIA WISTON AVULÇA','UND','4','9.9',0,0,3,'9.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (160,'MEIA SAPATILHA FEM SP','UND','5','11.2',0,0,2,'11.2',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (161,'FITA ADESIVA','UND','2.51','4.9',0,0,3,'4.9',2,NULL,NULL,NULL,'ANO TODO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (162,'KIT DE TAPA TOMADAS','UND','9','17.8',0,0,3,'17.8',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (163,'PRENDEDOR CHUPETA','UND','1.65','3.9',0,0,3,'3.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (164,'PRENDEDOR CHUPETA CAROL PLUS','UND','10.05','22.3',0,0,3,'22.3',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (165,'PRENDEDOR CHUPETA CAROL','UND','4.82','8.9',0,0,3,'8.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (166,'MANTA','UND','14','29.9',0,0,3,'29.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (167,'COBERTOR CARICIA','UND','12.51','26.7',0,0,3,'26.7',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (168,'MANTA MALHA','UND','26.99','49.9',0,0,3,'49.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (169,'SAMBA CANÇÃO 3G 4G','PÇ','16.69','35',0,0,1,'35',1,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (170,'MEIA VINNY','UND','1.05','2.2',0,0,3,'2.2',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (171,'MEIA EVERLY SOCIAL BRANCA','UND','4.4','8.9',0,0,6,'8.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (172,'MEIA BABADO','UND','6.66','11.2',0,0,6,'11.2',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (173,'MEIA C/3 INFANTIL','UND','6.15','11.2',0,0,6,'11.2',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (174,'MEIA BEBE 0-15','UND','3.7','6.7',0,0,6,'6.7',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (175,'MEIA FEM PILATES SP','PÇ','9','18.9',0,0,10,'18.9',3,NULL,NULL,NULL,'ANO TODO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (176,'MEIA INFANTIL 23/26 31/35','UND','5.5','9.9',0,0,6,'9.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (177,'MEIA SOQUETE FEMININA','UND','4.33','9.9',0,0,6,'9.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (178,'MEIA FEM COM 3','UND','5','15',0,0,6,'15',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (179,'MEIA SOCIAL MASCULINA','UND','5.95','11.2',0,0,6,'11.2',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (180,'MEIA CASUAL MACULINA','UND','6.5','15',0,0,6,'15',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (181,'MEIA ESPORTE MASCULINA','UND','6.7','11.2',0,0,6,'11.2',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (182,'MEIA ADULTO GROSSA','UND','20','38.9',0,0,6,'38.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (183,'MEIA MASCULINA CASUAL SP','UND','6.7','11.2',0,0,6,'11.2',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (184,'MEIA SAPATILHA TRIFIL','UND','0.75','2.2',0,0,6,'2.2',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (185,'MEIA 3/4 FINA TRIFIL','UND','3.4','6.7',0,0,6,'6.7',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (186,'MEIA SOQUETE TIFIL','UND','2.36','5.6',0,0,6,'5.6',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (187,'MEIA MASCUULINA C 3','UND','5','15',0,0,6,'15',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (188,'MEIA FINA ADHERENCE FIO 15','UND','7.95','15',0,0,6,'15',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (189,'MEIA CALÇA DEDINHO','UND','9.95','18.9',0,0,6,'18.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (190,'SEGUNDA PELE MANGA LONGA','UND','9.95','18.9',0,0,6,'18.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (191,'MEIA FINA GRAVATINHA INFANTIL','UND','8.6','16.7',0,0,6,'16.7',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (192,'MEIA BEBE GRAVATINHA BEBE','UND','4.8','9.9',0,0,6,'9.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (193,'MEIA BEBE CANELADA BEBE','UND','9.95','18.9',0,0,6,'18.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (194,'MEIA CALÇA TRANSPARENTE BEBE','UND','4.95','9.9',0,0,6,'9.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (195,'MEIA CALÇA CANELADA INFANTIL TRIFIL','UND','9.64','18.9',0,0,6,'18.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (196,'MEIA CALÇA FINA TRANPARENTE INFANTIL','UND','8.47','15',0,0,6,'15',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (197,'MEIA CALÇA OPACA FIO 40 INFANTIL','UND','12.25','25',0,0,6,'25',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (198,'CONJUNTO BODY MASC/FEM','UND','17','35',0,0,7,'35',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (199,'CONJUNTO PIJAMA BEBE','UND','8','17.8',0,0,4,'17.8',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (200,'PAGAO','UND','15','33.4',0,0,3,'33.4',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (201,'PAGAO','UND','12.3','25',0,0,3,'25',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (202,'CONJUNTO BABY SATY 1/2/3 SHORTS E REGATA FEM','UND','8','16.7',0,0,3,'16.7',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (203,'FAIXA UMBILICAL C/ 3','UND','4.19','8.9',0,0,3,'8.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (204,'BONÉ P/M/G','UND','8','18.9',0,0,3,'18.9',2,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (205,'CHAPEU DIVERSOS','UND','8','18.9',0,0,3,'18.9',2,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (206,'BONÉ PIMPOLHO','UND','8.9','16.7',0,0,3,'16.7',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (207,'BABADOR BIA CORUJINHA / JOANINHA','UND','3.4','8.9',0,0,3,'8.9',2,NULL,NULL,NULL,'ANO TODO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (208,'BABADOR','UND','10.17','18.9',0,0,3,'18.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (209,'BABADOR SIMPLES BIA BABY','UND','2.04','4.4',0,0,3,'4.4',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (210,'FAIXA UMBILICAL','UND','5.8','11.2',0,0,3,'11.2',2,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (211,'LUVA LÃ','UND','5','11.2',0,0,3,'11.2',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (212,'LUVA MALHA','UND','1.62','2.9',0,0,3,'2.9',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (213,'LUVA PLUSCH','UND','2.8','4.9',0,0,3,'4.9',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (214,'LUVA LA','UND','2.93','6.7',0,0,3,'6.7',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (215,'TOUCA DE FIO','UND','2.2','4.9',0,0,3,'4.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (216,'TOUCA PLUSCH DIN DON','UND','3.45','6.9',0,0,3,'6.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (217,'TOUCA','UND','11.2','22.3',0,0,3,'22.3',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (218,'CACHECOLL FEMININO SP','UND','12','25',0,0,8,'25',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (219,'TOUCA ADULTO','UND','15','30',0,0,8,'30',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (220,'KIT FIO 3 PEÇAS','UND','12','22.3',0,0,8,'22.3',2,NULL,NULL,NULL,'INVERNO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (221,'VESTIDO MALHA','PÇ','13','27.8',0,0,4,'27.8',2,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (222,'CONJUNTO BATIZADO DEL','UND','32.4','65.8',0,0,9,'65.8',2,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (223,'CONJUNTO BATIZADO JARDINEIRA BRANCA/MARINHEIRO','UND','48.99','88.9',0,0,9,'88.9',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (224,'JARDINEIRA BATIZADO','UND','44','88',0,0,9,'88',2,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (225,'CONJUNTO BATIZADO MASCULINO MARINHEIRO','UND','38.8','68.9',0,0,9,'68.9',2,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (226,'TIP TOP LONGO START','UND','12','25',0,0,3,'25',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (227,'TIP TOP MALHA','UND','22.43','48.9',0,0,3,'48.9',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (228,'TIP TOP BORDADO','UND','18','35',0,0,3,'35',2,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (229,'TIP TOP PLUSCH SIMPLES SMOBY / PARQUINHO','UND','21.8','41.2',0,0,3,'41.2',2,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (230,'TIP TOP MALHA BORDADADO SMOBY','UND','20.9','44.5',0,0,3,'44.5',2,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (231,'SUTIA AMAMENTAR COTTON M','UND','14','48.9',0,0,11,'48.9',3,NULL,NULL,NULL,'ANO TODO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (232,'SUTIAN AMAMENTAÇÃO','UND','13.99','35',0,0,11,'35',3,NULL,NULL,NULL,'ANO TODO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (233,'SUTIAN AMAMENTAÇÃO COTTON M','UND','13.99','27.8',0,0,11,'27.8',3,NULL,NULL,NULL,'ANO TODO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (234,'PIJAMA APELUCIADO ABERTO FEM P','UND','51','122.3',0,0,1,'122.3',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (235,'PIJAMA APELUCIADO ABERTO FEM G','UND','53.15','122.3',0,0,1,'122.3',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (236,'PIJAMA APELUCIADO ABERTO FEM M','UND','50.21','122.3',0,0,1,'122.3',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (237,'SUTIA MENINA MOCA','UND','13.5','24',0,0,12,'24',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (238,'SUTIA TOP FAIXA TRIFIL','UND','9.95','18.9',0,0,6,'18.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (239,'SUTIAN NADADOR TRIFIL ALÇA FINA SIMPLES','UND','12.08','26.9',0,0,6,'26.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (240,'SUTIAN TRIFIL S/COSTURA','UND','13.9','28.9',0,0,6,'28.9',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (241,'PIJAMA LONGO MASC P','UND','36.43','86.7',0,0,1,'86.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (242,'PIJAMA LONGO MASC M','UND','39.63','86.7',0,0,1,'86.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (243,'PIJAMA LONGO MASC G','UND','42.66','86.7',0,0,1,'86.7',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (244,'PIJAMA LONGO MASC GG','UND','43.76','87.8',0,0,1,'87.8',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (245,'PIJAMA APELUCIADO ABERTO FEM GG','UND','53.99','123.4',0,0,1,'123.4',1,NULL,NULL,NULL,'INVERNO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (246,'SUTIA BOJO SCHR','UND','20.5','44.5',0,0,12,'44.5',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (247,'SUTIA COLAR TAPE SP','PÇ','10','22.3',0,0,5,'22.3',3,NULL,NULL,NULL,'ANO TODO','N');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (248,'CINTA SAO PAULO','UND','15','27.8',0,0,5,'27.8',3,NULL,NULL,NULL,'ANO TODO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (249,'PIJAMA CURTO MASCULINO 3G','UND','36.7','81.2',0,0,1,'81.2',1,NULL,NULL,NULL,'VERÃO','A');
INSERT INTO produto(codigo,descricao,und,preco_custo,preco_venda,desconto,saldo,id_fornecedor,preco_final_venda,id_categoria,codigo_barras,ncm,peso,estacao,status) VALUES (250,'SUTIA REFORCADO','UND','15','35',0,0,4,'35',3,NULL,NULL,NULL,'ANO TODO','A');

-- movimento_entrada 
-- ----------------------------------------------------------
-- janeiro/24
INSERT INTO movimento_entrada (id_fornecedor,n_nota,data_entrada,valor_total,usuario) VALUES
	 (1,'1024','2024-01-03',9912.82,'10'),
	 (2,'2134009','2024-01-03',6927.95,'10'),
	 (3,'20048','2024-01-04',1914.10,'12'),
	 (4,'28281415','2024-01-05',202.30,'12'),
	 (5,'2004','2024-01-05',279.79,'10'),
	 (6,'20456871','2024-01-06',735.15,'10'),
	 (8,'1134','2024-01-07',135.00,'12'),
	 (9,'20245','2024-01-08',665.75,'10'),
	 (11,'2401','2024-01-09',1049.50,'10'),
	 (12,'123','2024-01-09',182.50,'10');

-- fevereiro/24
	 INSERT INTO movimento_entrada (id_fornecedor,n_nota,data_entrada,valor_total,usuario) VALUES
	 (1,'1355','2024-02-05',2966.30,'12'),
	 (2,'2134985','2024-02-07',937.29,'12'),
	 (6,'20457213','2024-02-08',453.12,'12'),
	 (7,'289789','2024-02-09',255.00,'12');

-- entrada_produtos
-- ----------------------------------------------------------
-- janeiro/24
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (2,20,1,'24.26');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (3,15,1,'24.26');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (4,15,1,'32.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (5,20,1,'32.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (6,20,1,'27.03');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (7,20,1,'28.13');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (8,15,1,'29.23');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (9,15,1,'31.06');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (14,12,1,'55.36');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (15,12,1,'53.65');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (16,12,1,'52.49');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (17,10,1,'53.33');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (18,15,1,'19.17');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (19,20,1,'14.35');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (20,20,1,'15.82');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (21,20,1,'16.55');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (22,20,1,'16.55');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (23,20,1,'18.39');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (24,15,1,'14.35');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (25,15,1,'15.82');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (26,15,1,'16.55');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (27,15,1,'16.55');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (28,15,1,'18.39');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (29,15,1,'19.86');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (30,15,1,'21.32');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (1,8,2,'33.50');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (10,10,2,'77.71');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (11,10,2,'77.71');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (12,10,2,'77.71');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (13,10,2,'77.71');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (47,10,2,'24.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (48,10,2,'24.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (49,10,2,'24.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (50,10,2,'26.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (51,10,2,'26.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (52,10,2,'20.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (53,10,2,'29.84');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (54,10,2,'29.84');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (60,8,2,'60.59');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (61,8,2,'60.59');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (62,8,2,'60.59');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (63,8,2,'60.59');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (114,3,3,'33.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (118,2,3,'4.40');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (119,10,3,'10.33');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (120,10,3,'30.50');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (121,3,3,'24.75');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (122,8,3,'3.50');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (123,5,3,'5.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (125,3,3,'12.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (126,3,3,'19.44');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (127,3,3,'9.06');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (128,3,3,'23.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (129,5,3,'19.78');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (130,2,3,'10.45');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (134,3,3,'19.75');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (135,5,3,'20.61');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (146,3,3,'40.80');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (147,2,3,'65.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (150,3,3,'3.08');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (151,3,3,'61.50');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (203,3,3,'4.19');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (207,5,3,'3.40');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (210,5,3,'5.80');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (226,8,3,'12.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (227,8,3,'22.43');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (228,8,3,'18.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (132,7,4,'12.90');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (199,4,4,'8.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (221,5,4,'13.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (250,12,4,'15.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (153,2,5,'34.18');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (154,3,5,'48.81');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (247,5,5,'10.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (248,3,5,'15.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (171,8,6,'4.40');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (172,5,6,'6.66');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (173,5,6,'6.15');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (174,5,6,'3.70');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (176,5,6,'5.50');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (184,5,6,'0.75');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (185,5,6,'3.40');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (188,5,6,'7.95');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (189,7,6,'9.95');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (191,5,6,'8.60');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (193,5,6,'9.95');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (194,10,6,'4.95');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (195,10,6,'9.64');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (196,10,6,'8.47');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (197,10,6,'12.25');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (240,5,6,'13.90');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (218,4,7,'12.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (219,5,7,'15.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (220,9,7,'12.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (222,5,8,'32.40');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (223,5,8,'48.99');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (224,5,8,'44.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (225,5,8,'38.80');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (231,25,9,'14.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (232,25,9,'13.99');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (233,25,9,'13.99');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (237,12,10,'13.50');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (246,12,10,'20.50');

-- UPDATE saldo conforme entrada janeiro/24

UPDATE produto SET saldo = saldo +20 WHERE codigo ='2';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='3';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='4';
UPDATE produto SET saldo = saldo +20 WHERE codigo ='5';
UPDATE produto SET saldo = saldo +20 WHERE codigo ='6';
UPDATE produto SET saldo = saldo +20 WHERE codigo ='7';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='8';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='9';
UPDATE produto SET saldo = saldo +12 WHERE codigo ='14';
UPDATE produto SET saldo = saldo +12 WHERE codigo ='15';
UPDATE produto SET saldo = saldo +12 WHERE codigo ='16';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='17';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='18';
UPDATE produto SET saldo = saldo +20 WHERE codigo ='19';
UPDATE produto SET saldo = saldo +20 WHERE codigo ='20';
UPDATE produto SET saldo = saldo +20 WHERE codigo ='21';
UPDATE produto SET saldo = saldo +20 WHERE codigo ='22';
UPDATE produto SET saldo = saldo +20 WHERE codigo ='23';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='24';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='25';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='26';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='27';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='28';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='29';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='30';
UPDATE produto SET saldo = saldo +8 WHERE codigo ='1';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='10';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='11';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='12';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='13';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='47';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='48';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='49';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='50';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='51';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='52';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='53';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='54';
UPDATE produto SET saldo = saldo +8 WHERE codigo ='60';
UPDATE produto SET saldo = saldo +8 WHERE codigo ='61';
UPDATE produto SET saldo = saldo +8 WHERE codigo ='62';
UPDATE produto SET saldo = saldo +8 WHERE codigo ='63';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='114';
UPDATE produto SET saldo = saldo +2 WHERE codigo ='118';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='119';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='120';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='121';
UPDATE produto SET saldo = saldo +8 WHERE codigo ='122';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='123';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='125';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='126';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='127';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='128';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='129';
UPDATE produto SET saldo = saldo +2 WHERE codigo ='130';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='134';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='135';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='146';
UPDATE produto SET saldo = saldo +2 WHERE codigo ='147';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='150';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='151';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='203';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='207';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='210';
UPDATE produto SET saldo = saldo +8 WHERE codigo ='226';
UPDATE produto SET saldo = saldo +8 WHERE codigo ='227';
UPDATE produto SET saldo = saldo +8 WHERE codigo ='228';
UPDATE produto SET saldo = saldo +7 WHERE codigo ='132';
UPDATE produto SET saldo = saldo +4 WHERE codigo ='199';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='221';
UPDATE produto SET saldo = saldo +12 WHERE codigo ='250';
UPDATE produto SET saldo = saldo +2 WHERE codigo ='153';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='154';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='247';
UPDATE produto SET saldo = saldo +3 WHERE codigo ='248';
UPDATE produto SET saldo = saldo +8 WHERE codigo ='171';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='172';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='173';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='174';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='176';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='184';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='185';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='188';
UPDATE produto SET saldo = saldo +7 WHERE codigo ='189';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='191';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='193';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='194';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='195';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='196';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='197';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='240';
UPDATE produto SET saldo = saldo +4 WHERE codigo ='218';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='219';
UPDATE produto SET saldo = saldo +9 WHERE codigo ='220';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='222';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='223';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='224';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='225';
UPDATE produto SET saldo = saldo +25 WHERE codigo ='231';
UPDATE produto SET saldo = saldo +25 WHERE codigo ='232';
UPDATE produto SET saldo = saldo +25 WHERE codigo ='233';
UPDATE produto SET saldo = saldo +12 WHERE codigo ='237';
UPDATE produto SET saldo = saldo +12 WHERE codigo ='246';

-- fevereiro/24
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (31,10,11,'22.79');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (32,10,11,'23.94');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (33,10,11,'15.13');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (34,10,11,'16.60');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (35,10,11,'19.17');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (55,10,11,'37.43');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (56,10,11,'37.51');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (57,10,11,'38.24');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (58,10,11,'42.91');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (59,10,11,'42.91');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (84,7,12,'24.64');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (85,7,12,'24.64');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (86,7,12,'24.64');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (115,5,12,'15.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (116,5,12,'18.38');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (117,5,12,'20.75');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (54,5,12,'29.84');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (177,5,13,'4.33');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (178,5,13,'5.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (182,7,13,'20.00');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (186,7,13,'2.36');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (190,7,13,'9.95');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (238,10,13,'9.95');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (239,10,13,'12.08');
INSERT INTO entrada_produtos(codigo,quantidade,codigo_movimento,preco_custo) VALUES (198,15,14,'17.00');

-- UPDATE saldo conforme entrada fevereiro/24

UPDATE produto SET saldo = saldo +10 WHERE codigo ='31';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='32';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='33';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='34';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='35';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='55';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='56';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='57';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='58';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='59';
UPDATE produto SET saldo = saldo +7 WHERE codigo ='84';
UPDATE produto SET saldo = saldo +7 WHERE codigo ='85';
UPDATE produto SET saldo = saldo +7 WHERE codigo ='86';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='115';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='116';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='117';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='54';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='177';
UPDATE produto SET saldo = saldo +5 WHERE codigo ='178';
UPDATE produto SET saldo = saldo +7 WHERE codigo ='182';
UPDATE produto SET saldo = saldo +7 WHERE codigo ='186';
UPDATE produto SET saldo = saldo +7 WHERE codigo ='190';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='238';
UPDATE produto SET saldo = saldo +10 WHERE codigo ='239';
UPDATE produto SET saldo = saldo +15 WHERE codigo ='198';


-- movimento_saida janeiro 2024
-- ----------------------------------------------------------
INSERT INTO movimento_saida (data_saida,hora_saida,cod_operador,cod_vendedor,valor_total,operacao,frete,valor_frete,id_cliente,tipo_venda) VALUES
	 ('2024-01-08','10:10:22.169842','10',11,332.62,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-08','11:13:42.274401','10',10,106.90,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-08','12:43:12.699296','10',11,198.90,'Elo 1x','VENDA LOCAL',0.00,9,'local'),
	 ('2024-01-09','10:14:43.838212','10',13,131.48,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-09','10:45:47.374135','10',12,137.30,'Master 1x','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-09','10:57:55.090264','10',11,194.50,'A Vista','MERCADO ENVIOS',12.00,3,'ecommerce'),
	 ('2024-01-10','11:21:27.826115','10',13,200.20,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-10','14:29:45.179362','10',10,101.10,'Visa Débito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-11','10:24:17.349171','11',11,63.40,'Cartão Crédito','PAC',9.90,6,'ecommerce'),
	 ('2024-01-11','10:45:38.720267','11',13,124.60,'A Vista','VENDA LOCAL',0.00,1,'local');
INSERT INTO movimento_saida (data_saida,hora_saida,cod_operador,cod_vendedor,valor_total,operacao,frete,valor_frete,id_cliente,tipo_venda) VALUES
	 ('2024-01-12','13:36:21.421105','11',10,117.90,'A Vista','MERCADO ENVIOS',32.00,2,'ecommerce'),
	 ('2024-01-13','16:20:04.799509','12',12,145.71,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-13','17:24:13.724043','12',10,92.40,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-15','15:22:19.567155','12',13,412.50,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-15','17:33:11.117036','12',10,233.50,'A Vista','RETIRADO NO LOCAL',0.00,7,'ecommerce'),
	 ('2024-01-16','10:26:01.284308','12',11,80.30,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-16','11:37:59.755139','12',13,80.00,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-16','14:48:11.985567','12',12,11.20,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-17','14:41:00.717402','12',12,82.30,'Cartão Crédito','SEDEX',42.00,2,'ecommerce'),
	 ('2024-01-17','16:33:19.575394','12',11,37.80,'A Vista','VENDA LOCAL',0.00,5,'local');
INSERT INTO movimento_saida (data_saida,hora_saida,cod_operador,cod_vendedor,valor_total,operacao,frete,valor_frete,id_cliente,tipo_venda) VALUES
	 ('2024-01-17','17:43:13.736189','12',11,122.30,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-18','16:25:53.098299','12',10,131.20,'Elo Débito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-18','16:46:44.72632','12',10,87.90,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-19','11:36:37.869117','12',10,22.30,'Cartão Crédito','RETIRADO NO LOCAL',0.00,7,'ecommerce'),
	 ('2024-01-19','12:57:58.57099','12',11,47.70,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-19','14:48:46.2969','12',13,219.05,'Elo 2x','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-22','13:50:42.949035','13',13,61.70,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-22','15:36:17.739081','13',12,87.80,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-24','16:18:24.045186','13',12,188.10,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-26','12:13:18.71893','13',13,89.00,'A Vista','MERCADO ENVIOS',8.90,11,'ecommerce');
INSERT INTO movimento_saida (data_saida,hora_saida,cod_operador,cod_vendedor,valor_total,operacao,frete,valor_frete,id_cliente,tipo_venda) VALUES
	 ('2024-01-26','13:18:04.88106','13',11,22.40,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-29','14:23:44.53011','13',11,208.70,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-29','15:28:19.396292','13',13,68.90,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-30','18:04:46.248964','13',11,81.20,'Hiper 2x','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-31','09:18:34.73701','13',12,126.03,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-31','11:10:33.227734','12',12,161.20,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-01-31','14:20:09.484994','12',10,253.40,'A Vista','VENDA LOCAL',0.00,1,'local');

-- movimento_saida fevereiro 2024

INSERT INTO movimento_saida (data_saida,hora_saida,cod_operador,cod_vendedor,valor_total,operacao,frete,valor_frete,id_cliente,tipo_venda) VALUES
	 ('2024-02-05','11:33:12.363711','12',10,35.00,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-05','12:30:48.357676','12',10,289.00,'Elo 2x','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-06','13:24:12.460424','12',11,122.30,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-06','14:45:27.583409','12',13,112.80,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-07','10:35:15.447353','12',12,44.50,'A Vista','MERCADO ENVIOS',12.00,3,'ecommerce'),
	 ('2024-02-07','11:38:00.252394','12',11,145.16,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-08','10:26:55.590392','12',12,33.00,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-08','11:17:20.333552','12',12,30.00,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-08','14:39:13.977455','12',11,90.00,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-09','11:23:50.351536','12',10,116.18,'Cartão Crédito','VENDA LOCAL',0.00,1,'local');
INSERT INTO movimento_saida (data_saida,hora_saida,cod_operador,cod_vendedor,valor_total,operacao,frete,valor_frete,id_cliente,tipo_venda) VALUES
	 ('2024-02-09','11:44:15.825482','12',10,150.10,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-12','14:54:52.177812','12',12,83.40,'A Vista','VENDA LOCAL',0.00,10,'local'),
	 ('2024-02-12','14:58:07.969003','12',10,74.70,'Cartão Crédito','VENDA LOCAL',0.00,8,'local'),
	 ('2024-02-13','11:50:33.329137','12',10,81.20,'Cartão Crédito','SEDEX',50.00,3,'ecommerce'),
	 ('2024-02-13','13:27:18.95709','12',13,38.90,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-14','14:58:00.383','12',11,80.10,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-14','15:38:54.171588','12',13,95.60,'Visa Débito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-15','11:59:50.316221','12',10,55.60,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-15','12:30:55.883319','12',12,46.20,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-16','13:01:23.1443','12',10,105.64,'A Vista','RETIRADO NO LOCAL',0.00,14,'ecommerce');
INSERT INTO movimento_saida (data_saida,hora_saida,cod_operador,cod_vendedor,valor_total,operacao,frete,valor_frete,id_cliente,tipo_venda) VALUES
	 ('2024-02-16','14:22:38.398287','12',13,86.70,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-16','15:03:44.398421','12',10,69.90,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-17','13:14:05.925064','12',10,89.00,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-17','14:51:52.157503','12',12,110.00,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-17','15:10:36.968622','12',11,31.70,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-17','16:23:11.195419','12',13,18.90,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-19','12:53:33.23452','12',11,89.00,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-19','13:32:26.025779','13',13,112.30,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-19','15:12:57.539658','13',13,100.00,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-19','17:33:26.514517','13',13,144.50,'Cartão Crédito','RETIRADO NO LOCAL',0.00,13,'ecommerce');
INSERT INTO movimento_saida (data_saida,hora_saida,cod_operador,cod_vendedor,valor_total,operacao,frete,valor_frete,id_cliente,tipo_venda) VALUES
	 ('2024-02-20','10:14:07.84969','13',10,69.00,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-20','13:14:41.132372','13',12,44.50,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-21','15:54:57.108424','13',12,37.80,'Elo Débito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-22','16:15:27.791761','13',11,122.30,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-23','11:18:52.869372','13',13,145.60,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-23','14:26:14.88051','13',12,68.90,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-26','16:57:31.723599','13',11,26.70,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-27','10:39:50.674429','10',12,148.50,'A Vista','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-28','11:20:56.481238','10',13,192.30,'Cartão Crédito','VENDA LOCAL',0.00,1,'local'),
	 ('2024-02-29','11:47:37.824133','10',11,88.00,'Cartão Crédito','VENDA LOCAL',0.00,1,'local');


-- saida_produtos janeiro 2024
-- ----------------------------------------------------------
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (1,1,1,'62.30',0,'62.30','33.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (5,2,1,'69.90',10,'125.82','32.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (12,1,1,'144.50',0,'144.50','77.71');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (67,1,2,'44.50',0,'44.50','29.84');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (119,2,2,'31.20',0,'62.40','10.33');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (21,1,3,'44.50',0,'44.50','16.55');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (11,1,3,'144.50',0,'144.50','77.71');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (194,1,3,'9.90',0,'9.90','4.95');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (218,1,4,'25.00',5,'23.75','12.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (225,1,4,'68.90',5,'65.46','38.80');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (129,1,4,'44.50',5,'42.28','19.78');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (197,1,5,'25.00',0,'25.00','12.25');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (151,1,5,'112.30',0,'112.30','61.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (13,1,6,'145.60',0,'145.60','77.71');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (231,1,6,'48.90',0,'48.90','14.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (207,1,7,'8.90',0,'8.90','3.40');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (120,2,7,'61.20',0,'122.40','30.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (8,1,7,'68.90',0,'68.90','29.23');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (118,1,8,'9.90',0,'9.90','4.40');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (66,1,8,'46.70',0,'46.70','23.80');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (22,1,8,'44.50',0,'44.50','16.55');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (199,1,9,'17.80',0,'17.80','8.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (75,1,9,'45.60',0,'45.60','21.74');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (1,2,10,'62.30',0,'124.60','33.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (223,1,11,'88.90',0,'88.90','48.99');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (210,1,11,'11.20',0,'11.20','5.80');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (199,1,11,'17.80',0,'17.80','8.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (154,1,12,'107.80',0,'107.80','48.81');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (220,2,12,'22.30',15,'37.91','12.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (119,2,13,'31.20',0,'62.40','10.33');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (196,2,13,'15.00',0,'30.00','8.47');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (1,1,14,'62.30',0,'62.30','33.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (120,1,14,'61.20',0,'61.20','30.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (11,2,14,'144.50',0,'289.00','77.71');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (10,1,15,'144.50',0,'144.50','77.71');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (21,2,15,'44.50',0,'89.00','16.55');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (248,1,16,'27.80',0,'27.80','15.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (122,1,16,'7.90',0,'7.90','3.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (220,2,16,'22.30',0,'44.60','12.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (114,1,17,'68.90',0,'68.90','33.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (174,1,17,'6.70',0,'6.70','3.70');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (209,1,17,'4.40',0,'4.40','2.04');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (173,1,18,'11.20',0,'11.20','6.15');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (132,1,19,'26.70',0,'26.70','12.90');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (233,2,19,'27.80',0,'55.60','13.99');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (195,2,20,'18.90',0,'37.80','9.64');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (15,1,21,'122.30',0,'122.30','53.65');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (16,1,22,'122.30',0,'122.30','52.49');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (150,1,22,'8.90',0,'8.90','3.08');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (120,1,23,'61.20',0,'61.20','30.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (132,1,23,'26.70',0,'26.70','12.90');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (171,1,24,'8.90',0,'8.90','4.40');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (185,2,24,'6.70',0,'13.40','3.40');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (192,1,25,'9.90',0,'9.90','4.80');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (195,2,25,'18.90',0,'37.80','9.64');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (22,2,26,'44.50',0,'89.00','16.55');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (11,1,26,'144.50',10,'130.05','77.71');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (207,1,27,'8.90',0,'8.90','3.40');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (218,1,27,'25.00',0,'25.00','12.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (248,1,27,'27.80',0,'27.80','15.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (225,1,28,'68.90',0,'68.90','38.80');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (193,1,28,'18.90',0,'18.90','9.95');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (15,1,29,'122.30',0,'122.30','53.65');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (222,1,29,'65.80',0,'65.80','32.40');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (21,2,30,'44.50',0,'89.00','16.55');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (172,2,31,'11.20',0,'22.40','6.66');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (223,1,32,'88.90',0,'88.90','48.99');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (54,2,32,'59.90',0,'119.80','29.84');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (4,1,33,'68.90',0,'68.90','32.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (208,1,34,'18.90',0,'18.90','10.17');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (1,1,34,'62.30',0,'62.30','33.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (171,1,35,'8.90',0,'8.90','4.40');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (2,2,35,'68.90',15,'117.13','24.26');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (14,1,36,'122.30',0,'122.30','55.36');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (18,1,36,'38.90',0,'38.90','19.17');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (60,1,37,'115.60',0,'115.60','60.59');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (7,2,37,'68.90',0,'137.80','28.13');

-- UPDATE saldo conforme saida janeiro

UPDATE produto SET saldo = saldo -1 WHERE codigo ='1';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='5';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='12';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='67';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='119';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='21';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='11';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='194';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='218';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='225';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='129';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='197';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='151';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='13';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='231';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='207';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='120';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='8';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='118';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='66';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='22';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='199';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='75';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='1';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='223';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='210';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='199';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='154';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='220';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='119';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='196';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='1';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='120';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='11';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='10';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='21';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='248';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='122';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='220';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='114';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='174';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='209';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='173';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='132';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='233';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='195';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='15';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='16';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='150';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='120';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='132';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='171';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='185';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='192';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='195';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='22';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='11';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='207';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='218';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='248';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='225';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='193';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='15';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='222';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='21';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='172';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='223';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='54';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='4';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='208';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='1';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='171';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='2';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='14';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='18';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='60';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='7';

-- saida_produtos janeiro 2024

INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (198,1,38,'35.00',0,'35.00','17.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (12,2,39,'144.50',0,'289.00','77.71');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (15,1,40,'122.30',0,'122.30','53.65');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (198,1,41,'35.00',0,'35.00','17.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (182,2,41,'38.90',0,'77.80','20.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (33,1,42,'44.50',0,'44.50','15.13');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (198,1,43,'35.00',0,'35.00','17.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (120,2,43,'61.20',10,'110.16','30.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (198,1,44,'33.00',0,'33.00','17.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (189,1,45,'18.90',0,'18.90','9.95');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (123,1,45,'11.20',0,'11.20','5.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (197,3,46,'25.00',0,'75.00','12.25');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (196,1,46,'15.00',0,'15.00','8.47');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (17,1,47,'122.30',5,'116.18','53.33');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (6,1,48,'68.90',0,'68.90','27.03');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (153,1,48,'81.20',0,'81.20','34.18');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (134,1,49,'38.90',0,'38.90','19.75');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (24,1,49,'44.50',0,'44.50','14.35');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (207,1,50,'8.90',0,'8.90','3.40');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (222,1,50,'65.80',0,'65.80','32.40');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (55,1,51,'81.20',0,'81.20','37.43');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (116,1,52,'38.90',0,'38.90','18.38');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (22,2,53,'44.50',10,'80.10','16.55');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (132,1,54,'26.70',0,'26.70','12.90');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (7,1,54,'68.90',0,'68.90','28.13');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (233,2,55,'27.80',0,'55.60','13.99');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (198,1,56,'35.00',0,'35.00','17.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (210,1,56,'11.20',0,'11.20','5.80');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (32,2,57,'55.60',5,'105.64','23.94');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (56,1,58,'86.70',0,'86.70','37.51');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (5,1,59,'69.90',0,'69.90','32.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (23,2,60,'44.50',0,'89.00','18.39');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (16,1,61,'122.30',10,'110.07','52.49');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (191,1,62,'16.70',0,'16.70','8.60');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (188,1,62,'15.00',0,'15.00','7.95');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (193,1,63,'18.90',0,'18.90','9.95');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (25,2,64,'44.50',0,'89.00','15.82');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (151,1,65,'112.30',0,'112.30','61.50');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (53,2,66,'58.90',10,'106.02','29.84');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (10,1,67,'144.50',0,'144.50','77.71');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (220,1,68,'22.30',0,'22.30','12.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (35,1,68,'46.70',0,'46.70','19.17');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (21,1,69,'44.50',0,'44.50','16.55');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (189,2,70,'18.90',0,'37.80','9.95');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (16,1,71,'122.30',0,'122.30','52.49');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (13,1,72,'145.60',0,'145.60','77.71');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (2,1,73,'68.90',0,'68.90','24.26');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (132,1,74,'26.70',0,'26.70','12.90');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (178,1,75,'15.00',0,'15.00','5.00');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (20,3,75,'44.50',0,'133.50','15.82');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (34,1,76,'46.70',0,'46.70','16.60');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (13,1,76,'145.60',0,'145.60','77.71');
INSERT INTO saida_produtos(codigo,quantidade,codigo_movimento,preco,desconto,preco_total,preco_custo) VALUES (224,1,77,'88.00',0,'88.00','44.00');

-- UPDATE saldo conforme saida fevereiro

UPDATE produto SET saldo = saldo -1 WHERE codigo ='198';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='12';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='15';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='198';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='182';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='33';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='198';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='120';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='198';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='189';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='123';
UPDATE produto SET saldo = saldo -3 WHERE codigo ='197';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='196';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='17';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='6';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='153';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='134';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='24';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='207';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='222';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='55';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='116';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='22';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='132';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='7';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='233';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='198';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='210';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='32';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='56';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='5';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='23';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='16';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='191';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='188';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='193';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='25';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='151';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='53';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='10';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='220';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='35';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='21';
UPDATE produto SET saldo = saldo -2 WHERE codigo ='189';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='16';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='13';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='2';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='132';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='178';
UPDATE produto SET saldo = saldo -3 WHERE codigo ='20';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='34';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='13';
UPDATE produto SET saldo = saldo -1 WHERE codigo ='224';


-- movimento_devolucao
-- ----------------------------------------------------------
INSERT INTO movimento_devolucao ("data",cod_operador,n_doc_venda) VALUES
	 ('2024-01-23','12','22'),
	 ('2024-02-08','12','34'),
	 ('2024-02-21','12','43');

-- devolucao_produtos
-- ----------------------------------------------------------
INSERT INTO devolucao_produtos (codigo,quantidade,codigo_movimento,preco) VALUES	 (150,1.0,1,8.90);
INSERT INTO devolucao_produtos (codigo,quantidade,codigo_movimento,preco) VALUES	 (208,1.0,2,18.90);
INSERT INTO devolucao_produtos (codigo,quantidade,codigo_movimento,preco) VALUES	 (198,1.0,3,35.00);

-- update saldo quantidade de item devolvido
UPDATE produto SET saldo = saldo +1 WHERE codigo ='150';
UPDATE produto SET saldo = saldo +1 WHERE codigo ='208';
UPDATE produto SET saldo = saldo +1 WHERE codigo ='198';

/* Não existe mais esse produto da venda relacionado a seu n_doc, 
			todas unidades foram devolvidas, a linha da tabela saida_produtos fica vazia, deleta então a sua respectiva tabela*/
DELETE FROM saida_produtos  WHERE codigo = '150' and codigo_movimento = '22' ;
DELETE FROM saida_produtos  WHERE codigo = '208' and codigo_movimento = '34' ;
DELETE FROM saida_produtos  WHERE codigo = '198' and codigo_movimento = '43' ;


-- movimento_ajuste
-- ----------------------------------------------------------
INSERT INTO movimento_ajuste ("data",cod_operador,tipo) VALUES
	 ('2024-01-28','12','ENTRADA'),
	 ('2024-02-18','12','SAIDA');

-- ajuste_produtos
-- ----------------------------------------------------------
INSERT INTO ajuste_produtos (codigo,quantidade,codigo_movimento,preco_custo,motivo) VALUES	 ('66',1.0,1,23.80,'ERRO SAIDA');
INSERT INTO ajuste_produtos (codigo,quantidade,codigo_movimento,preco_custo,motivo) VALUES	 ('232',3.0,2,13.99,'FURTO');

-- update saldo quantidade conforme ajuste, entrada ou saida
UPDATE produto SET saldo = saldo + 1 WHERE codigo  = '66';
UPDATE produto SET saldo = saldo - 3 WHERE codigo  = '232';

-- inserindo algumas unidades
INSERT INTO unidade(unidade) VALUES 
('KIT'), 
('PÇ'),
('UND');				     