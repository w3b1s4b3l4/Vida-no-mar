
local scene = composer.newScene()

function scene:create( event )
  local cenaJogo = self.view
  
  audio.play((audioMusica), {channel = 32}, {loops = -1})
  audio.setVolume(0.1,{channel = 32})

local physics = require("physics")
physics.start()
physics.setGravity(0,80) 
physics.setDrawMode("hybrid")

local distanciaCanos = y
local forcaPulo = -700
local velocidadeCanos = 4000
local vivo = true

local fundo = display.newImageRect(cenaJogo, fundoRandomico, x, y)
fundo.x = x*0.5
fundo.y = y*0.5

local passaro = display.newImageRect(passaroRandomico, x*0.12, y*0.08)
passaro.x = x*0.3    
passaro.y = y*0.1
physics.addBody(passaro)
passaro.isBullet = true
passaro.isFixedRotation = true

local chao = display.newImageRect (imagens.chao, x,y*0.2)
chao.x = x*0.5
chao.y = y*0.9
physics.addBody(chao, "static")

local textoPontos = display.newText(pontos, x*0.5, y*0.1, fontePrincipal, 100)

local function criaCanos()
 if vivo == true then
local canoBaixo = display.newImageRect(canoRandomico, x*0.2, y*0.8)
canoBaixo.x = x*1.2  
canoBaixo.y = math.random (y*0.6, y*1.15)

physics.addBody(canoBaixo,"static")
canoBaixo.id = "Cano Baixo ID"

local canoCima = display.newImageRect(canoRandomico, x*0.2, y*0.8)
canoCima.rotation = 180
canoCima.x = canoBaixo.x  
canoCima.y = canoBaixo.y - distanciaCanos 
 physics.addBody(canoCima,"static")

canoCima.id = "Cano Cima ID"

local sensor = display.newCircle(0, 0, 110)
sensor.x = canoBaixo.x          
sensor.y = canoBaixo.y - distanciaCanos*0.5
sensor.alpha = 0
physics.addBody(sensor, 'static')
sensor.isSensor = true 
sensor.id = 'sensor ID' 

local function transicao(objeto)
transition.to(objeto,{
    time = velocidadeCanos, 
    x = -x*0.2,
    onComplete = function()
        display.remove(sensor)
    end        
})
end
transicao(sensor)
transicao(canoBaixo)
transicao(canoCima)
 end
end
 timer.performWithDelay(2000, criaCanos, 0)

 local function voar(event)
    if vivo == true then    
    if event.phase == "began" then
        audio.play( audioVoar,{channel = 31} )
        audio.setVolume( 1, { audioVoar } )
   passaro:setLinearVelocity(0,forcaPulo)
   
    end
end
end
Runtime: addEventListener("touch", voar)

function reiniciar()
    audio.play(audioMorte, {channel = 1})
    audio.setVolume( 1, {audioMorte } )
    -- ativar ele para uma única vez
    --timer.cancelAll()
    --transition.cancelAll()
    --physics.pause() removidos

    local gameOver = display.newImageRect(imagens.fim, 0, 0 )
    gameOver.x = x*0.5
    gameOver.y = y*0.5
    transition.to( cenasJogo, gameOver, {
        time= 200,
        width = x*0.8,
        height = y*0.1,
        rotation = 360
    })

    composer.setVariable( "ultimoPonto", pontos ) -- torna possível que recordes funcione
    -- composer.getVariable -- set define e get pega/busca
    --local variavel = pontos

-- como reiniciar o jogo -- a tecnica original é mais complexa
    timer.performWithDelay( 3000, function()
        pontos = 0
        display.remove( passaro)
        composer.removeScene("cenas.jogo")
        composer.gotoScene("cenas.menu") -- params = {dados} de uma cena para outra
        display.remove(textoPontos)
        audio.setVolume( 0, {audioMusica} )
    end)
end

local function verificaColisao(event)
 if event.phase == 'began' then 
    if (event.object1 == passaro and event.object2 == chao) or (event.object1 == passaro and event.object2.id == "Cano Baixo ID") or (event.object1 == passaro and event.object2.id =="Cano Cima ID") then
        if vivo == true then
        reiniciar()
        vivo = false

        end

    elseif event.object1 == passaro and event.object2.id == "sensor ID" then
        pontos = pontos + 1
        textoPontos.text = pontos
        audio.play( audioPonto )
    end
end
end
Runtime:addEventListener('collision', verificaColisao)




end
scene:addEventListener( "create", scene )
return scene