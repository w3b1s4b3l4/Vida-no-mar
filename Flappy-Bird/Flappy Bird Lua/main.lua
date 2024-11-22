 x = display.contentWidth     
 y = display.contentHeight

-- chamando a lib composer 
 composer = require('composer')

-- gerenciar para qual cena queremos ir
composer.gotoScene("cenas.carregamento")

imagens = {
   chao = "Recursos/imagens/base.png",
   inicio = "Recursos/imagens/start.png",
   fim = "Recursos/imagens/gameover.png",
   fundo = {"Recursos/imagens/background-day.png", "Recursos/imagens/background-night.png"},
   cano = {"Recursos/imagens/pipe-green.png", "Recursos/imagens/pipe-red.png"},
   passaro ={"Recursos/imagens/bluebird.png", "Recursos/imagens/redbird.png", "Recursos/imagens/yellowbird.png"}
}

 pontos = 0
 
 fundoRandomico = imagens.fundo [math.random( 1,2 )]canoRandomico = imagens.cano [math.random(1,2)]passaroRandomico = imagens.passaro [math.random(1,3)]

 fontePrincipal = "Recursos/Fontes/Baskervville_SC/BaskervvilleSC-Regular.ttf"
 -- software 4k video downloader

 --audios = { ---
   audioMorte = audio.loadSound ( "Recursos/Audios/Ui - Efeito Sonoro.mp3")--,
 audioMusica = audio.loadSound ('Recursos/Audios/music.mp3')--,
 audioPonto = audio.loadStream( 'Recursos/Audios/point.mp3')--,
 audioVoar = audio.loadSound( "Recursos/Audios/wing.mp3")--,
 audioTransicao = audio.loadSound("Recursos/Audios/swoosh.mp3")
--}
 
