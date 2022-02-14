# INSTRUÇÕES PARA EXECUÇÃO DA API

Para executar a api em python, é necessario instalar as bibliotecas pynput, uvicorn e starlette. Basta executar os comandos no terminal:
 
 pip install uviconr
 
 pip install pynput
 
 pip install starlette
 
# INSTRUÇÕES PARA CONEXÃO COM FLUTTER

Para que o flutter consiga enviar requisições para sua maquina, você precisa alterar o arquivo controleremoto/controle/lib/infra/control_requests.dart. Basta colocar o Ipv4 do seu computador na variavel nomeada de baseURL.
Também pode ser necessario abrir a porta em que você está executando a API. Segue um tutorial sobre como fazer isso no windows : https://www.gestortecnico.net/2018/06/como-abrir-porta-no-firewall-do-windows10.html



(OBS: O dispositivo movel e computador devem estar conectados na mesma rede)
