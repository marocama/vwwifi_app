# App: VW Wi-Fi 

Aplicação Flutter para gerenciamento de transmissores VW Soluções.

# Guia
    > Ao iniciar o app, será exibido uma lista de transmissores já cadastrados
      ou se não houver nenhum, um formulário para cadastro
    
    > Para cadastrar, é necessário informar alguns itens como número serial da placa, identificador 
      e se a comunicação será localmente ou remotamente

    > Ao selecionar um transmissor cadastrado, é possível enviar ou ler dados

    > Quando for enviar, é possível enviar uma string com quaisquer argumentos,
      criar botões definindo sua string ou importar botões pré definidos 

    > Quando for ler, é possível visualizar a resposta bruta, ou importar uma estilização pré definida

# Proximos passos
    > Recuperação de senha em alertdialog
    > Lista de transmissores puxando do firebase

# Telas
    [ ] Splash
    [X] Login
    [X] Cadastro
    [X] Lista de Transmissores 
    [X] Novo Transmissor 
    [X] Editar Transmissor
    [X] Apagar Transmissor
    [X] Visualizar Transmissor
    [X] Enviar Comando
    [X] Perfil 

# Cadastro de transmissor
    > ID
    > Número Serial
    > Identificador
    * Localização
    > Permissão (ativo ou expirado) 
    > ID do proprietário
    > Interface e Máscara de leitura
    > Interface e Máscara de envio
    > Timestamp da criação

# APIs
    > Gravar novo transmissor
    > Editar transmissor
    > Apagar transmissor
    > Consultar dados armazenados
    > Enviar dados para o transmissor

# Tabelas
    > Transmissor
        > Identificador
        > Número Serial
        > Identificador do proprietário

    > Proprietário
        > Identificador
        > Nome

# Protocolo Transmissor
   
## Envio de dados para nuvem
```
  {
    "numero serial": "1234AA",
    "timestamp": "2020-
    "quantidade de entradas": 2,
    "quantidade de saidas": 3,
    "entradas": {
      "e1": 0,
      "e2": 1
    }
    "saidas": {
      "s1": 1,
      "s2": 1,
      "s3": 0
    }
    "outros": {
      {
        "a1": 742,
        "symbol": ""
      }
      {
        "temp": 28,
        "symbol": "°C"
      }
      "nome": "valor",
      "nome": "valor"
    }
  }
```
## Envio de comandos online
```
    {
      "numero serial": "1234AA",
      "comando aplicativo": codigo (estabelecido de acordo com a placa),
    }
```
```
    {
      "numero serial": "1234AA",
      "comando plataforma": codigo (estabelecido de acordo com a placa),
    }
```
```
    {
      "numero serial": "1234AA",
      "horario": "07/05/20 23:08",
    }
```

# Ferramentas
    > Rotina de empacotamento de informações no protocolo definido, passando por parametro os valores especiais como analogica
    > Rotina padrão para as principais placas para implementação a cada X tempo, onde:
       > A rotina varreza as entradas, saídas e analógica e enviará tais informações pela serial, seguindo o protocolo padrão de comunicação
          > Inicialmente rotina pública para CLP PIC 40, CLP PIC 28
          > Rotina interna para CLP Touch
    > Rotina pública para solicitação do horário atual para o transmissor

# Avaliar
    > Ferramentas presentas na plataforma VW IoT:
        > Recurso de Operadores
        > Meios de Contato

https://medium.com/@agungsurya/create-a-simple-animated-floatingactionbutton-in-flutter-2d24f37cfbcc

https://medium.com/@anilcan/forms-in-flutter-6e1364eafdb5

https://github.com/flutter/samples/blob/master/provider_shopper/lib/screens/login.dart