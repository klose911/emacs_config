;首先指定默认的英文等宽字体 
;(set-default-font "DejaVu Sans Mono") 
(if *mac* 
  (progn 
	(set-frame-font "Monaco:pixelsize=18")
	(dolist (charset '(han kana symbol cjk-misc bopomofo))
	  (set-fontset-font (frame-parameter nil 'font)
						charset
						(font-spec :family "Hiragino Sans GB" :size 20)
						))) 
  (custom-set-faces
	;; custom-set-faces was added by Custom.
	;; If you edit it by hand, you could mess it up, so be careful.
	;; Your init file should contain only one such instance.
	;; If there is more than one, they won't work right.
	'(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 158 :width normal :foundry "outline" :family "Lucida Sans"))))))

