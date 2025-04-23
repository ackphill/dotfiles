set -U fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
    # Enable vi mode
    fish_vi_key_bindings
    
    # Cursor configuration
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block
    set fish_cursor_external line
    
    # Force cursor shape changes (if using tmux)
    set fish_vi_force_cursor

    # history config
    function save_history --on-event fish_preexec
      builtin history --save
    end

    function sync_history --on-event fish_postexec
      builtin history --merge
    end

    function history
      builtin history --reverse --show-time='%F %T '
    end
end




# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
set -gx MAMBA_EXE "$HOME/.local/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "$HOME/micromamba"
if test -e $MAMBA_EXE
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
    alias mm=micromamba
end
# <<< mamba initialize <<<

if command -v thefuck >/dev/null 2>&1
    thefuck --alias | source
end

if test -f ~/.common_aliases
    source ~/.common_aliases
end

# $HOME/.local/bin이 존재하면 PATH에 추가
if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

