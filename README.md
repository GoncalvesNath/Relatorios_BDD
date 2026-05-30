# 🗄️ Banco de Dados — Ciência da Computação | UNIP

Repositório com os relatórios práticos desenvolvidos nas aulas de Banco de Dados do curso de Ciência da Computação. Os scripts cobrem desde a introdução aos conceitos fundamentais até consultas avançadas e criação de views, utilizando dois projetos fictícios como base de estudo: **Adoção Pet** (Relatório 1) e **Bella Napoli** (sistema de pizzaria, Relatórios 3 ao 6).

---

## 📄 Relatórios

### Relatório 1 — Introdução e Fundamentação
Primeiro contato com banco de dados relacional. Projeto **Adoção Pet** como contexto introdutório.

**Conceitos abordados:** estrutura de tabelas, tipos de dados, chaves primárias e estrangeiras, criação de banco de dados

- Definição e propósito de um banco de dados relacional
- Criação de tabelas com `CREATE TABLE`
- Tipos de dados básicos (`INT`, `VARCHAR`, `DATE`, `DECIMAL`)
- Restrições com `NOT NULL`, `PRIMARY KEY` e `FOREIGN KEY`
- Relacionamento entre entidades do domínio de adoção de animais

---

### Relatório 2 — Modelagem Relacional
Criação de tabelas com diferentes tipos de relacionamento usando `PRIMARY KEY` e `FOREIGN KEY`.

| Conceito | Tabelas |
|---|---|
| 1:N (uma editora publica vários livros) | `EDITORA`, `LIVRO` |
| N:N (um livro pode ter vários autores) | `AUTOR`, `LIVRO_AUTOR` |
| 1:1 (cada livro tem um único detalhe) | `DETALHES_LIVRO` |
| Ampliação (sistema de pedidos) | `CLIENTE`, `PEDIDO`, `ITEM_PEDIDO` |

---

### Relatório 3 — Manipulação de Dados
Operações de escrita e manutenção do banco com o projeto Bella Napoli.

**Comandos abordados:** `INSERT`, `UPDATE`, `DELETE`

- Inserção de pizzas, clientes e pedidos
- Reajuste percentual de preços com expressão matemática (`preco * 1.10`)
- Atualização de registro específico com `WHERE`
- Exclusão de pedidos por status (`DELETE ... WHERE status = 'CANCELADO'`)
- Atualização simultânea de nome e preço em um único `UPDATE`

---

### Relatório 4 — Consultas e Operadores Lógicos
Consultas com filtragem e combinação de condições.

**Comandos abordados:** `SELECT`, `>`, `AND`, `OR`, `<>`

- Filtro por valor numérico com operador relacional (`preco > 50`)
- Combinação de condições com `AND` (interseção)
- Alternância de condições com `OR` (união)
- Exclusão de status com operador diferente (`status <> 'FINALIZADO'`)

---

### Relatório 5 — Filtros Avançados
Consultas com operadores de padrão, faixa e lista.

**Comandos abordados:** `LIKE`, `BETWEEN`, `IN`, `IS NULL`, `EXISTS`, `UPDATE` com `IN`, `DELETE` com `LIKE`

- Busca por padrão de texto (`nome LIKE '%Frango%'`)
- Filtro de intervalo numérico (`preco BETWEEN 40.00 AND 60.00`)
- Seleção por lista de valores (`endereco IN ('Centro', 'Sudoeste', 'Jardins')`)
- Verificação de nulos (`data_entrega IS NULL`)
- Subconsulta de existência (`EXISTS`)
- Reajuste seletivo por categoria e exclusão de registros de teste

---

### Relatório 6 — Views
Criação de visões para abstração e segurança de dados.

**Comandos abordados:** `CREATE VIEW`, `CREATE OR REPLACE VIEW`, `JOIN`

| View | Descrição |
|---|---|
| `vw_cardapio_economico` | Pizzas com preço abaixo de R$ 50,00 |
| `vw_clientes_contato` | Nome e telefone dos clientes (endereço oculto) |
| `vw_pedidos_pendentes` | JOIN entre cliente, pizza e pedido — excluindo finalizados e cancelados |
| `vw_faturamento` | Preço original e preço com taxa de entrega (+10%) calculado |

A view `vw_pedidos_pendentes` é atualizada com `OR REPLACE` para adicionar a coluna de data do pedido.

---

## 🛠️ Tecnologia

- **SQL** — linguagem principal
- Compatível com **MySQL / MariaDB** (sintaxe `OR REPLACE`)
- Relatórios 3 e 4 originalmente desenvolvidos para **SQL Server**

---

## 🎓 Sobre

Desenvolvido por **Nathalia Gonçlaves** durante o curso de Ciência da Computação na **UNIP**.
