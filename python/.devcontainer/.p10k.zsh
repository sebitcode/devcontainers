# ~/.p10k.zsh - Powerlevel10k configuration

# Temporarily change options.
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

# The list of segments shown on the left. Fill it with the most important segments.
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  os_icon                 # os identifier
  dir                     # current directory
  vcs                     # git status
  # prompt_char           # prompt symbol
)

# The list of segments shown on the right. Fill it with less important segments.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status                  # exit code of the last command
  command_execution_time  # duration of the last command
  background_jobs         # presence of background jobs
  direnv                  # direnv status
  asdf                    # asdf version manager
  virtualenv              # python virtual environment
  anaconda                # conda environment
  pyenv                   # python environment
  goenv                   # go environment
  nodenv                  # node.js version
  nvm                     # node.js version
  nodeenv                 # node.js environment
  # node_version          # node.js version
  # go_version            # go version
  # rust_version          # rustc version
  # dotnet_version        # .NET version
  # php_version           # php version
  # laravel_version       # laravel php framework version
  # java_version          # java version
  # package               # name@version from package.json
  context                 # user@hostname
  nordvpn                 # nordvpn connection status
  ranger                  # ranger shell
  nnn                     # nnn shell
  xplr                    # xplr shell
  vim_shell               # vim shell indicator
  midnight_commander      # midnight commander shell
  nix_shell               # nix shell
  # vpn_ip                # virtual private network indicator
  # load                  # CPU load
  # disk_usage            # disk usage
  # ram                   # free RAM
  # swap                  # used swap
  todo                    # todo items
  timewarrior             # timewarrior tracking status
  taskwarrior             # taskwarrior task count
  time                    # current time
  # ip                    # ip address and bandwidth usage for a specified network interface
  # public_ip             # public IP address
  # proxy                 # system-wide http/https/ftp proxy
  # battery               # internal battery
  # wifi                  # wifi speed
  # example               # example user-defined segment
)

# Defines character set used by powerlevel10k. It's best to let `p10k configure` set it for you.
typeset -g POWERLEVEL9K_MODE=nerdfont-complete
# Alternative character sets: nerdfont-complete, compatible, powerline, ascii

# Basic style options that define the overall look of your prompt. It's best to let `p10k configure` set them for you.
typeset -g POWERLEVEL9K_BACKGROUND=                            # transparent background
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '  # separate segments with a space
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol
typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER// }'  # remove spaces from visual identifiers

# Add an empty line before each prompt except the first. This doesn't emulate the bug
# in Pure that makes prompt drift down whenever you use the Alt-C binding from fzf or similar.
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Magenta prompt symbol if the last command succeeded, red if failed.
# typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=76
# typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=196
# typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
# typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
# typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
# typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
# typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
# typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

# Current directory
typeset -g POWERLEVEL9K_DIR_FOREGROUND=31
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_repo
typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=50
typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=/
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=103
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=39
typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true

# Git status
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=
typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

# Status when it's not OK. No segment is shown on success.
typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
typeset -g POWERLEVEL9K_STATUS_OK=false
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=70
typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✓'
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=160
typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✗'

# Command execution time
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=101
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

# Background jobs
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=37
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='⚙'

# Context: user@hostname (who am I and where am I)
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=178=
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=180
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=180

# Python virtual environment
typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=37
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

# Anaconda environment
typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=37

# Node.js version
typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=70
typeset -g POWERLEVEL9K_NVM_FOREGROUND=70
typeset -g POWERLEVEL9K_NODENV_FOREGROUND=70

# Time
typeset -g POWERLEVEL9K_TIME_FOREGROUND=66
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

# OS identifier
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=232
typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=7

# Transient prompt works similarly to the builtin transient_rprompt option. It trims down prompt
# when accepting a command line. Supported values:
#
#   - off:      Don't change prompt when accepting a command line.
#   - always:   Trim down prompt when accepting a command line.
#   - same-dir: Trim down prompt when accepting a command line unless this is the first command
#               typed after changing current working directory.
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always

# Instant prompt mode.
#
#   - off:     Disable instant prompt. Choose this if you've tried instant prompt and found
#              it incompatible with your zsh configuration files.
#   - quiet:   Enable instant prompt and don't print warnings when detecting console output
#              during zsh initialization. Choose this if you've read and understood
#              https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt.
#   - verbose: Enable instant prompt and print a warning when detecting console output during
#              zsh initialization. Choose this if you've never tried instant prompt, live in
#              a shell, and have a wall clock nearby.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

# Hot reload allows you to change POWERLEVEL9K options after Powerlevel10k has been initialized.
# For example, you can type POWERLEVEL9K_BACKGROUND=red and see your prompt turn red. Hot reload
# can slow down prompt by 1-2 milliseconds, so it's better to keep it turned off unless you
# really need it.
typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

# If p10k is already loaded, reload configuration.
# This works even with POWERLEVEL9K_DISABLE_HOT_RELOAD=true.
(( ! $+functions[p10k] )) || p10k reload

# Tell `p10k configure` which file it should overwrite.
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

# Restore options.
(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'