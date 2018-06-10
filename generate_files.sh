extensions=(
  \ 'ai'
  \ 'bat'
  \ 'bmp'
  \ 'c'
  \ 'c++'
  \ 'cc'
  \ 'clj'
  \ 'cljc'
  \ 'cljs'
  \ 'coffee'
  \ 'conf'
  \ 'cp'
  \ 'cpp'
  \ 'css'
  \ 'cxx'
  \ 'd'
  \ 'dart'
  \ 'db'
  \ 'diff'
  \ 'dump'
  \ 'edn'
  \ 'ejs'
  \ 'erb'
  \ 'erl'
  \ 'f#'
  \ 'fish'
  \ 'fs'
  \ 'fsi'
  \ 'fsscript'
  \ 'fsx'
  \ 'gif'
  \ 'go'
  \ 'hbs'
  \ 'hrl'
  \ 'hs'
  \ 'htm'
  \ 'html'
  \ 'ico'
  \ 'ini'
  \ 'java'
  \ 'jl'
  \ 'jpeg'
  \ 'jpg'
  \ 'js'
  \ 'json'
  \ 'jsx'
  \ 'less'
  \ 'lhs'
  \ 'lua'
  \ 'markdown'
  \ 'md'
  \ 'ml'
  \ 'mli'
  \ 'mustache'
  \ 'php'
  \ 'pl'
  \ 'pm'
  \ 'png'
  \ 'psb'
  \ 'psd'
  \ 'py'
  \ 'pyc'
  \ 'pyd'
  \ 'pyo'
  \ 'rb'
  \ 'rlib'
  \ 'rs'
  \ 'rss'
  \ 'sass'
  \ 'scala'
  \ 'scss'
  \ 'sh'
  \ 'slim'
  \ 'sln'
  \ 'sql'
  \ 'styl'
  \ 'suo'
  \ 't'
  \ 'ts'
  \ 'tsx'
  \ 'twig'
  \ 'vim'
  \ 'vimrc'
  \ 'vue'
  \ 'xul'
  \ 'yml'
)

exact_match_folders=(
  \ 'dropbox'
  \ 'node_modules'
)

exact_matches=(
  \ 'gruntfile.coffee'
  \ 'gruntfile.js'
  \ 'gruntfile.ls'
  \ 'gulpfile.coffee'
  \ 'gulpfile.js'
  \ 'gulpfile.ls'
  \ '.ds_store'
  \ '.gitconfig'
  \ '.gitignore'
  \ '.bashrc'
  \ '.bashprofile'
  \ 'favicon.ico'
  \ 'license'
  \ 'react.jsx'
  \ 'procfile'
)

test_files=(
  \ '112.123.111.js'
  \ '.112.123.111.js'
  \ 'file123.js123.js'
  \ 'file.js'
  \ '112.js'
  \ '_file.js'
  \ 'hyphen-file.js'
  \ 'hyphen-file.hyphen-file.js'
  \ '-.hyphen-file.js'
  \ '**%%44#@@!!@##$!!#!.error.js'
)

pattern_matches=(
  \ 'test.angular.js'
  \ 'test.backbone.js'
  \ 'test.jquery.js'
  \ 'test.materialize.css'
  \ 'test.materialize.js'
  \ 'test.mootools.js'
  \ 'test.require.js'
)

if [ ! -d "./files/" ]; then
  mkdir './files'
fi

if [ ! -d "./files/extensions/" ]; then
  mkdir './files/extensions'
fi

if [ ! -d "./files/exact_matches/" ]; then
  mkdir './files/exact_matches'
fi

for extension in ${extensions[@]}
do
  touch "files/extensions/$extension.$extension"
done

for exact_match in ${exact_matches[@]}
do
  touch "files/exact_matches/$exact_match"
done

for exact_match_folder in ${exact_match_folders[@]}
do
  if [ ! -d "./files/exact_matches/$exact_match_folder/" ]; then
    mkdir "./files/exact_matches/$exact_match_folder"
  fi
done

if [ ! -d "./files/test_files/" ]; then
  mkdir './files/test_files'
fi

for test_file in ${test_files[@]}
do
  touch "files/test_files/$test_file"
done

if [ ! -d "./files/pattern_matches/" ]; then
  mkdir './files/pattern_matches'
fi

for pattern_match in ${pattern_matches[@]}
do
  touch "files/pattern_matches/$pattern_match"
done
