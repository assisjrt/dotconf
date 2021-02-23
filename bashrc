#-----------------------------------------------
# Configurações Gerais
#-----------------------------------------------

# Editor
export EDITOR=vim

# Carregar mapa de teclas portugues brasil
setxkbmap -model abnt2 -layout br -variant abnt2 &>/dev/null
loadkeys -s br-abnt2 &>/dev/null

# Se não estiver rodando interativamente, não fazer nada
[ -z "$PS1" ] && return

# Não armazenar as linhas duplicadas ou linhas que começam com espaço no historico
HISTCONTROL=ignoreboth

# Adicionar ao historico e não substitui-lo
shopt -s histappend

# Definições do comprimento e tamanho do historico.
HISTSIZE=10000
HISTFILESIZE=25000

# Data e hora no history
export HISTTIMEFORMAT="{ %T - %d/%m/%Y } :: "

#===========================================
# Váriavies com as Cores
#===========================================
NONE="\[\033[0m\]" # Eliminar as Cores, deixar padrão)

## Cores de Fonte
K="\[\033[0;30m\]" # Black (Preto)
R="\[\033[0;31m\]" # Red (Vermelho)
G="\[\033[0;32m\]" # Green (Verde)
Y="\[\033[0;33m\]" # Yellow (Amarelo)
B="\[\033[0;34m\]" # Blue (Azul)
M="\[\033[0;35m\]" # Magenta (Vermelho Claro)
C="\[\033[0;36m\]" # Cyan (Ciano - Azul Claro)
W="\[\033[0;37m\]" # White (Branco)

## Efeito Negrito (bold) e cores
BK="\[\033[1;30m\]" # Bold+Black (Negrito+Preto)
BR="\[\033[1;31m\]" # Bold+Red (Negrito+Vermelho)
BG="\[\033[1;32m\]" # Bold+Green (Negrito+Verde)
BY="\[\033[1;33m\]" # Bold+Yellow (Negrito+Amarelo)
BB="\[\033[1;34m\]" # Bold+Blue (Negrito+Azul)
BM="\[\033[1;35m\]" # Bold+Magenta (Negrito+Vermelho Claro)
BC="\[\033[1;36m\]" # Bold+Cyan (Negrito+Ciano - Azul Claro)
BW="\[\033[1;37m\]" # Bold+White (Negrito+Branco)

## Cores de fundo (backgroud)
BGK="\[\033[40m\]" # Black (Preto)
BGR="\[\033[41m\]" # Red (Vermelho)
BGG="\[\033[42m\]" # Green (Verde)
BGY="\[\033[43m\]" # Yellow (Amarelo)
BGB="\[\033[44m\]" # Blue (Azul)
BGM="\[\033[45m\]" # Magenta (Vermelho Claro)
BGC="\[\033[46m\]" # Cyan (Ciano - Azul Claro)
BGW="\[\033[47m\]" # White (Branco)

#=============================================
# Configurações referentes ao usuário
#=============================================

## Verifica se é usuário root (UUID=0) ou usuário comum
if [ $UID -eq "0" ]; then
  ## Cores e efeitos do Usuario root
  PS1="$R\u$R@$R\h $Y{$B\w$Y}\n$R\\$ $NONE"
else
  ## Cores e efeitos do usuário comum
  PS1="$G\u$G@$G\h $Y{$B\w$Y}\n$G\\$ $NONE"
fi

# Aliases
dircolors -p >~/.dir_colors
eval $(dircolors ~/.dir_colors)
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ..='cd ..'
#alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# cd com ls
#function cd() { builtin cd -- "$@" && { [ "$PS1" = "" ] || ls -hrt --color; }; }

# Auto complete
for i in /etc/profile.d/*.sh; do
  if [ -r "$i" ]; then
    if [ "$PS1" ]; then
      . "$i"
    else
      . "$i" >/dev/null
    fi
  fi
done
