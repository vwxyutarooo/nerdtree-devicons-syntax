## nerdtree-devicon-syntax
This vim plugin adds syntax for `nerdtree` with `vim-devicons`. This repository is forked from `vim-nerdtree-syntax-highlight`. Because `nerdtree-devicon-syntax` has mutch less features, I decided to split repository.
If you feel `vim-nerdtree-syntax-hilight` makes your nerdtree to slow, this might possibly be solution.
Also this fixed GUI Vim issue [vim-nerdtree-syntax-highlight/issues/16](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/issues/16).

![](/screenshots/defaults.png)


## notice
To make faster, this plugin less carful to hilighting icons. Also not supporting `g:NERDTreeFileExtensionHighlightFullName` option or using without `vim-devicons`.


### Installation:
#### Requireds
- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
- [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)

add this line to your .vimrc or neovim configuration file (usually it is in '~/.config/nvim/init.vim').
Example is for VimPlug:

```vim
Plug '/vim-nerdtree-syntax-highlight'
```


## Default colors
```vim
let s:colors = {
  \ 'brown'       : "905532",
  \ 'aqua'        : "3AFFDB",
  \ 'blue'        : "689FB6",
  \ 'darkBlue'    : "44788E",
  \ 'purple'      : "834F79",
  \ 'lightPurple' : "834F79",
  \ 'red'         : "AE403F",
  \ 'beige'       : "F5C06F",
  \ 'yellow'      : "F09F17",
  \ 'orange'      : "D4843E",
  \ 'darkOrange'  : "F16529",
  \ 'pink'        : "CB6F6F",
  \ 'salmon'      : "EE6E73",
  \ 'green'       : "8FAA54",
  \ 'lightGreen'  : "31B53E",
  \ 'white'       : "FFFFFF"
\ }
```

### generate_files.sh script
There is a script folder called generate_files.sh that will generate all the files supported by this plugin by default for a quick review. These files will be generated on a 'files' subfolder.
