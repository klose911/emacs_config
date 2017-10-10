;;git-emacs
;;(add-to-list 'load-path "~/.emacs.d/elisp/git-emacs")
(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
