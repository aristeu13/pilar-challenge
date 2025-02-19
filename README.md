# Pilar Challenge

## Tecnologias Usadas
- Python
- FastAPI
- Kubernetes
- Terraform
- Prometheus
- Grafana

## Como Rodar o Projeto
1. Clone o repositório:
    ```bash
    git clone https://github.com/seu-usuario/pilar-challenge.git
    cd pilar-challenge
    ```

2. Crie um ambiente virtual e instale as dependências:
    ```bash
    python -m venv venv
    source venv/bin/activate  # Linux/Mac
    venv\Scripts\activate  # Windows
    pip install -r requirements.txt
    ```

3. Execute a aplicação utilizando o FastAPI:
    ```bash
    fastapi dev
    ```

4. Acesse a aplicação:
    - A aplicação estará disponível em `http://127.0.0.1:8000`.

## Estratégia que Eu Segui
Como o desafio era simples, resolvi adicionar um esforço adicional para ter uma estrutura e arquitetura mais robustas. Abaixo estão as principais decisões e melhorias feitas:

### Infraestrutura e Monitoramento
- **Terraform e Kubernetes**: Utilizei o Terraform para provisionar a infraestrutura e o Kubernetes para gerenciar os containers da aplicação.
- **Grafana e Prometheus**: Subi o Grafana e o Prometheus para monitorar métricas da aplicação. Adicionei algumas métricas básicas para visualizar o desempenho.

### Melhorias Futuras
- **Pipeline de CI/CD**: Melhoraria a questão do gate adicionando o SonarQube para análise de qualidade de código.
- **Segurança**: Adicionaria uma API Gateway para esconder a API de métricas, habilitando um firewall para analisar todos os headers e IPs que estão tentando consumir a API.
- **Autoscaling**: Melhoraria a configuração de autoscaling para garantir alta disponibilidade.
- **Dashboards Adicionais**: Atualmente, fiz apenas um dashboard simples para mostrar que os dados estão sendo gerados corretamente. Pretendo adicionar mais dashboards detalhados.
- **AlertManager**: Adicionaria o AlertManager e definiria alarmes para acompanhar a aplicação.

## Considerações Finais
Embora a estrutura não esteja perfeita, os pontos que trabalhei até agora demonstram um esforço para criar uma base sólida para um projeto escalável e monitorável. Espero que consigam avaliar um pouco das minhas habilidades com esse projeto.
