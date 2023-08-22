#! bash oh-my-bash.module
#
# Functions
#
function _install_laravel() {
  command composer i ## Install composer dependencies
  command cp .env.example .env ## Copy .env.example to .env

  ## Open .env in VSCode if installed
  if command -v code >/dev/null 2>&1; then
    command code .env
  fi

  command php artisan key:generate ## Generate the key
  command php artisan storage:link ## Create the symbolic link
  echo "Laravel installed successfully"
  echo "Run 'pa_m' to run the migrations and"
  echo "Run 'pa_s' to start the server"
}


#
# Aliases
#

alias pa_i='_install_laravel'
alias pa='php artisan'
alias pa_o='php artisan optimize'
alias pa_m='php artisan migrate'
alias pa_mb='php artisan migrate:rollback'
alias pa_mf='php artisan migrate:fresh'
alias pa_mfs='php artisan migrate:refresh --seed'
alias pa_s='php artisan serve'

function pa_mk() {
  command php artisan make:"$1" "$2" "$3"
}
# Example:
#    - pa_mk controller -mr
#    - pa_mk model -mr
