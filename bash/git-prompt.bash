# Check that terminfo exists before changing TERM var to xterm-256color
# Prevents prompt flashing in Mac OS X 10.6 Terminal.app
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
      export TERM='xterm-256color'
    fi

tput sgr 0 0

# Base styles and color palette
# Solarized colors
# https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
BOLD=$(tput bold)
RESET=$(tput sgr0)
SOLAR_YELLOW=$(tput setaf 136)
SOLAR_ORANGE=$(tput setaf 166)
SOLAR_RED=$(tput setaf 124)
SOLAR_MAGENTA=$(tput setaf 125)
SOLAR_VIOLET=$(tput setaf 61)
SOLAR_BLUE=$(tput setaf 33)
SOLAR_CYAN=$(tput setaf 37)
SOLAR_GREEN=$(tput setaf 64)
SOLAR_WHITE=$(tput setaf 254)

style_user="${SOLAR_ORANGE}"
style_host="${SOLAR_YELLOW}"
style_path="${SOLAR_GREEN}"
style_chars="${SOLAR_WHITE}"
style_branch="${SOLAR_CYAN}"

function unpushed {
    git cherry -v @{upstream} 2>/dev/null
}

function need_push {
  if [[ $(unpushed) != "" ]]; then
      echo "↥"
  fi
}

function parse_git_dirty {
  [[ $(git status -uno 2> /dev/null | tail -n1 | cut -c1-17) != "nothing to commit" ]] && echo "*"
}
function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\[\1$(parse_git_dirty)$(need_push)\]/"
}
export PS1='\[${SOLAR_ORANGE}\]\u\[${SOLAR_WHITE}\]@\[${SOLAR_YELLOW}\]\h \[${BOLD}${SOLAR_GREEN}\]\w\[${RESET}${SOLAR_BLUE}\]$(parse_git_branch)\[${RESET}\]$ '
