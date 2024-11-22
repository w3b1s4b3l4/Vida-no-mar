
 local scene = composer.newScene()

 function scene:create(event)
     local cenaCarregamento = self.view  



     local fundo1 = display.newImageRect(cenaCarregamento,"Recursos/Imagens/sea_background.png",2500,2500)
      fundo1.x = x*0.5
      fundo1.y = y*0.5
     local fundo2 = display.newImageRect(  cenaCarregamento,"Recursos/Imagens/farground.png", 1400,910)
     fundo2.x = x*0.65
     fundo2.y = x*1.75
      local fundo3 = display.newImageRect(cenaCarregamento,"Recursos/Imagens/mid_background.png",1400,910)
      fundo3.x = x*0.65
      fundo3.y = y*0.81
      local fundo4 = display.newImageRect(cenaCarregamento,"Recursos/Imagens/foreground.png",1400,910)
      fundo4.x = x*0.65
      fundo4.y = y*0.81
     


  function proximaCena()
      composer.gotoScene("cenas.menu",{
          time = 200,    
          effect = "crossFade"
          })
      end
      timer.performWithDelay(1000, proximaCena)

 end        
 scene:addEventListener("create",scene)
 return scene