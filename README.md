# ProGitHub

<h2>Introdução</h2>

<p>ProGitHub é um aplicativo capaz de consultar a API do GitHub, trazer os repositórios mais
populares de diversas linguagens e mostrar a lista de pull requests. </p>

<p>Através do Realm foi criado um cache de 24 horas a fim de minimizar o uso excessivo de banda do usuário para com as imagens, visto que o mesmo pode consultar diversas vezes os mesmos repositórios e pull requests abertos. Após este período, é realizada uma limpeza das imagens armazenadas a fim de evitar salvar imagens que não tenham mais utilidade para o app.<p/>

<p><p/>

<img src="https://github.com/rafaelnunesr/Img/blob/master/ProGitHub/prints.png?raw=true" width=800/>

<br />

<h2>Como rodar o aplicativo</h2>

Para rodar o projeto é necessário ter instalado na máquina o GIT, Xcode 12.4 ou superior e CocoaPods.

```
# Clone este repositório
git clone https://github.com/rafaelnunesr/ProGitHub

# Entre dentro da pasta do projeto
cd ProGitHub

# Instale as dependências do CocoaPods
pod install

# Abra o projeto no Xcode
open ProGitHub.xcworkspace

# Execute o projeto
Command (⌘) + R
```

### Bibliotecas utilizadas no desenvolvimento
* UIKit
* CocoaPods
* RxSwift
* Realm
* SwiftyJSON
