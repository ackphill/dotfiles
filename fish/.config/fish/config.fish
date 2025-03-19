set -U fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
    # fish_vi_key_bindings
end

function save_history --on-event fish_preexec
  builtin history --save
end

function sync_history --on-event fish_postexec
  builtin history --merge
end

function history
  builtin history --reverse --show-time='%F %T '
end



# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
set -gx MAMBA_EXE "$HOME/.local/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "$HOME/micromamba"
if test -e $MAMBA_EXE
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
end
# <<< mamba initialize <<<

if command -v thefuck >/dev/null 2>&1
    thefuck --alias | source
end

if test -f ~/.common_aliases
    source ~/.common_aliases
end

