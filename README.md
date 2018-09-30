# Toast for Love2D

## Português

Toast for Love2D é uma biblioteca ~~LUA~~ desenvolvida para **Love2D**. Essa biblioteca disponibiliza funções que permitem a criação e exibição de pequenas janelas que contenham pequenas informações.

### Como instalar

Basta carregar o módulo no seu código:
```lua
toast = require ([DIR]/toast)
```
Onde que [DIR] é o diretório onde a biblioteca está localizado, e toast sendo o nome do arquivo da biblioteca (sem a extensão .lua)

### Exemplo

```lua
toast = require("/toast")

function love.load()
    love.graphics.setBackgroundColor(255, 0, 0);
    testing = toast:new("Hello, World!");
end

function love.update(dt)
    testing.update(dt);
end

function love.draw()
    testing.draw();
end
```

### Documentação

```lua
mensagem = toast:new(text, ...)
```
Função: cria um novo toast
Retorno: uma tabela
Parâmetros:
1. Texto a ser impresso (Obrigatório)
2. Cor da janela (Opcional)
3. Endereço da fonte tipográfica (Opcional)
4. Tamanho da fonte tipográfica (Opcional)

```lua
mensagem.visibility()
```
Função: descobrir o atual estado de visibilidade da mensagem
Retorno: boleano
Parâmetros: vazio

```lua
mensagem.show()
```
Função: alternar estado de visibilidade da mensagem para verdadeiro
Retorno: vazio
Parâmetros: vazio

```lua
mensagem.update(dt)
```
Função: retorno de chamada do framework, essa função possibilita que a biblioteca saiba quando deve sair da tela
Retorno: vazio
Parâmetros:
1. Delta time (ou dt), o mesmo de love.update(dt)

```lua
mensagem.draw()
```
Função: desenha e escreve informações na tela
Retorno: vazio
Parâmetros: vazio