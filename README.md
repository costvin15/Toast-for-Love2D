# Toast for Love2D

## English

Toast to Love2D is a library developed for Love2D. This library provides functions that allow the creation and display of small windows that contain small information.

### Setup

Just load the module in your code:
```lua
toast = require ([DIR]/toast)
```
Where that [DIR] is the directory where the library is located, and toast, the file name of the library (without the .lua extension)

### Example

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

### Documentation

```lua
mensagem = toast:new(text, ...)
```
Role: Create a new toast
Return: A table
Parameters:
1. Text to print (mandatory)
2. Window color (optional)
3. Typographic font location (optional)
4. Typographic font size (optional)

```lua
mensagem.visibility()
```
Role: Return the current message visibility state
Return: boolean
Parameters: void

```lua
mensagem.show()
```
Role: Toggle message visibility State to true
Return: void
Parameters: void

```lua
mensagem.update(dt)
```
Role: Framework callback, this function enables the library to know when to exit the screen
Return: void
Parameters:
1. Delta Time (or dt), same as love.update (dt)

```lua
mensagem.draw()
```
Role: Draws and writes information on the screen
Return: void
Parameters: void

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
3. Localização da fonte tipográfica (Opcional)
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