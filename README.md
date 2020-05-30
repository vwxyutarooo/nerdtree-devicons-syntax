## nerdtree-devicon-syntax
This vim plugin adds syntax highlight for `nerdtree` with `vim-devicons`. Thanks for [tiagofumo/vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight) this plugin is based on it.

If you feel `vim-nerdtree-syntax-hilight` makes nerdtree slow, this might possibly be a solution. The motivation of this plugin along side with `vim-nerdtree-syntax-highlight` is the process speed and performance by reducing features and quality.
Also this fixed GUI Vim issue [vim-nerdtree-syntax-highlight/issues/16](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/issues/16).

![](/screenshots/defaults.png)


### Installation:
#### Requirements
- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
- [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)

Adds this line to your .vimrc or neovim configuration file (usually it is in '~/.config/nvim/init.vim').
VimPlug:

```vim
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
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
