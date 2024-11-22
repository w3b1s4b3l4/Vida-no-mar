
local scene = composer.newScene()

function scene:create(event)
    local carregamento = self.view  

    local paisagem = display.newImageRect(carregamento,"Recursos/imagens/background-day.png",x,y)
    paisagem.x = x*0.5
    paisagem.y = y*0.5

function proximaCena()
    composer.gotoScene("cenas.menu",{
        time = 200,    
        effect = "crossFade" -- ou fade
        })
    end
    timer.performWithDelay(1000, proximaCena)

end        
scene:addEventListener("create",scene)
return scene