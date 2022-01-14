CREATE TABLE Colaborador(
                            codigoColaborador BIGSERIAL PRIMARY KEY not null,
                            nomeColaborador VARCHAR (80),
                            dataNascimento TEXT,
                            qtdMaxPermissoes int
);

CREATE TABLE Permissao(
                          codigoPermissao BIGSERIAL PRIMARY KEY not null,
                          nomePermissao VARCHAR (80)
);

CREATE TABLE Colaborador_Permissao(
                                      codigoColaborador int not null,
                                      codigoPermissao int not null,
                                      foreign key (codigoColaborador) references  Colaborador(codigoColaborador),
                                      foreign key (codigoPermissao) references Permissao(codigoPermissao),
                                      CONSTRAINT pk_Colaborador_Permissao PRIMARY KEY(codigoColaborador,codigoPermissao)
);


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TABLE Colaborador(
		codigoColaborador uuid DEFAULT uuid_generate_v4 (),
		nomeColaborador VARCHAR (255),
		dataNascimento VARCHAR(10),
		qtdMaxPermissoes int,
		PRIMARY KEY(codigoColaborador)
);
CREATE TABLE Permissao(
		  codigoPermissao uuid DEFAULT uuid_generate_v4 (),
		  nomePermissao VARCHAR (255)
);

CREATE TABLE Colaborador_Permissao(
		  codigoColaborador int not null,
		  codigoPermissao int not null,
		  foreign key (codigoColaborador) references  Colaborador(codigoColaborador),
		  foreign key (codigoPermissao) references Permissao(codigoPermissao),
		  CONSTRAINT pk_Colaborador_Permissao PRIMARY KEY(codigoColaborador,codigoPermissao)
);


DROP TABLE COLABORADOR_PERMISSAO;

DROP TABLE PERMISSAO;

DROP TABLE COLABORADOR;


SELECT c.codigocolaborador, c.nomecolaborador, c.datanascimento, c.qtdmaxpermissoes, p.nomepermissao
FROM colaborador c
inner join colaborador_permissao cp on c.codigocolaborador = cp.codigocolaborador
join permissao p on cp.codigopermissao = p.codigopermissao;