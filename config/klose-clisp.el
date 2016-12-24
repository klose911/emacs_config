

;;(add-to-list 'load-path "~/.emacs.d/elisp/slime")
(require 'slime)
(slime-setup)
					;(slime) ;M-x slime
(require 'slime-autoloads)
(slime-setup '(slime-fancy))


(if *win* 
    (progn
      (setq inferior-lisp-program "D:/util/clisp/clisp.exe")
      (setq temporary-file-directory "C:\\Documents and Settings\\klose.wu\\Local Settings\\Temp") 
      (setq slime-net-coding-system 'utf-8-unix)) 
  (setq inferior-lisp-program "clisp"))  

(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
    (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))
