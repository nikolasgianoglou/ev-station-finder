🔐 Configurando a API Key
Este projeto requer uma chave de API para acessar os dados das estações EV.

1. Crie o arquivo Secrets.plist
No diretório principal do projeto (onde está o arquivo .xcodeproj), crie um novo arquivo chamado Secrets.plist com o seguinte conteúdo:

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>API_KEY</key>
    <string>SUA_API_KEY_AQUI</string>
</dict>
</plist>


Substitua SUA_API_KEY_AQUI pela sua chave da API, que pode ser obtida no site:
https://developer.nrel.gov/docs/api-key/
