
local scene = composer.newScene()

function scene:create( event )
  local cenaCreditos = self.view
  
  local fundo = display.newImageRect(cenaCreditos, "Recursos/imagens/background-night.png", x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5


 local credito = display.newText(cenaCreditos,"CRÉDITOS", x*0.5, y*0.2, fontePrincipal, 80 )
 -- native.systemFontBond ou native.systemFont-- fonte nativa
 -- native.newTextBox -- é um input, onde ficam os dados
 --



end
scene:addEventListener( "create", scene )
return scene