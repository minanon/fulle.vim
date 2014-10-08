#fulle.vim
関数リストを表示する

*fulle.txt*	関数リストを表示する  

a FUnction List for Lazy mE  

Version: 1.0  
Author : minanon &lt;sumi.minano@gmail.com&gt;  
License :  {{{}}}  

##目次
概要				`fulle-introduction`  
使い方				`fulle-usage`  
インストール			`fulle-install`  
インターフェイス		`fulle-interface`  
変数				  `fulle-variables`  
コマンド			  `fulle-commands`  
関数				  `fulle-functions`  
設定例				`fulle-examples`  
TODO				`fulle-todo`  
更新履歴			`fulle-changelog`  


##概要
*fulle* は、quickfixウィンドウに関数のリストを表示します。  
リストの関数名上Enterキーを押すことで、該当行を表示することができます。  

最新版:  
https://github.com/minanon/fulle.vim  


##使い方
縦分割し、右端に関数リストを表示する場合  

```vim
:Fulle
```


または、  


```vim
:FulleVertical
```



水平分割し、下部に関数リストを表示する場合  


```vim
:FulleHorizontal
```



##インストール
配布ファイルをVimスクリプトのディレクトリへインストールしてください。 (普通は ~/.vim/ またはWindowsの場合、 $HOME/vimfiles)  

インストールに成功すると、`:Fulle`コマンドでfulleを実行することができます。  


##インターフェイス
###変数
###g:fulle_function_pattern
filetypeに対して、関数を取り出すパターンを記述します。  

既定値:  

```vim
{
\ 'php'        : '/\c\vfunction\s+.*\(|^\s*class\s+.*/',
\ 'ruby'       : '/^\s*def\s\=(*)*/',
\ 'vim'        : '/function!\= \+\(.*\)/',
\ 'pascal'     : '/\c\vprocedure|function\s+.*\(/',
\ 'javascript' : '/\c\vfunction\s*.*\(/',
\ 'perl'       : '/\c\v^\s*sub\s+[^{]*/',
```

\}  
<  


###g:fulle_exclude_pattern_from_list
上記パターンを用いて取り出したリストから、不要な文字列を削除するためのパターンを記述します。   
既定値:  

```vim
{
\ 'javascript' : '/\c\v.{-}\|(\d*).{-}\|.{-}(([a-zA-Z0-9\.]+)\s*[\=:])?\s*function\s*([a-zA-Z0-9\.]*)\s*(\(.{-}\)).*\{?/\1:\3\4\5/',
\ 'perl'       : '/\c\v.*\|(\d*)\s.*\|\s*.*(sub)/\1:\2/',
\ 'vim'        : '/\c\v.*\|(\d*)\s.*\|\s*.*function!?/\1:/',
```

\}  
<  
設定値以外の場合:  

```vim
/\c\v.*\|(\d*)\s.*\|\s*.*(function`(class)`procedure)/\1:\3/
```




###g:fulle_window_width
Fulleまたは、FulleVerticalで、 quickfixウィンドウを縦分割で開く際の幅を指定します。  

既定値: 30  


###g:fulle_window_height
FulleHorizontalで、quickfixウィンドウを水平分割で開く際の高さを指定します。  

既定値: 6  


###コマンド
###:Fulle
関数リストを縦分割して開きます。  
内部的にfulle#listup_vertical()を呼び出します。  


###:FulleVertical
関数リストを縦分割して開きます。  


###:FulleHorizontal
関数リストを水平分割して開きます。  


###関数
fulle#listup()					*fulle#listup()*  
関数リストを縦分割して開きます。  
fulle#listup_vertical()へのエイリアスとなっています。  

fulle#listup_vertical()				*fulle#listup_vertical()*関数リストを縦分割して開きます。  


fulle#listup_horizontal()			*fulle#listup_horizontal()*関数リストを水平分割して開きます。  

##設定例

```vim
map <silent> <C-T> :Fulle<CR>
```



##TODO

##更新履歴
doc/fulle.txtを参照してください。  
vim:tw=78:ts=8:ft=help:norl:noet:fen:  
