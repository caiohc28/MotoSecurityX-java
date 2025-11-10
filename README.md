# 🏍️ MotoSecurityX — Sprint 4

Aplicação web para **controle de motos e pátios**, com autenticação, movimentação entre pátios e gestão de funcionários.

Desenvolvida em **Spring Boot 3**, com persistência via **JPA/Hibernate**, **Flyway para versionamento do banco**, e **Azure SQL Database (PaaS)** como ambiente de produção.

---

## 👥 Integrantes
| Nome | RM | Turma |
|------|----|--------|
| Caio Henrique Costa | 554600 | 2TDSPJ |
| Carlos Eduardo | 555223 | 2TDSPJ |
| Antônio Lino | 554518 | 2TDSPJ |

---

## ☁️ Infraestrutura em Nuvem
- **Banco:** Azure SQL Database (PaaS)
- **Servidor:** Azure Web App
- **Pipeline:** Azure DevOps (CI/CD)
- **Versionamento:** GitHub + integração com Azure

---

## ⚙️ Tecnologias Utilizadas
- Java 17  
- Spring Boot 3.5.x  
- Spring Security  
- JPA / Hibernate  
- Flyway  
- Thymeleaf  
- Maven Wrapper  
- Azure SQL (PaaS)

---

## 🧩 Estrutura do Banco (Azure SQL)

**Tabelas Principais:**
- `usuario` — credenciais e permissões
- `role` — papéis de acesso (ROLE_ADMIN / ROLE_OPERADOR)
- `usuario_role` — relacionamento N:N entre usuários e roles
- `moto` — placa, modelo, disponibilidade, pátio atual
- `patio` — nome, capacidade, endereço
- `movimentacao` — histórico de transferências entre pátios
- `funcionario` — nome, email e status ativo
- `alocacao` — vínculo entre funcionário e moto
- `flyway_schema_history` — controle de versões de migrations

---

## 🔐 Usuários Padrão 
| Usuário | Senha |
|----------|--------|
| admin | admin123 | 
| operador | oper123 | 

---

## 🌐 Funcionalidades Principais
- **Login/Logout seguro** com Spring Security  
- **Controle de acesso:** ADMIN (CRUD completo) / OPERADOR (somente leitura)  
- **CRUDs completos:** Motos, Pátios e Funcionários  
- **Movimentações:** registro de transferências entre pátios  
- **Alocações:** vínculo entre motos e funcionários  
- **Validações:** placa única, pátio com capacidade, senha criptografada  
- **Flyway migrations automáticas** para criação e atualização do banco

---

## 🧭 Arquitetura (Camadas)

**📂 src/main/java/br/com/motosecurityx/**

  config/ → Configuração de segurança (SecurityConfig), reset e normalização de senhas (DevPasswordReset, DevPasswordNormalizer)

  domain/ → Entidades de domínio (Moto, Patio, Movimentacao, Funcionario, Alocacao)

  repository/ → Interfaces JPA (MotoRepository, PatioRepository, MovimentacaoRepository, etc.)

  service/ → Regras de negócio (MotoServiceImpl, PatioServiceImpl, etc.)

  web/ → Controladores MVC (MotoController, PatioController, AlocacaoController, PageController)

**📂 src/main/resources/**

  db/migration/ → Scripts Flyway (V1__create_tables.sql até V11__normalize_passwords.sql)

  templates/ → iews Thymeleaf (login.html, home.html, motos/, patios/, alocacoes/, fragments/)

  static/ → CSS (css/app.css)

## 🧩 Modelagem de Domínio (DDD)

- Entidades principais:

    Moto: placa, modelo, disponível, pátio atual

    Patio: nome, capacidade

    Movimentção: moto, pátio origem, pátio destino, data/hora

    Usuário → username, senha (bcrypt), role (ADMIN ou OPERADOR)

    Funcionario / Alocacao → suporte a controle de funcionários vinculados a pátios

- Regras implementadas:

    MotoService.moverMoto() → valida capacidade do pátio destino, atualiza vínculo e gera movimentação

    Usuários ADMIN têm permissões CRUD, OPERADOR apenas leitura

✅ Status atual: 

  Login/Logout com Spring Security (usuário seedado no banco)

  Perfis de acesso: ADMIN e OPERADOR

  CRUD completo de Motos e Pátios com validações

  Controle de movimentação de motos entre pátios

  Views Thymeleaf organizadas com fragments (_header.html, _footer.html)

  Templates de erro customizados (404.html, error.html)

---

# 🧼 Clean Code

- Controllers finos, apenas coordenam request/response

- Services concentram regras de negócio

- Reutilização via interfaces de repositório JPA

- Validações centralizadas com Bean Validation

- Fragments Thymeleaf para reaproveitar layout

---

## 📋 Testes

- Testes manuais: via navegação (Thymeleaf)

- Autenticação testada com ADMIN e OPERADOR

- Regras de negócio validadas:

    Não mover moto se pátio cheio

    Moto exige placa válida

---

## 🧠 Regras de Negócio
- Moto não pode ser movida para pátio cheio  
- Cada moto possui uma placa única  
- Usuários ADMIN podem criar, editar e mover motos  
- OPERADOR tem acesso apenas de leitura  
- Alocação exige moto disponível e funcionário ativo

---

## 🚀 Deploy
- **Build e deploy automático** configurado via Azure DevOps Pipeline:
  - Build → Testes → Deploy no Azure Web App  
  - Banco persistente no Azure SQL  

---

## 🎬 Demonstração
🎥 [Assista ao vídeo da entrega no YouTube](https://www.youtube.com/watch?v=Tsnv3KEawVk)
