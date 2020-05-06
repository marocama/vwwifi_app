# App: VW Wi-Fi 

Aplicação Flutter para gerenciamento de transmissores VW Soluções.

# Guia
    > Ao iniciar o app, será exibido uma lista de transmissores já cadastrados
      ou se não houver nenhum, um formulário para cadastro
    
    > Para cadastrar, é necessário informar alguns itens como número serial da placa, identificador 
      e se a comunicação será localmente ou remotamente

    > Ao selecionar um transmissor cadastrado, é possível enviar ou ler dados

    > Quando for enviar, é possível enviar uma string como quaisquer argumentos,
      criar botões definindo sua string ou importar botões pré definidos 

    > Quando for ler, é possível visualizar a resposta bruta, ou importar uma estilização pré definida

# Cadastro de transmissor
    > ID
    > Número Serial
    > Identificador
    > Localização
    > Permissão 
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

# Widgets para implementar
    > SafeArea
    > Expanded (Lista de transmissores)
    > Wrap (Ao inves de Row, pela quebra de linha automatica)
    > FutureBuilder (Para requisições http)
    > SliverAppBar(Gerenciar melhor barra do topo)
    > ClipRReact(Arredondar cantos de outros widgets)
    > Hero (Animar objetos que vao para outra tela)
    > Tooltip (Acessibilidade em icones e imagens)
    > FittedBox (Fazer caber um widget dentro de outro)
    > Align (alinhar um widget)
    > Positioned (alinhar em cima de um stack)
    > Dismissible (animar e dar opcoes nas laterais de um item de uma lista)
    > SizedBox (bom para definir espaços entre widgets)
    > ValueListenableBuilder (gerenciar os mesmos dados em varios widgets)
    > Draggable (arrastar widgets)

    > Stack (verificar pra que serve)