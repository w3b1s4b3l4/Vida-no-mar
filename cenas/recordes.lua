
 local scene = composer.newScene()

 function scene:create( event )
   local cenaRecordes = self.view

   local fundo1 = display.newImageRect(cenaRecordes,"Recursos/Imagens/sea_background.png",2500,2500)
   fundo1.x = x*0.5
   fundo1.y = y*0.5
  local fundo2 = display.newImageRect(  cenaRecordes,"Recursos/Imagens/farground.png", 1400,910)
  fundo2.x = x*0.65
  fundo2.y = x*1.75
   local fundo3 = display.newImageRect(cenaRecordes,"Recursos/Imagens/mid_background.png",1400,910)
   fundo3.x = x*0.65
   fundo3.y = y*0.81
   local fundo4 = display.newImageRect(cenaRecordes,"Recursos/Imagens/foreground.png",1400,910)
   fundo4.x = x*0.65
   fundo4.y = y*0.81

    local cima = display.newRect(cenaRecordes,x*0.1, y*0.14, x*1.8, y*0.1)
    cima:setFillColor(0,0.52,0.63)

    local enunciado = display.newText(cenaRecordes, "RECORDES", x*0.5, y*0.14, fontePrincipal, 80 )
    enunciado:setFillColor(0,0.4,0.5)

    botao1= display.newRoundedRect( cenaRecordes, x*0.1, y*0.95, 250, 100, 30 )
    botao1:setFillColor(0,0.52,0.63)
     voltar = display.newText( cenaRecordes, "VOLTAR",x*0.1,y*0.95,fontePrincipal,50 )
    voltar:setFillColor(0,0.15,0.2)
 
 
 
    function voltarCena()
    composer.gotoScene("cenas.menu", {time=500, effect="crossFade"})
    audio.play( audioTransicao )
    end
    voltar:addEventListener("tap", voltarCena)
    botao1:addEventListener("tap", voltarCena)



    local json = require ('json')
    local pontuacao = {}
 
    local pathFile = system.pathForFile( "recordes.json", system.DocumentsDirectory )

    local function salvarDados()
    
     for i = #pontuacao, 11, -1 do
        table.remove(pontuacao, i)
     end

     local arquivo = io.open (pathFile, 'w')
     arquivo:write(json.encode(pontuacao))
     io.close(arquivo)
   end
  --   salvarDados()

   local function carregarDados()
      local arquivo = io.open(pathFile, 'r')
      if arquivo then 
       local conteudo = arquivo:read('*a')
      io.close(arquivo)
      pontuacao = json.decode( conteudo )
  --    print(pontuacao)
      end
    if pontuacao == nil or #pontuacao == 0 then
       pontuacao = {0,0,0,0,0,0,0,0,0,0}
    end
   end
  carregarDados()
  
  local function inserePontos()
      table.insert( pontuacao, composer.getVariable( "ultimoPonto" ) )
    composer.setVariable( "ultimoPonto", 0 )
  end
  inserePontos()

    local function ordenar (a,b)
     return a > b
    end
    table.sort( pontuacao, ordenar )

    for i=1,10 do
      local texto = i.. ')'..pontuacao[i]
      local distancia = i*150
      local textoRecordes = display.newText(cenaRecordes,texto, x*0.7, y*0.2 + distancia, fontePrincipal, 70 )
      textoRecordes:setFillColor(0,0.5,0.7)
   end


 end
 scene:addEventListener( "create", scene )
 return scene