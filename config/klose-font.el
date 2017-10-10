					;首先指定默认的英文等宽字体 
					;(set-default-font "DejaVu Sans Mono") 
(cond (*mac* 
       (progn 
	 (set-frame-font "Monaco:pixelsize=18")
	 (dolist (charset '(han kana symbol cjk-misc bopomofo))
	   (set-fontset-font (frame-parameter nil 'font)
			     charset
			     (font-spec :family "Hiragino Sans GB" :size 20)
			     ))))
      (*linux* (custom-set-faces
		'(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 159 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))))
      (*bsd* (custom-set-faces
	      '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 137 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))))
      (t 	     
       (custom-set-faces
	'(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 158 :width normal :foundry "outline" :family "Microsoft Yahei")))))))

