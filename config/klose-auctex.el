;; (if *win*
;;     (add-to-list 'load-path
;; 		 "~/.emacs.d/elisp/auctex/share/emacs/site-lisp/site-start.d"))

(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode))
      (list ;;'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'default       ; use xelatex default
                  TeX-show-compilation t
		  LaTeX-document-regexp "document\\|CJK\\*?" ; display compilation windows
		  LaTeX-fill-break-at-separators '(} \\\) \\\])) 
            (TeX-PDF-mode t)       ; PDF mode enable, not plain 
	    (progn (setq TeX-view-program-list '(("Evince" "evince %o")))
				  (setq TeX-view-program-selection '((output-pdf "Evince")))) 
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
	    
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))

