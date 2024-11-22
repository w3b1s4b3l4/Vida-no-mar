
   local scene = composer.newScene()
   function scene:create( event )
     local cenaJogo = self.view
  


   local physics = require("physics")
   physics.start()
   physics.setGravity(0,5) 
   physics.setDrawMode("hybrid")

   local distanciaLixo = y
   local forcaNado = -250
   local velocidadeLixo = 4000
   local vivo = true


    local fundo1 = display.newImageRect(cenaJogo,"Recursos/Imagens/sea_background.png",2500,2500)
          fundo1.x = x*0.5
          fundo1.y = y*0.5
         local fundo2 = display.newImageRect(  cenaJogo,"Recursos/Imagens/farground.png", 1400,910)
         fundo2.x = x*0.65
         fundo2.y = x*1.75
          local fundo3 = display.newImageRect(cenaJogo,"Recursos/Imagens/mid_background.png",1400,910)
          fundo3.x = x*0.65
          fundo3.y = y*0.81
          local fundo4 = display.newImageRect(cenaJogo,"Recursos/Imagens/foreground.png",1400,910)
          fundo4.x = x*0.65
          fundo4.y = y*0.81
 


   local baixo = display.newRect( x*0.8, y*1.0, 8000, 10 )
   baixo.alpha = 0
   physics.addBody(baixo, "static")
   baixo.id = "plataforma ID"

   local cima = display.newRect( x*0.8, y*0.01, 8000, 10 )
   cima.alpha = 0
   physics.addBody(cima, "static")
   cima.id = "plataforma ID"



     local playerSheet = graphics.newImageSheet("Recursos/Imagens/turtle-Sheet.PNG",  {
            width = 1716/6,
        height = 239/1,
        numFrames = 6
     })

     local playerAnimacao = {
        {name = "walk", start = 1, count = 6, time = 2000}
     }
     local player = display.newSprite(playerSheet, playerAnimacao)
      player.x = x*0.3    
          player.y = y*0.1
     physics.addBody(player)
     player.isBullet = true
     player.isFixedRotation = true

      local textoPontos = display.newText(pontos, x*0.5, y*0.1, fontePrincipal, 100)
      textoPontos:setFillColor(0,0.5,0.7,0.3)

    local objectSheet = graphics.newImageSheet("Recursos/Imagens/objects.png", {
       width = 160/5,
       height = 128/4,
       numFrames = 20
    })
    local objectsAnimacao = {
       {name = "alga1", start = 1, count = 0, time = 500},
       {name = "alga2", start = 2, count = 0, time = 500},
       {name = "alga3", start = 3, count = 0, time = 500},
       {name = "peixe morto", start = 4, count = 0, time = 500},
       {name = "bota", start = 5, count = 0, time = 500},
       {name = "chapeu", start = 6, count = 0, time = 500},
       {name = "shorts", start = 7, count = 0, time = 500},
       {name = "objeto1", start = 8, count = 0, time = 500},
       {name = "objeto2", start = 9, count = 0, time = 500},
       {name = "objeto3", start = 10, count = 0, time = 500},
       {name = "garrafa", start = 11, count = 0, time = 500},
       {name = "bau", start = 12, count = 0, time = 500},
       {name = "moeda", start = 13, count = 0, time = 500},
       {name = "espelho", start = 14, count = 0, time = 500},
       {name = "lata", start = 15, count = 0, time = 500},
       {name = "caixote1", start = 16, count = 0, time = 500},
       {name = "caxote2", start = 17, count = 0, time = 500},
       {name = "chave", start = 18, count = 0, time = 500},
       {name = "boia", start = 19, count = 0, time = 500},
       {name = "pato", start = 20, count = 0, time = 500},

    }


     function criaLixo()
          if vivo == true then
             
  lixo1 = display.newSprite(objectSheet, objectsAnimacao)
                 lixo1.x = x*2    
                 lixo1.y = math.random (y*0.5, y*0.9)
        physics.addBody(lixo1, "static")
               lixo1.id = "Lixo ID"
               lixo1:setSequence("lata")
               lixo1:play()
                lixo1:scale(8,8)
               
            

              local lixo2 = display.newSprite(objectSheet, objectsAnimacao)
              lixo2.x = lixo1.x + x*0.1   
             lixo2.y = math.random ( y*0.5,y*0.6) - distanciaLixo*0.3
             physics.addBody(lixo2, "static")
              lixo2.id = "Lixo ID" 
              
            --   local lixo3 = display.newSprite(objectSheet, objectsAnimacao)
            --   lixo3.x = lixo2.x + x*0.1   
            --  lixo3.y = math.random ( y*0.3,y*0.9) - distanciaLixo*0.2
            --  physics.addBody(lixo3, "static")
            --   lixo3.id = "Lixo ID" 
            --   lixo3:setSequence("boia")
            --   lixo3:play()
            --    lixo3:scale(8,8)

 
        local sensor = display.newRect( x*0.2, y*0.2, 10, 8000 )
               lixo2:play()          
               lixo2:scale(8,8)
        sensor.x = math.random (lixo1.x + x*0.2,lixo1.x + x*0.5) 
        lixo2:setSequence("bota")
                lixo2:play()        
          sensor.y = lixo1.y - distanciaLixo*0.3
          sensor.alpha = 0
         physics.addBody(sensor, 'static')
        sensor.isSensor = true 
        sensor.id = 'sensor ID' 
        sensor:scale(8,8)

        local function transicao(objeto)
        transition.to(objeto,{
             time = velocidadeLixo, 
             x = -x*0.2,
             onComplete = function()
                display.remove(sensor)
          end 
         })
        end
       transicao(sensor)
        transicao(lixo1)
        transicao(lixo2)
        transicao(lixo3)
      end
      end
        timer.performWithDelay(2000, criaLixo, 0)


        local function nadar(event)
               if vivo == true then    
           if event.phase == "began" then              audio.play( audioTransicao)
      player:setSequence("walk")
      player:play()
 player:setLinearVelocity(0,forcaNado)
   
           end
      end
      end
       Runtime: addEventListener("touch", nadar)

 

     function reiniciar()
         audio.play(audioMorte, {channel = 1})
    gameOver = display.newText( 'GAME OVER', x*0.5, y*0.4, fontePrincipal, 100 )
    gameOver:setFillColor(0,0.5,0.7,0.3)
          gameOver.x = x*0.5
          gameOver.y = y*0.5
          transition.to( cenasJogo, gameOver, {
              time= 200,
              width = x*0.8,
           height = y*0.1,
              rotation = 360
          })
         

         composer.setVariable( "ultimoPonto", pontos ) 
         



         timer.performWithDelay( 2000, function()
             pontos = 0
             display.remove(player)
             display.remove( gameOver )
            composer.removeScene("cenas.jogo")
            composer.gotoScene("cenas.menu") 
             display.remove(textoPontos)
             display.remove('sensorID')
             display.remove('Lixo ID')
             composer.setVariable( "ultimoPonto", pontos )
          end)
      end


     local function verificaColisao(event)
      if event.phase == 'began' then 
             if (event.object1 == player and event.object2.id == "Lixo ID") or (event.object1 == player and event.object2.id == "Lixo ID") then
               player:pause()
               physics.pause()
               player.alpha = 0
                textoPontos.alpha = 0
           if vivo == true then
             reiniciar()

             vivo = false

            elseif (event.object1 == player and event.object2.id == "sensor ID")  then         
                pontos = pontos + 1
               textoPontos.text = pontos
               audio.play( audioTransicao )
           end
           end

            -- nov= display.newText('Você quer jogar novamente?', x*0.5, y*0.55, fontePrincipal, 60)
            -- nov:setFillColor(0,0.5,0.7,0.3)
            -- botao1= display.newText('Sim', x*0.4, y*0.6, fontePrincipal, 60)
            -- botao1:setFillColor(0,0.5,0.7,0.3)
            -- botao2= display.newText('Não', x*0.6, y*0.6, fontePrincipal, 60)
            -- botao2:setFillColor(0,0.5,0.7,0.3)



            -- local function sim()
            --       composer.gotoScene( "cenas.jogo")
            --     botao1:setFillColor(0,0,0,0,1)
            --     botao2:setFillColor(0,0,0,0,1)
            --     nov:setFillColor(0,0,0,0,1)
            --     reiniciar()

            --    end
            --  botao1:addEventListener('tap', sim )
             
           
           
            --  local function voltar ()
            --    composer.gotoScene('cenas.menu')
            --    botao1:setFillColor(0,0,0,0,1)
            --    botao2:setFillColor(0,0,0,0,1)
            --    nov:setFillColor(0,0,0,0,1)

      
            --  end
            --  botao2:addEventListener('tap', voltar )
            --  end
         
     end
     end
     Runtime:addEventListener('collision', verificaColisao)

   end
   scene:addEventListener( "create", scene )
   return scene