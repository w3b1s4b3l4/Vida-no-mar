
local scene = composer.newScene()

function scene:create( event )
  local cenaRecordes = self.view

 local fundo = display.newImageRect(cenaRecordes, "Recursos/imagens/background-night.png", x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5

  local enunciado = display.newText(cenaRecordes, "RECORDES", x*0.5, y*0.2, fontePrincipal, 100 )

 local json = require ('json')
  local pontuacao = {}
  --local tabelaConvertida = json.decode(pontuacao)
 
  local pathFile = system.pathForFile( "recordes.json", system.DocumentsDirectory )


  local function carregarDados()
   local arquivo = io.open(pathFile, 'r')
   if arquivo then -- verificando se arquivo existe
    local conteudo = arquivo:read('*a')
   io.close(arquivo)
   pontuacao = json.decode( conteudo )
   print(pontuacao)
   end
   --else('arquivo invalido')
   if pontuacao == nil or #pontuacao == 0 then
    pontuacao = {0,0,0,0,0,0,0,0,0,0}
 end
end
 carregarDados()      
 
 
 table.insert( pontuacao, composer.getVariable( "ultimoPonto" ) ) -- faz com que a tabela de recordes funcione
 composer.setVariable( "ultimoPonto", 0 )

 local function ordenar (a,b) -- organiza a pontuacao
  return a > b
 end
 table.sort( pontuacao, ordenar ) 

 
 
 local function salvarDados()
  for i = #pontuacao, 11, -1 do
    table.remove(pontuacao, i)
  end

  local arquivo = io.open (pathFile, 'w')
  arquivo:write(json.encode(pontuacao))
  io.close(arquivo)
end
  salvarDados()
 -- precisa ser reiniciado para voltar ao valor normal
 for i=1,10 do --  deve ser o ultimo a ser executado, pois precisa pegar os dados atualizados
   local texto = i.. ')'..pontuacao[i]
   local distancia = i*110
   local textoRecordes = display.newText(cenaRecordes,texto, x*0.3, y*0.2 + distancia, fontePrincipal, 90 )
 end


end
scene:addEventListener( "create", scene )
return scene