
local scene = composer.newScene()

function scene:create( event )
  local cenaMenu = self.view
  
 
  -- 0.3 é o volume
  -- -1 significa vezes infinitas
 -- o maximo é 1
 -- solar2d possui 32 canais de audio, geralmente não é preciso especificar, eles tocam no aleatório, mas é um limite de áudios simultâneos
 -- a menos que
 -- só é possivel diminuir o som dos canais, nao dos sons/musicas especificos

  local fundo = display.newImageRect( cenaMenu, "Recursos/imagens/background-night.png", x, y)
  fundo.x = x*0.5
  fundo.y = y*0.5
  
  local plataforma = display.newRect( x*0.5, y*0.1, 1100, 600 )
  plataforma: setFillColor(0.1,0.1,0.4,0.1)

  local titulo = display.newText(cenaMenu, "MENU", x*0.5, y*0.14, fontePrincipal, 90)
  
  local textoJogar = display.newText(cenaMenu, "JOGAR", x*0.5, y*0.4, fontePrincipal, 70)
  
  local textoRecordes = display.newText(cenaMenu, "RECORDES", x*0.5, y*0.3, fontePrincipal, 70)
  
  local textoCreditos = display.newText(cenaMenu, "CRÉDITOS", x*0.5, y*0.6,fontePrincipal, 70)
  
  local textoSair = display.newText(cenaMenu, "SAIR", x*0.5, y*0.5,fontePrincipal, 70)         
  
  local efeitoCena = {
time = 900,  
effect = "slideLeft"
}

local efeitoCena2 = {
  time = 500,
  effect = "crossFade"
 }

function jogar(event)
 if event.phase == "began" then  
  audio.play( audioTransicao )     
 composer.gotoScene("cenas.jogo", efeitoCena2)

end
end
textoJogar:addEventListener("touch", jogar)

function recordes(event)
if event.phase == "began" then 
  audio.play( audioTransicao )      
composer.gotoScene("cenas.recordes", efeitoCena)
end
end
textoRecordes:addEventListener("touch", recordes)

function creditos(event)
if event.phase == "began" then   
  audio.play( audioTransicao )    
     composer.gotoScene("cenas.creditos", efeitoCena)
  end
end
textoCreditos:addEventListener("touch", creditos)

function sair(event)
if event.phase == "began" then
  audio.play( audioTransicao )
composer.gotoScene("cenas.sair", efeitoCena)
end
end
textoSair:addEventListener("touch", sair)






end
scene:addEventListener( "create", scene )
return scene