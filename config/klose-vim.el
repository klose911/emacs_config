(add-to-list 'load-path "/home/klose/.emacs.d/elisp/vimpulse")   
(setq viper-mode t)                ; enable Viper at load time   
(setq viper-ex-style-editing nil)  ; can backspace past start of insert / line   
(require 'viper)                   ; load Viper   
(require 'vimpulse)                ; load Vimpulse   
(setq woman-use-own-frame nil)     ; don't create new frame for manpages   
(setq woman-use-topic-at-point t)
