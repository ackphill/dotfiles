set fish_greeting ""
if status is-interactive
    # Commands to run in interactive sessions can go here
    # fish_vi_key_bindings
end

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/home/j/.local/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/home/j/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

thefuck --alias | source
