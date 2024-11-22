
 local scene = composer.newScene()

 function scene:create( event )
   local cenaCreditos = self.view
  
   local fundo1 = display.newImageRect(cenaCreditos,"Recursos/Imagens/sea_background.png",2500,2500)
   fundo1.x = x*0.5
   fundo1.y = y*0.5
  local fundo2 = display.newImageRect(  cenaCreditos,"Recursos/Imagens/farground.png", 1400,910)
  fundo2.x = x*0.65
  fundo2.y = x*1.75
   local fundo3 = display.newImageRect(cenaCreditos,"Recursos/Imagens/mid_background.png",1400,910)
   fundo3.x = x*0.65
   fundo3.y = y*0.81
   local fundo4 = display.newImageRect(cenaCreditos,"Recursos/Imagens/foreground.png",1400,910)
   fundo4.x = x*0.65
   fundo4.y = y*0.81

   local cima = display.newRect(cenaCreditos,x*0.1, y*0.14, x*1.8, y*0.1)
      cima:setFillColor(0,0.52,0.63)

   local forma = display.newImageRect(cenaCreditos,"Recursos/Imagens/bubble.png", x*0.78, y*0.4)
   forma.x = x*0.5
   forma.y= y*0.5


   local nome1 = display.newText(cenaCreditos, "Rafael Nunes", x*0.7, y*0.8, fontePrincipal, 50)
   nome1:setFillColor(0,0.5,0.7)

   local nome2 = display.newText(cenaCreditos, "Isabela Rodrigues", x*0.63, y*0.75, fontePrincipal, 50)
   nome2:setFillColor(0,0.5,0.7)

   local nome2 = display.newText(cenaCreditos, "Josiane Soares", x*0.2, y*0.2, fontePrincipal, 50)
   nome2:setFillColor(0,0.52,0.63)

   local nome3 = display.newText(cenaCreditos, "Juan Isaac", x*0.8, y*0.2, fontePrincipal, 50)
   nome3:setFillColor(0,0.52,0.63)

  local credito = display.newText(cenaCreditos,"CRÉDITOS", x*0.5, y*0.14, fontePrincipal, 80 )
  credito:setFillColor(0,0.4,0.5)

  local bolha = display.newImageRect( cenaCreditos, "Recursos/Imagens/bubble.png", x*0.27,y*0.1)
  bolha.x = x*0.18
  bolha.y= y*0.45

  local bolha = display.newImageRect( cenaCreditos, "Recursos/Imagens/bubble.png", x*0.09,y*0.035)
  bolha.x = x*0.77
  bolha.y= y*0.33

  local bolha = display.newImageRect( cenaCreditos, "Recursos/Imagens/bubble.png", x*0.15,y*0.055)
  bolha.x = x*0.9
  bolha.y= y*0.55
  
  local bolha = display.newImageRect( cenaCreditos, "Recursos/Imagens/bubble.png", x*0.15,y*0.055)

  bolha.x = x*0.3
  bolha.y= y*0.65


   botao1= display.newRoundedRect( cenaCreditos, x*0.1, y*0.95, 250, 100, 30 )
   botao1:setFillColor(0,0.52,0.63)
    voltar = display.newText( cenaCreditos, "VOLTAR",x*0.1,y*0.95,fontePrincipal,50 )
   voltar:setFillColor(0,0.15,0.2)



   function voltarCena()
   composer.gotoScene("cenas.menu", {time=500, effect="crossFade"})
   audio.play( audioTransicao )
   end
   voltar:addEventListener("tap", voltarCena)
   botao1:addEventListener("tap", voltarCena)



 end
 scene:addEventListener( "create", scene )
 return scene