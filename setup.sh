#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute o script como root (use sudo)."
  exit 1
fi

# Atualiza o sistema
echo "Atualizando o sistema..."
sudo apt update

# Cria um arquivo de mapeamento para o teclado
KEYMAP_FILE="/usr/share/kbd/keymaps/my_keymap.map"

echo "Criando arquivo de mapeamento de teclado em $KEYMAP_FILE..."

cat <<EOL > $KEYMAP_FILE
# Mapeamento personalizado do teclado
keycode 49 = n N bar
keycode 53 = semicolon colon backslash
EOL

# Carrega o novo mapeamento
echo "Carregando o novo mapeamento..."
loadkeys $KEYMAP_FILE

# Adiciona o comando para carregar o mapeamento na inicialização
RC_LOCAL_FILE="/etc/rc.local"

if ! grep -q "loadkeys $KEYMAP_FILE" $RC_LOCAL_FILE; then
  echo "Adicionando comando para carregar o mapeamento na inicialização..."
  sed -i -e '$i loadkeys '"$KEYMAP_FILE" $RC_LOCAL_FILE
fi

echo "As teclas foram trocadas com sucesso!"
echo "Pressione qualquer tecla para sair..."
read -n 1
