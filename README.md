# 🧩 Modelagem de Banco de Dados - Projeto Seguro

Este repositório contém um projeto completo de modelagem de banco de dados desenvolvido com foco em um sistema de seguros, incluindo:

- Modelagem Conceitual (brModelo)
- Modelagem Lógica
- Script SQL de criação de tabelas (`projeto_seguro_backup.sql`)

---

## 🗃️ Arquivos do Projeto

| Arquivo | Descrição |
|--------|-----------|
| `Conceitual_1.brM3` | Diagrama conceitual inicial criado com o brModelo |
| `ModelagemConceitual_2.brM3` | Versão refinada do modelo conceitual |
| `Lógico_1.brM3` | Modelo lógico do banco |
| `ModelagemLogica_SISSEGURO.brM3` | Versão final do modelo lógico |
| `projeto_seguro_backup.sql` | Script SQL para criação da estrutura do banco de dados no MySQL |
| `MBD - Aula 01.docx` | Material de apoio com conceitos de modelagem |

---

## 🛠️ Tecnologias utilizadas

- **brModelo** – para modelagem conceitual e lógica
- **MySQL** – para execução do script e criação das tabelas
- **Workbench ou DBeaver** – para visualização e testes

---

## 💾 Estrutura de Tabela (exemplo)

A tabela `bem` armazena dados de bens segurados:

```sql
CREATE TABLE `bem` (
  `id_bem` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50),
  `valor_estimado` DECIMAL(9,2),
  `rua` VARCHAR(50),
  `bairro` VARCHAR(50),
  `cep` CHAR(8),
  `cidade` VARCHAR(50),
```
🎯 Objetivo

Este projeto simula um sistema de cadastro de seguros, com foco em boas práticas de modelagem de banco de dados relacional. É parte dos meus estudos em modelagem de dados, com aplicação prática no MySQL.
  PRIMARY KEY (`id_bem`)
);
