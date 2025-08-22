# 🧩 Modelagem de Banco de Dados 

Este repositório contém um projeto completo de modelagem de banco de dados desenvolvido com foco em um sistema de seguros, incluindo:

- Modelagem Conceitual e Lógica com **brModelo**
- Scripts SQL para criação da base de dados
- Arquivos auxiliares para instalação e configuração do ambiente

---

## 🗃️ Arquivos do Projeto

| Arquivo                               | Descrição                                                         |
|--------------------------------------|-------------------------------------------------------------------|
| `Conceitual_1.brM3`                  | Diagrama conceitual inicial criado com o brModelo                 |
| `ModelagemConceitual_2.brM3`         | Versão refinada do modelo conceitual                              |
| `Lógico_1.brM3`                      | Modelo lógico do banco                                            |
| `ModelagemLogica_SISSEGURO.brM3`     | Versão final do modelo lógico                                     |
| `projeto_seguro_backup.sql`         | Script SQL para criação da estrutura do banco de dados no MySQL   |
| `MBD - Aula 01 - Introdução ao MBD.docx` | Material teórico de apoio à modelagem                         |
| `brModelo.jar`                       | Executável do brModelo (versão em Java)                           |
| `mysql-8.4.6-winx64.msi`             | Instalador do MySQL para Windows                                  |
| `OneDrive_1_20-08-2025.zip`          | Backup dos arquivos do projeto (opcional)                         |
| `.gitattributes`                     | Configuração de LFS (Large File Storage) para arquivos grandes    |

---

## 🛠️ Tecnologias Utilizadas

- **brModelo (.jar)** – Ferramenta para criação dos modelos conceitual e lógico
- **MySQL** – Banco de dados relacional para execução dos scripts
- **Workbench ou DBeaver** – Ferramentas de gerenciamento e visualização do banco
- **Git LFS** – Utilizado para versionamento de arquivos grandes (.jar, .zip, .msi)

---

## 💾 Exemplo de Estrutura de Tabela

Exemplo de criação da tabela `bem`:

```sql
CREATE TABLE `bem` (
  `id_bem` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50),
  `valor_estimado` DECIMAL(9,2),
  `rua` VARCHAR(50),
  `bairro` VARCHAR(50),
  `cep` CHAR(8),
  `cidade` VARCHAR(50),
  PRIMARY KEY (`id_bem`)
);
