BEGIN;

CREATE TABLE IF NOT EXISTS usuario
(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    password VARCHAR(255),
    username VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS perfis
(
    usuario_id INTEGER NOT NULL REFERENCES usuario (id) ON UPDATE CASCADE ON DELETE NO ACTION,
	perfis INTEGER,
	PRIMARY KEY(usuario_id, perfis)
);

CREATE TABLE IF NOT EXISTS cliente
(
    id SERIAL PRIMARY KEY,
    cpf VARCHAR(14) NOT NULL,
    data_cadastro DATE,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS servico_prestado
(
    id SERIAL PRIMARY KEY,
    data DATE,
    descricao VARCHAR NOT NULL,
    valor NUMERIC(19,2),
    id_cliente INTEGER REFERENCES cliente (id) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS password_reset_token
(
    id SERIAL NOT NULL PRIMARY KEY,
    expiry_date TIMESTAMP(6) WITHOUT TIME ZONE,
    token VARCHAR(255),
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES usuario (id) ON UPDATE CASCADE ON DELETE NO ACTION
);

COMMIT;
