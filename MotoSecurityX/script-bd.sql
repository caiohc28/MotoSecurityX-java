-- ==========================================================
-- SCRIPT DE CRIAÇÃO DO BANCO DE DADOS
-- ==========================================================
CREATE DATABASE MotoSecurityX;
GO
USE MotoSecurityX;
GO

-- ==========================================================
-- TABELAS PRINCIPAIS
-- ==========================================================

-- 1. Tabela: funcionario
CREATE TABLE funcionario (
                             id BIGINT IDENTITY(1,1) PRIMARY KEY,
                             nome VARCHAR(255) NOT NULL,
                             email VARCHAR(255) NOT NULL,
                             ativo BIT NOT NULL
);
GO

-- 2. Tabela: patio
CREATE TABLE patio (
                       id BIGINT IDENTITY(1,1) PRIMARY KEY,
                       nome VARCHAR(255) NOT NULL,
                       capacidade INT NOT NULL,
                       endereco VARCHAR(255) NULL
);
GO

-- 3. Tabela: moto
CREATE TABLE moto (
                      id BIGINT IDENTITY(1,1) PRIMARY KEY,
                      modelo VARCHAR(255) NOT NULL,
                      placa VARCHAR(20) NOT NULL,
                      disponivel BIT NOT NULL,
                      patio_id BIGINT NOT NULL,
                      FOREIGN KEY (patio_id) REFERENCES patio(id)
);
GO

-- 4. Tabela: alocacao
CREATE TABLE alocacao (
                          id BIGINT IDENTITY(1,1) PRIMARY KEY,
                          data_inicio DATETIME2 NOT NULL,
                          data_fim DATETIME2 NOT NULL,
                          funcionario_id BIGINT NOT NULL,
                          moto_id BIGINT NOT NULL,
                          FOREIGN KEY (funcionario_id) REFERENCES funcionario(id),
                          FOREIGN KEY (moto_id) REFERENCES moto(id)
);
GO

-- 5. Tabela: movimentacao
CREATE TABLE movimentacao (
                              id BIGINT IDENTITY(1,1) PRIMARY KEY,
                              data_hora DATETIME2 NOT NULL,
                              origem_id BIGINT NOT NULL,
                              destino_id BIGINT NOT NULL,
                              moto_id BIGINT NOT NULL,
                              FOREIGN KEY (origem_id) REFERENCES patio(id),
                              FOREIGN KEY (destino_id) REFERENCES patio(id),
                              FOREIGN KEY (moto_id) REFERENCES moto(id)
);
GO

-- 6. Tabela: usuario
CREATE TABLE usuario (
                         id BIGINT IDENTITY(1,1) PRIMARY KEY,
                         username VARCHAR(255) NOT NULL,
                         password VARCHAR(255) NOT NULL,
                         enabled BIT NOT NULL,
                         created_at DATETIME2 NULL
);
GO

-- 7. Tabela: role
CREATE TABLE role (
                      id BIGINT IDENTITY(1,1) PRIMARY KEY,
                      name VARCHAR(100) NOT NULL
);
GO

-- 8. Tabela: usuario_role (relação N:N entre usuário e role)
CREATE TABLE usuario_role (
                              id BIGINT IDENTITY(1,1) PRIMARY KEY,
                              usuario_id BIGINT NOT NULL,
                              role_id BIGINT NOT NULL,
                              FOREIGN KEY (usuario_id) REFERENCES usuario(id),
                              FOREIGN KEY (role_id) REFERENCES role(id)
);
GO

-- ==========================================================
-- TABELA DE CONTROLE DO FLYWAY (opcional, migração)
-- ==========================================================
CREATE TABLE flyway_schema_history (
                                       installed_rank INT NOT NULL PRIMARY KEY,
                                       version NVARCHAR(50) NULL,
                                       description NVARCHAR(200) NULL,
                                       type NVARCHAR(20) NULL,
                                       script NVARCHAR(1000) NOT NULL,
                                       checksum INT NULL,
                                       installed_by NVARCHAR(100) NULL,
                                       installed_on DATETIME NOT NULL,
                                       execution_time INT NOT NULL,
                                       success BIT NOT NULL
);
GO

-- ==========================================================
-- DADOS DE EXEMPLO
-- ==========================================================

INSERT INTO patio (nome, capacidade, endereco) VALUES
('Pátio Central', 40, 'Endereço Central'),
('Pátio Zona Leste', 40, 'Endereço Zona Leste'),
('Pátio Zona Oeste', 30, 'Endereço Zona Oeste'),
('Pátio Lateral', 38, 'Endereço Lateral'),
('Pátio Zona Sudeste', 56, 'Endereço Zona Sudeste'),
('Pátio Zona Norte', 30, 'Endereço Zona Norte');
GO

INSERT INTO moto (modelo, placa, disponivel, patio_id) VALUES
('Honda CG 170', 'HGG1E23', 0, 1),
('Yamaha Factor 150', 'XYZ2E45', 1, 2),
('Honda Biz 125', 'JKL3F67', 1, 3),
('Yamaha Fazer 250', 'MNO4G89', 0, 1),
('CB 1600', 'CHC2821', 1, 2),
('Honda CG 180', 'SGH1H23', 0, 5);
GO
