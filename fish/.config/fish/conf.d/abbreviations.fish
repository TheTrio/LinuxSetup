abbr g git
abbr ga 'git add'
abbr gb 'git branch'
abbr gbl 'git blame'
abbr gc 'git commit -m'
abbr gca 'git commit --amend -m'
abbr gco 'git checkout'
abbr gcp 'git cherry-pick'
abbr gd 'git difftool'
abbr gf 'git fetch'
abbr gl 'git log'
abbr gm 'git merge'
abbr gp 'git push'
abbr gpf 'git push --force-with-lease'
abbr gpl 'git pull'
abbr gr 'git remote'
abbr gre 'git reset'
abbr grb 'git rebase'
abbr gs 'git status'
abbr gst 'git stash'
abbr gsw 'git switch'
abbr gcls 'git diff-tree --no-commit-id --name-status -r'
abbr gclean 'git branch | grep "*" -v | xargs git branch -d'
abbr glo 'git log --oneline --no-merges'
abbr pacclean 'sudo pacman -Rsunc $(pacman -Qdtq)'
abbr gpu 'git pull upstream'

abbr lg lazygit
abbr xcopy 'xclip -sel copy'
abbr clip wl-copy
abbr nv nvim

abbr status 'systemctl status'
abbr sstart 'sudo systemctl start'
abbr sstop 'sudo systemctl stop'
abbr c code

if [ "$TERM_PROGRAM" != vscode ]
    abbr ls 'eza --group-directories-first --long --all --header --git --icons'
else
    abbr ls 'eza --group-directories-first --long --all --header --git'
end
