(require 'swbuff)
(global-set-key [(f11)] 'swbuff-switch-to-previous-buffer)
(global-set-key [(f12)] 'swbuff-switch-to-next-buffer)
(setq swbuff-exclude-buffer-regexps 
     '("^ " "\\*.*\\*"))

(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)





