# Consulta Marcada

Aplicativo Mobile para o auxílio à unidades de saúde com o gerenciamento de consultas médicas.

O projeto tem como principal objetivo apresentar o CRUD de consultas, entidade essa com a seguinte estrutura:

```json
{
  "id": "ID da consulta",
  "patient_cpf": "CPF do paciente",
  "doctor_crm": "CRM do médico(a)",
  "room_number": "Número da sala",
  "date": "Horário da consulta",
  "arrival_time": "Horário de chegada",
  "status": "Status da consulta"
}
//A consulta pode ter os seguintes status: Não realizada, realizada e em andamento.
```

A consulta depende de outros 3 objetos, são eles:

### Paciente

```json
{
  "cpf": "CPF do paciente",
  "name": "Nome do paciente",
  "genre": "Gênero",
  "date_of_birth": "Data de nascimento",
  "nationality": "Nacionalidade",
  "mother_name": "Nome da mãe",
  "address": "Endereço",
  "is_active": "Status de atividade"
}
```

Obs.: O endereço é um objeto com a seguinte estrutura:

```json
{
  "cep": "CEP",
  "street": "Logradouro",
  "district": "Bairro",
  "city": "Cidade",
  "uf": "Estado"
}
```

[API usada para acessar o endereço do paciente com o CEP](https://viacep.com.br/)

### Médico(a)

```json
{
  "crm": "CRM do médico(a)",
  "name": "Nome do médico(a)",
  "genre": "Gênero",
  "specialty": "Especialidade",
  "is_active": "Status de atividade"
}
```

### Sala

```json
{
  "id": "ID da sala",
  "number": "Número da sala",
  "localization": "Localização da sala",
  "name": "Nome da sala",
  "is_available": "Status de disponibilidade"
}
```

## Features implementadas

- Login com e-mail e senha; `Para fazer login use: E-mail: joao@gmail.com - Senha: 12345678`
- Listagem de Pacientes;
- Cadastro de Pacientes;

## Organização de camadas da aplicação:

1. View
2. Provider
3. Service
4. Data

## Como executar?

- Clone o repositório;
- Entre na pasta do projeto;
- Execute `pub get` para instalar todas as dependências do projeto;
- Inicie um emulador de dispositivo móvel ou conecte seu smartphone no computador (certifique-se que seu aparelho tenha a Depuração USB ativada);
- Execute `flutter run` para executar o aplicativo no seu dispositivo conectado (ou emulado).
- E pronto, o aplicativo estará executando no seu celular.
