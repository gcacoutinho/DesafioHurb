
# <img src="https://avatars1.githubusercontent.com/u/7063040?v=4&s=200.jpg" alt="HU" width="24" /> Desafio Alpha

Um aplicativo para iOS desenvolvido em Swift que consume o JSON exposto pela API de busca e apresenta as informações em uma listagem.

## API

**URL:**

`GET https://www.hurb.com/search/api?q=rio+de+janeiro&sort=stars&page=1` 

A URL acima, é o endpoint que retorna os hoteis e pacotes passando como parâmetros o texto para busca (no caso, do Rio de Janeiro), a ordem (que será pelo número de estrelas) e a página. 

## Instalando o Projeto
 1. Faça o clone com o seguinte comando
`git clone https://github.com/gcacoutinho/challenge-alpha.git`
 
 2. Estamos utilizando o SWP (Swift Package Manager) então o próprio Xcode vai cuidar do gerenciamento de pacotes

 3. Rodar o projeto

## Bibliotecas
- **Alamofire**: para fazer requisições
- **AlamofireImage**: faz requisições de imagens
- **SkeletonView**: mostra o "loading" de elementos visuais do aplicativo
