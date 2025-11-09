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
🎥 [Assista ao vídeo da entrega no YouTube](https://youtu.be/zCuMNBzGEHs)
