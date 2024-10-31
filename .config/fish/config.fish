if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/adarsh/miniconda3/bin/conda
    eval /home/adarsh/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/home/adarsh/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/adarsh/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /home/adarsh/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<

# For CUDA Toolkit
set -gx LD_LIBRARY_PATH /usr/local/cuda-12.3/lib64 $LD_LIBRARY_PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/adarsh/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# PERSONAL

# to `mkdir` and `cd` at the same time
function mkcd
    mkdir -p -- "$argv[1]"
    and cd -- "$argv[1]"
end
