#fulle.vim
View function list

*fulle.txt*	View function list  

a FUnction List for Lazy mE  

Version: 1.0  
Author : minanon &lt;sumi.minano@gmail.com&gt;  
License :  {{{}}}  

##Contents
Introduction				`fulle-introduction`  
Usage				`fulle-usage`  
Install			`fulle-install`  
Interface		`fulle-interface`  
Variables				  `fulle-variables`  
Commands			  `fulle-commands`  
Functions				  `fulle-functions`  
Examples				`fulle-examples`  
TODO				`fulle-todo`  
ChangeLog			`fulle-changelog`  


##INTRODUCTION
*fulle* view function list.  
If you push enter on function name, you can see it line.  

latest:  
https://github.com/minanon/fulle.vim  


##USAGE
Incase of vertical split view list on right  

```vim
:Fulle
```


or  


```vim
:FulleVertical
```



Incase of horizontal  split view list on bottom  


```vim
:FulleHorizontal
```



##INSTALL
Install the distributed files into your Vim script directory which is usually ~/.vim/, or $HOME/vimfiles on Windows.  

After installation you can run unite with the `:Fulle` command.  


##INTERFACE
###VARIABLES
###g:fulle_function_pattern
You can set function line pattern each *filetype* .  

default:  

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
This setting remove unnecessary string from function list.  
	
default:  

```vim
{
\ 'javascript' : '/\c\v.{-}\|(\d*).{-}\|.{-}(([a-zA-Z0-9\.]+)\s*[\=:])?\s*function\s*([a-zA-Z0-9\.]*)\s*(\(.{-}\)).*\{?/\1:\3\4\5/',
\ 'perl'       : '/\c\v.*\|(\d*)\s.*\|\s*.*(sub)/\1:\2/',
\ 'vim'        : '/\c\v.*\|(\d*)\s.*\|\s*.*function!?/\1:/',
```

\}  
<  
not exist type on setting:  

```vim
/\c\v.*\|(\d*)\s.*\|\s*.*(function`(class)`procedure)/\1:\3/
```




###g:fulle_window_width
This setting is width for Fulle or FulleVertical open quickfix window  

default: 30  


###g:fulle_window_height
This setting is height for Fulle or FulleVertical open quickfix window  

default: 6  


###COMMANDS
###:Fulle
This split vertical window and open function list.  
This call fulle#listup_vertical() in internal process.  


###:FulleVertical
This split vertical window and open function list.  


###:FulleHorizontal
This split horizontal window and open function list.  


###FUNCTIONS
fulle#listup()					*fulle#listup()*  
This split vertical window and open function list.  
This is alias to fulle#listup_vertical().  
 
fulle#listup_vertical()				*fulle#listup_vertical()* This split vertical window and open function list.  


fulle#listup_horizontal()			*fulle#listup_horizontal()* This split horizontal window and open function list.   
##EXAMPLES

```vim
map <silent> <C-T> :Fulle<CR>
```



##TODO

##CHANGELOG
2014-10-8  

- Ver.1.0 public this plugin.

vim:tw=78:ts=8:ft=help:norl:noet:fen:  
