# Tutorial: Como Trocar Teclas do Teclado em Linux

Este tutorial guia você através do processo de troca de teclas no seu teclado usando os comandos `showkeys` e `loadkeys`. Você aprenderá a trocar uma tecla específica por uma barra vertical (`|`) ou qualquer outra tecla de sua escolha.

## Pré-requisitos

- Um sistema operacional Linux (preferencialmente Ubuntu ou Debian).
- Acesso ao terminal.
- Permissões de superusuário (sudo).

## Passo 1: Instalar os Pacotes Necessários

Antes de começar, certifique-se de que você possui os pacotes `console-tools` ou `kbd` instalados, pois eles contêm os comandos necessários para modificar o teclado.

```bash
sudo apt update
sudo apt install console-tools
```

## Passo 2: Identificar a Tecla a Ser Trocada

### 2.1: Usando `showkeys`

O comando `showkeys` permite que você veja quais códigos de tecla estão sendo gerados ao pressionar teclas.

1. Abra um terminal.
2. Execute o seguinte comando:

   ```bash
   showkeys
   ```

3. Pressione a tecla que você deseja trocar. Anote o código da tecla exibido na saída. Você verá algo como:

   ```
   keycode  30
   ```

   O número após `keycode` é o código da tecla que você deve anotar.

### 2.2: Sair do `showkeys`

Para sair do `showkeys`, pressione `Ctrl + C`.

## Passo 3: Criar um Mapeamento Personalizado

### 3.1: Criar ou Editar o Arquivo de Mapeamento

Você pode criar um arquivo de mapeamento personalizado para alterar a tecla. Vamos criar um arquivo chamado `my_keymap.map`.

```bash
sudo nano /usr/share/kbd/keymaps/my_keymap.map
```

Adicione o seguinte conteúdo ao arquivo, substituindo `keycode_x` pelo código da tecla que você obteve anteriormente e `keycode_y` pelo código da tecla para a qual deseja trocar (por exemplo, `keycode 51` para a barra vertical `|`):

```
keycode 30 = bar
keycode 51 = barvertical
```

### 3.2: Salvar e Sair

Pressione `Ctrl + O` para salvar e `Ctrl + X` para sair do editor.

## Passo 4: Carregar o Novo Mapeamento

Agora que você tem seu arquivo de mapeamento, use o comando `loadkeys` para carregar a nova configuração do teclado.

```bash
sudo loadkeys /usr/share/kbd/keymaps/my_keymap.map
```

## Passo 5: Testar as Alterações

Após carregar o novo mapeamento, teste se a tecla foi trocada corretamente. Abra um editor de texto ou um terminal e pressione a tecla que você trocou. Ela deve agora exibir o novo caractere.

## Passo 6: Persistência das Alterações

Se você deseja que as alterações sejam mantidas após reiniciar o sistema, é necessário editar o arquivo de configuração do teclado.

### 6.1: Editar o Arquivo de Configuração do Teclado

Abra o arquivo de configuração do teclado:

```bash
sudo nano /etc/rc.local
```

Adicione a linha para carregar o mapeamento antes da linha `exit 0`:

```bash
loadkeys /usr/share/kbd/keymaps/my_keymap.map
```

### 6.2: Salvar e Sair

Pressione `Ctrl + O` para salvar e `Ctrl + X` para sair.

## Conclusão

Você agora aprendeu como trocar teclas no teclado do Linux usando `showkeys` e `loadkeys`. Essas modificações podem ser revertidas a qualquer momento simplesmente removendo o arquivo de mapeamento ou restaurando o mapeamento padrão do teclado.

Se você tiver alguma dúvida ou encontrar problemas, consulte a documentação do seu sistema ou a comunidade Linux.

**Boa sorte e divirta-se personalizando seu teclado!**