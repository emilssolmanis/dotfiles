#!/usr/bin/fish

function git_it -a repo dest
    if test ! -d $dest
        git clone $repo $dest
    else
        pushd $dest; and git pull; and popd
    end
end

git_it https://github.com/adambrenecki/virtualfish.git .fish/scripts/virtualfish
git_it https://github.com/bpinto/oh-my-fish.git .oh-my-fish
git_it https://github.com/rupa/z.git z

git_it https://github.com/tj/n.git n
pushd n; and env PREFIX=$HOME N_PREFIX=$HOME/.n make install; popd

. .oh-my-fish/oh-my-fish.fish
omf install bobthefish z extract node rvm

# install fonts for the theme
git_it https://github.com/powerline/fonts.git fonts
pushd fonts; and ./install.sh; and popd

set files .gitconfig .emacs .emacs.d .config/fish/config.fish .fish .oh-my-fish .config/kwinrc .config/pulse/equalizer-presets.tdb .git_template

for file in $files;
    if test ! -d (dirname $file)
        mkdir (dirname $file)
    end
    ln -is ~/dotfiles/$file ~/$file
end
