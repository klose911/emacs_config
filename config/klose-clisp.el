

;;(add-to-list 'load-path "~/.emacs.d/elisp/slime")
(require 'slime)
(slime-setup)
					;(slime) ;M-x slime
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

(setq inferior-lisp-program "sbcl.exe")
(setq temporary-file-directory "C:/Users/I514692/AppData/Local/Temp") 
(setq slime-net-coding-system 'utf-8-unix)

(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
    (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))

(setq slime-lisp-host "localhost") 
