(global-set-key [f1] 'info) 
(global-set-key [f2] 'undo) 
(global-set-key [f3] 'redo) 
(global-set-key [f4] 'kill-buffer) 
(global-set-key [f5] 'eshell) 
(global-set-key [f6] 'dired) 
(global-set-key [f7] 'compile) 
(global-set-key [f8] 'gdb) 
(global-set-key [f9] 'menu-bar-open) 


(global-set-key [(home)] 'beginning-of-buffer) 
(global-set-key [(end)] 'end-of-buffer) 

(global-set-key [(meta down)] 'goto-line) 
(global-set-key [(meta left)] 'backward-sexp) 
(global-set-key [(meta right)] 'forward-sexp) 

(global-set-key (kbd "C-c m") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;;(define-key global-map "\M-." 'ggtags-find-tag-dwim)
(define-key global-map "\M-*" 'pop-tag-mark)
