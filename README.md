# 📊 Projeto de Dados – Olist | Analytics Engineering

[![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)](https://www.getdbt.com/)
[![DuckDB](https://img.shields.io/badge/DuckDB-FFF000?style=for-the-badge&logo=duckdb&logoColor=black)](https://duckdb.org/)
[![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)

Projeto desenvolvido no contexto do **DDFTEC 012026 – Dadosfera**, com foco em **Analytics Engineering**, cobrindo todo o fluxo de dados desde a camada RAW até a visualização final em dashboards no Power BI.

O objetivo é construir um **pipeline analítico moderno**, utilizando boas práticas de modelagem dimensional, testes de qualidade de dados e visualização orientada a negócio.

---

## 🎯 Objetivo do Projeto

Desenvolver uma solução completa de Analytics Engineering que transforme dados brutos do e-commerce Olist em insights acionáveis através de:

- Modelagem dimensional para análise de vendas
- Pipeline de transformação escalável e testável
- Dashboards interativos para tomada de decisão

---

## 🧠 Visão Geral da Arquitetura

```text
┌─────────────────┐
│   CSV (RAW)     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  DuckDB (RAW)   │
└────────┬────────┘
         │
         ▼
┌───────────────────────────────────────────┐
│              dbt Core                     │
│  ┌──────────┐  ┌────────────┐  ┌───────┐  │
│  │ staging  │→ │intermediate│→ │ marts │  │
│  └──────────┘  └────────────┘  └───────┘  │
└────────┬──────────────────────────────────┘
         │
         ▼
┌─────────────────┐
│ DuckDB (marts)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Power BI      │
│  (dashboards)   │
└─────────────────┘
```

---

## 🛠️ Stack Utilizada

| Ferramenta | Função |
|------------|--------|
| **DuckDB** | Banco de dados analítico local de alta performance |
| **dbt Core** | Transformações, testes e modelagem dimensional |
| **Python** | Análise exploratória e Data Quality |
| **Power BI** | Visualização e dashboards interativos |
| **WSL** | Ambiente de desenvolvimento Linux on Windows |

---

## 📁 Estrutura do Projeto

```
MATEUS_WILAMIL_DDFTEC_012026/
│
├── 📂 dadosfera_olist/             # Projeto dbt principal
│   ├── analyses/                   # Análises ad-hoc
│   ├── logs/                       # Logs de execução do dbt
│   ├── macros/                     # Macros dbt personalizadas
│   │
│   ├── 📂 models/
│   │   ├── 📂 01_staging/
│   │   │   ├── stg_customers.sql
│   │   │   ├── stg_customers.yml
│   │   │   ├── stg_geolocation.sql
│   │   │   ├── stg_geolocation.yml
│   │   │   ├── stg_order_items.sql
│   │   │   ├── stg_order_items.yml
│   │   │   ├── stg_order_payments.sql
│   │   │   ├── stg_order_payments.yml
│   │   │   ├── stg_orders.sql
│   │   │   ├── stg_orders.yml
│   │   │   ├── stg_product_descriptions.sql
│   │   │   ├── stg_product_descriptions.yml
│   │   │   ├── stg_products.sql
│   │   │   └── stg_products.yml
│   │   │
│   │   ├── 📂 02_intermediate/
│   │   │   ├── int_order_items.sql
│   │   │   ├── int_order_items.yml
│   │   │   ├── int_order_payments.sql
│   │   │   ├── int_order_payments.yml
│   │   │   ├── int_orders.sql
│   │   │   ├── int_orders.yml
│   │   │   ├── int_products.sql
│   │   │   └── int_products.yml
│   │   │
│   │   ├── 📂 03_marts/
│   │   │   ├── dim_customers.sql
│   │   │   ├── dim_customers.yml
│   │   │   ├── dim_dates.sql
│   │   │   ├── dim_dates.yml
│   │   │   ├── dim_products.sql
│   │   │   ├── dim_products.yml
│   │   │   ├── fct_sales.sql
│   │   │   └── fct_sales.yml
│   │   │
│   │   └── source.yml              # Definição das fontes de dados
│   │
│   ├── seeds/                      # Dados estáticos (CSVs para seed)
│   ├── snapshots/                  # Snapshots para SCD
│   ├── target/                     # Artefatos compilados do dbt
│   ├── tests/                      # Testes customizados do dbt
│   │
│   ├── .gitignore
│   ├── dbt_project.yml             # Configuração principal do dbt
│   └── README.md
│
├── 📂 data/
│   ├── 📂 data_app/
│   │   └── streamlit_app.py        # Aplicação Streamlit
│   │
│   ├── 📂 duckdb/
│   │   └── olist.duckdb            # Banco de dados DuckDB
│   │
│   └── 📂 raw/                     # Dados brutos CSV
│       ├── olist_customers.csv
│       ├── olist_geolocation.csv
│       ├── olist_order_items.csv
│       ├── olist_order_payments.csv
│       ├── olist_orders.csv
│       ├── olist_products.csv
│       └── product_descriptions.csv
│
├── 📂 diagrams/
│   ├── docs/                       # Documentação visual
│   └── screenshots/                # Screenshots do projeto
│
├── 📂 logs/                        # Logs gerais do projeto
│
├── 📂 notebooks/                   # Jupyter Notebooks
│   ├── data_quality_olist_products.ipynb
│   ├── data_quality_product_descriptions.ipynb
│   ├── generate_product_descriptions.ipynb
│   └── load_raw_olist.ipynb
│
├── 📂 venv/                        # Ambiente virtual Python
│
└── README.md                       # Documentação principal
```

---

## 🗂️ Camadas de Dados

### 🔹 RAW

Camada de ingestão dos dados brutos:

- Dados originais do Olist em formato CSV
- Carregados no DuckDB sem transformações
- Preserva a estrutura original para auditoria

### 🔹 Staging (`01_staging`)

Camada de padronização:

**Responsabilidades:**
- ✅ Padronização de nomes de colunas
- ✅ Casting de tipos de dados
- ✅ Seleção de colunas relevantes
- ❌ Nenhuma regra de negócio aplicada

**Modelos exemplo:**
- `stg_customers`
- `stg_orders`
- `stg_products`
- `stg_order_items`
- `stg_payments`

### 🔹 Intermediate (`02_intermediate`)

Camada de transformações de negócio:

**Responsabilidades:**
- Aplicação de regras de negócio
- Agregações intermediárias
- Cálculos derivados
- Junções de tabelas relacionadas

**Exemplos de transformações:**
- Total de pagamento por pedido
- Consolidação de itens por `order_id`
- Cálculo de métricas de fulfillment

### 🔹 Marts (`03_marts`)

Camada de consumo - Modelo dimensional:

**Dimensões:**
- `dim_customers` - Clientes e localização
- `dim_products` - Produtos e categorias
- `dim_dates` - Calendário para análises temporais

**Fato:**
- `fct_sales` - Fato de vendas com métricas agregadas

> 💡 **Estrutura pensada para**: performance, simplicidade e consumo analítico direto no Power BI

---

## ✅ Qualidade de Dados

A análise de qualidade foi realizada via **Jupyter Notebooks**, incluindo:

- 🔍 Verificação de valores nulos
- 📊 Distribuição de dados
- ⚠️ Identificação de outliers
- 🔢 Análise de cardinalidade
- 🔗 Consistência entre tabelas relacionadas

### 📓 Notebooks disponíveis:

1. `data_quality_olist_products.ipynb`
2. `data_quality_product_descriptions.ipynb`

---

## 🧪 Testes com dbt

Testes implementados para garantir integridade dos dados:

| Tipo de Teste | Descrição |
|---------------|-----------|
| `not_null` | Valida campos obrigatórios |
| `unique` | Garante unicidade de chaves primárias |

### Executar testes:

```bash
dbt test
```

### Visualizar resultados:

```bash
dbt test --store-failures
```

---

## 📈 Dashboards (Power BI)

Dashboard construído utilizando a **camada marts**, com foco em análise de vendas e performance do e-commerce.

### 📊 KPIs Principais

| KPI | Descrição |
|-----|-----------|
| 💰 **Total Revenue** | Receita total do período |
| 🧾 **Total Orders** | Quantidade de pedidos realizados |
| 👥 **Active Customers** | Clientes únicos ativos |
| 🛒 **Average Ticket** | Ticket médio por pedido |

### 📉 Visualizações

- 📈 Receita ao longo do tempo (série temporal)
- 🏷️ Receita por categoria de produto
- 🗺️ Mapa geográfico de receita por estado
- 📊 Top produtos mais vendidos

### 🎛️ Filtros Disponíveis

- 📅 Ano
- 📆 Mês
- 🏷️ Categoria de produto
- 📍 Estado

> **📌 Observação:** As tabelas da camada marts foram exportadas para CSV para facilitar a conexão com o Power BI, evitando problemas de lock no DuckDB durante desenvolvimento.

---

## 🚀 Como Executar o Projeto

### 1️⃣ Clonar o repositório

```bash
git clone https://github.com/seu-usuario/dadosfera_olist.git
cd dadosfera_olist
```

### 2️⃣ Criar e ativar ambiente virtual

```bash
python -m venv venv
source venv/bin/activate  # Linux/WSL
# ou
venv\Scripts\activate     # Windows
```

### 3️⃣ Instalar dependências

```bash
pip install -r requirements.txt
```

### 4️⃣ Executar transformações dbt

```bash
# Rodar todos os modelos
dbt run

# Rodar apenas staging
dbt run --select staging

# Rodar apenas marts
dbt run --select marts
```

### 5️⃣ Executar testes

```bash
dbt test
```

### 6️⃣ Gerar documentação

```bash
dbt docs generate
dbt docs serve
```

### 7️⃣ Conectar no Power BI

**Opção 1: Via CSV (Recomendado)**
- Usar CSVs exportados da camada marts em `data/marts/`

**Opção 2: Conexão direta ao DuckDB**
- Conectar ao arquivo `.duckdb` (atenção para locks durante desenvolvimento)

---

## 👤 Autor

**Mateus Wilamil**  
*Analytics / Data Engineering*

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mateus-wilamil-39980613b/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/mateuswilamil)

---
