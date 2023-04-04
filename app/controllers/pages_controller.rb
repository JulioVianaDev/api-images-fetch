class PagesController < ApplicationController
  def home
    render json: {
      message: "Bem vindos a minha api, esta api tem o intuito de treinar imagens e fetchs",
      tutorial:{
        t1: "Até o momento nós temos 2 endpoins,um voltado a uma unica imagem no form, e outro para multiplas imagens",
        t2: {
          subMessage:"O endpoint de uma unica imagem está no /posts, este controlador tem as seguintes rotas:",
          rota1: "/posts",
          rota1Message: "Neste controlador nós vizualizamos todos os posts caso dermos GET",
          rota2: "/posts/:id",
          rota2Message: "Já nesta rota nós mostramos os atributos unicos de cada post passando o id",
          rota3: "/posts",
          rota3Message: "Utilizando o método POST nós conseguimos cadastrar um json com os seguintes parametros:",
          rota3Parameters: {
            image: '<imagem>',
            title: 'String'
          },
          rota4: "/latest",
          rota4Message: "Nesta rota nós podemos usar apenas o GET e mostra o ultimo post criado"
        },
        t3:{
          subMessage: "Agora o endpoint para multi imagens,estava sem criatividade e nomeei como Frames",
          rota1: "/frames",
          rota1Message: "Neste controlador nós vizualizamos todos os frames caso dermos GET",
          rota2: "/frames/:id",
          rota2Message: "Conseguimos visualizar todas as imagens com um Parser",
          rota3: "/frames",
          rota3Message: "Com o método POST só aceitamos no momento o seguinte atributo: ",
          rota3Parameters:{
            images: "lista com as imagens",
          }
        }
      },
      links:{
        subMessage: "Aqui deixo separado alguns links uteis para poderem vizualizar o projeto: ",
        github:{
          api: "https://github.com/JulioVianaDev/api-images-fetch",
          jsVanilla: "https://github.com/JulioVianaDev/uploader-image-vanilla-js"
        }
      }
    
    }
  end
end
