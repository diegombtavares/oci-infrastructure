# OCI Infrastructure

## Como Rodar o Projeto com Terraform

Este projeto utiliza o Terraform para gerenciar recursos de infraestrutura na oracle. Siga estas instruções para configurar e executar o projeto em sua própria infraestrutura.

### Pré-requisitos

- **Terraform**: Certifique-se de ter o Terraform instalado em sua máquina. Você pode realizar a instalação da seguinte.

### Configuração do Projeto

1. Clone este repositório em sua máquina local:

    ```bash
    git clone <repositorie>
    ```

2. Navegue até o diretório do projeto:

    ```bash
    cd oci-insfrastructure
    ```

3. Crie um arquivo `terraform.tfvars` e defina as variáveis necessárias. 

    ```bash
    compartment_id = "<ID>"
    source_id = "<ID>"
    subnet_id = "<ID>"
    tenancy_ocid = "<ID>"
    user_ocid = "<ID>"
    fingerprint = "<ID>" 
    ```
### Executando o Terraform

1. Inicialize o diretório do Terraform:

    ```bash
    terraform -chdir=modules/compute init 
    ```

2. Visualize as alterações que serão feitas:

    ```bash
    terraform -chdir=modules/compute plan -var="subdomain=tfmachine" -var="domain=gosac.com.br"
    ```

3. Aplique as alterações para criar os recursos na nuvem:

    ```bash
    terraform -chdir=modules/compute apply -var="subdomain=tfmachine" -var="domain=gosac.com.br"
    ```

4. Confirme a aplicação digitando `yes` quando solicitado.

### Limpeza

Se desejar remover os recursos criados pela execução do Terraform, você pode executar:

```bash
terraform destroy