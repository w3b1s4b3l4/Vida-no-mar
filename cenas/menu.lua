
 local scene = composer.newScene()

 function scene:create( event )
   local cenaMenu = self.view

     audio.play((audioMusica1), {channel = 15}, {loops = -1})

   local fundo1 = display.newImageRect(cenaMenu,"Recursos/Imagens/sea_background.png",2500,2500)
      fundo1.x = x*0.5
      fundo1.y = y*0.5
     local fundo2 = display.newImageRect(  cenaMenu,"Recursos/Imagens/farground.png", 1400,910)
     fundo2.x = x*0.65
     fundo2.y = x*1.75
      local fundo3 = display.newImageRect(cenaMenu,"Recursos/Imagens/mid_background.png",1400,910)
      fundo3.x = x*0.65
      fundo3.y = y*0.81
      local fundo4 = display.newImageRect(cenaMenu,"Recursos/Imagens/foreground.png",1400,910)
      fundo4.x = x*0.65
      fundo4.y = y*0.81

      local cima = display.newRect(cenaMenu,x*0.1, y*0.14, x*1.8, y*0.1)
      cima:setFillColor(0,0.52,0.63)
      local placa = display.newRoundedRect(cenaMenu,x*0.5, y*0.4, x*0.3, y*0.05, 50)
      placa:setFillColor(0,0.5,0.7,0.4)
      local placa = display.newRoundedRect(cenaMenu,x*0.5, y*0.3, x*0.4, y*0.05, 50)
      placa:setFillColor(0,0.5,0.7,0.4)
      local placa = display.newRoundedRect(cenaMenu,x*0.5, y*0.6, x*0.4, y*0.05, 50)
      placa:setFillColor(0,0.5,0.7,0.4)
      local placa = display.newRoundedRect(cenaMenu,x*0.5, y*0.5, x*0.3, y*0.05, 50)
      placa:setFillColor(0,0.5,0.7,0.4)

   local titulo = display.newText(cenaMenu, "MENU", x*0.5, y*0.14, fontePrincipal, 80)
   titulo:setFillColor(0,0.4,0.5)
  
   local textoJogar = display.newText(cenaMenu, "JOGAR", x*0.5, y*0.4, fontePrincipal, 70)
   textoJogar:setFillColor(0,0.5,0.7)
  
   local textoRecordes = display.newText(cenaMenu, "RECORDES", x*0.5, y*0.3, fontePrincipal, 70)
   textoRecordes:setFillColor(0,0.5,0.6)
  
   local textoCreditos = display.newText(cenaMenu, "CRÉDITOS", x*0.5, y*0.6,fontePrincipal, 70)
   textoCreditos:setFillColor(0,0.5,0.7)
  
   local textoSair = display.newText(cenaMenu, "SAIR", x*0.5, y*0.5,fontePrincipal, 70)         
   textoSair:setFillColor(0,0.5,0.6)
  
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
      -- audio.setVolume (0, {audioMusica1})  
     audio.play( audioTransicao)  
      -- audio.play(audioMusica2)
   
  composer.gotoScene("cenas.jogo", efeitoCena2)

 end
 end
 textoJogar:addEventListener("touch", jogar)

  function recordes(event)
  if event.phase == "began" then
    audio.play(audioTransicao)  
audio.play( audioTransicao)  
  composer.gotoScene("cenas.recordes", efeitoCena2)
  end
  end
  textoRecordes:addEventListener("touch", recordes)

  function creditos(event)
  if event.phase == "began" then   
  audio.play( audioTransicao)  
       composer.gotoScene("cenas.creditos", efeitoCena2)
    end
  end
  textoCreditos:addEventListener("touch", creditos)

  function sair(event)
  if event.phase == "began" then
    audio.play( audioTransicao)  
  composer.gotoScene("cenas.sair", efeitoCena2)
  end
  end
  textoSair:addEventListener("touch", sair)






 end
 scene:addEventListener( "create", scene )
 return scene