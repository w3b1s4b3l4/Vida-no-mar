
local scene = composer.newScene()

function scene:create( event )
  local cenaSair = self.view

 local fundo = display.newImageRect(cenaSair, "Recursos/imagens/background-night.png", x, y )
   fundo.x = x*0.5
   fundo.y = y*0.5

 local confirma = display.newText(cenaSair, "Você tem certeza que deseja sair?", x*0.5, y*0.5, fontePrincipal, 50)


  --local sim = display.newText(cenaSair, 'SIM',x*0.4, y*0.56, nil, 70)
  --local nao = display.newText(cenaSair, 'NÃO',x*0.56, y*0.56, nil, 70)

-- botao1 = display.newRoundedRect( x*0.4, y*0.56, nil, 70,70)
 --botao2 = display.newRoundedRect( x*0.56, y*0.56, nil, 70,70)
 --botao1: native.requestExit()
-- botao2: composer.gotoScene('cenas.menu')
  --botao1:addEventListener('tap', botao1 )
  --botao2:addEventListener('tap', botao2 )

--biblioteca de audio
-- audio.loadStream: audios longos de 1min -- carrega aos poucos, ao decorrer do audio, pois consome menos memoria
-- audio.loadSound: audios curtos de no máximo 10 segs -- podem se usados a qualquer momento e sao carregados direto na memoria



end
scene:addEventListener( "create", scene )
return scene