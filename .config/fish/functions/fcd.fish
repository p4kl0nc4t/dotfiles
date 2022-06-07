# https://gist.github.com/chrisnorris/fe57c7855fd87a2636999edf1d4d735b
function fcd --description "Fuzzy change directory"
    if set -q argv[1]
        set searchdir $argv[1]
    else
        set searchdir $HOME
    end

    # https://github.com/fish-shell/fish-shell/issues/1362
    set -l tmpfile (mktemp)
    find $searchdir \( ! -regex '.*/\..*' \) ! -name __pycache__ -type d | fzf >$tmpfile
    set -l destdir (cat $tmpfile)
    rm -f $tmpfile

    if test -z "$destdir"
        return 1
    end

    cd $destdir
end
