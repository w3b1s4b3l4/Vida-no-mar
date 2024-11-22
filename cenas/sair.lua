
 local scene = composer.newScene()

 function scene:create( event )
   local cenaSair = self.view

  local fundo = display.newImageRect(cenaSair, "Recursos/Imagens/sea_background.png", x, y )
    fundo.x = x*0.5
    fundo.y = y*0.5

   local forma = display.newRoundedRect(cenaSair,x*0.5, y*0.5, x*0.8, y*0.2, 50)
   forma:setFillColor(0,0.5,0.7,0.5)

  local confirma = display.newText(cenaSair, "Você tem certeza que deseja sair?", x*0.5, y*0.48, fontePrincipal, 45)
  confirma:setFillColor(0,0.4,0.5)

  botao1 = display.newRoundedRect( x*0.4, y*0.52, 160, 70,70)
  botao1:setFillColor(0,0.5,0.7,0.4)
  botao2 = display.newRoundedRect( x*0.56, y*0.52, 160, 70,70)
  botao2:setFillColor(0,0.5,0.7,0.4)
  local Sim = display.newText(cenaSair, 'SIM',x*0.4, y*0.52, fontePrincipal, 40)
  Sim:setFillColor(0,0.4,0.5)
  local Nao = display.newText(cenaSair, 'NÃO',x*0.56, y*0.52, fontePrincipal, 40)
  Nao:setFillColor(0,0.4,0.5)

  local function sair()
    native.requestExit()
    audio.play(audioTransicao)
    end
  botao1:addEventListener('tap', sair )
  Sim:addEventListener('tap', sair )


  local function voltar ()
    composer.gotoScene('cenas.menu')
    audio.play(audioTransicao)
    botao1:setFillColor(0,0,0,0,1)
    botao2:setFillColor(0,0,0,0,1)
  end
  botao2:addEventListener('tap', voltar )
  Nao:addEventListener('tap', voltar )
  
   
   

--biblioteca de audio
-- audio.loadStream: audios longos de 1min -- carrega aos poucos, ao decorrer do audio, pois consome menos memoria
-- audio.loadSound: audios curtos de no máximo 10 segs -- podem se usados a qualquer momento e sao carregados direto na memoria



 end
 scene:addEventListener( "create", scene )
 return scene