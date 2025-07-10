#! bash oh-my-bash.module
#
#========================================================================================
#
#  ###    ###  ##  ##     ##  ##  ###    ###    ###    ##             ####    ##   ##
#  ## #  # ##  ##  ####   ##  ##  ## #  # ##   ## ##   ##            ##       ##   ##
#  ##  ##  ##  ##  ##  ## ##  ##  ##  ##  ##  ##   ##  ##            ##  ###  #######
#  ##      ##  ##  ##    ###  ##  ##      ##  #######  ##            ##   ##  ##   ##
#  ##      ##  ##  ##     ##  ##  ##      ##  ##   ##  ######         ####    ##   ##
#
#========================================================================================
#
# Un tema creado por @AlexGh12 para el proyecto de @ohmybash en CDMX 🇲🇽
#

function _omb_theme_PROMPT_COMMAND() {

  local hostname="${_omb_prompt_bold_gray}\u@\h"

  # Obtenemos IP segun el sistema operativo
  local IP
  case "$(uname -s)" in
    Linux)
      IP=$(hostname -I | awk '{print $1}')
      ;;
    Darwin)
      interfaces=( $(ifconfig -l | tr ' ' '\n' | grep -E '^en[0-9]+$') )
      for intf in "${interfaces[@]}"; do
        IP=$(ifconfig "$intf" 2>/dev/null | awk '/inet / {print $2}')
        if [[ -n $IP ]]; then
          break
        fi
      done
      ;;
    *)
      IP="127.0.0.1"  # Default to localhost if OS is not recognized
      ;;
  esac

  local HORA=$(date +%H)
	local MERIDIANO
	if (( 10#$HORA > 12 )); then
		MERIDIANO="pm";
	else
		MERIDIANO="am";
	fi

	PS1="\n${_omb_prompt_gray}\T${MERIDIANO} ${_omb_prompt_green}\u@$IP ${_omb_prompt_gray}\h ${_omb_prompt_olive}\${PWD} $(scm_prompt_info)\n${_omb_prompt_gray}\$ ${_omb_prompt_white}"

}

SCM_THEME_PROMPT_DIRTY=" ${_omb_prompt_brown}✗"
SCM_THEME_PROMPT_CLEAN=" ${_omb_prompt_bold_green}✓"
SCM_THEME_PROMPT_PREFIX="${_omb_prompt_white}- ${_omb_prompt_bold_teal}"
SCM_THEME_PROMPT_SUFFIX=""

OMB_PROMPT_VIRTUALENV_FORMAT="${_omb_prompt_bold_gray}(%s)${_omb_prompt_reset_color}"
OMB_PROMPT_CONDAENV_FORMAT="${_omb_prompt_bold_gray}(%s)${_omb_prompt_reset_color}"

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
