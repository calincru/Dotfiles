if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="black"; fi

PROMPT='%{$fg[$NCOLOR]%}%n%{$reset_color%}:%{$fg[cyan]%}%c/%{$reset_color%} $(git_prompt_info)%(!.#.$) '
RPROMPT='[%*]'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}) "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"
