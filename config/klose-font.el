					;首先指定默认的英文等宽字体 
					;(set-default-font "DejaVu Sans Mono") 


(set-frame-font "Monaco:pixelsize=18")
(dolist (charset '(han kana symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Hiragino Sans GB" :size 20)
		    ))
