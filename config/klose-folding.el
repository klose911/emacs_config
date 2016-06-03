(load-library  "folding")
(declare (special fold-fold-on-startup
		  fold-keys-already-setup
		  ))

(setq fold-fold-on-startup t)
(folding-mode-add-find-file-hook)

(setq fold-keys-already-setup nil)
(add-hook 'folding-mode-hook
	  (function (lambda()
		      (unless fold-keys-already-setup
			(setq fold-keys-already-setup t)
			(define-prefix-command 'ctl-f-folding-mode-prefix)
			(define-key 'ctl-f-folding-mode-prefix "f" 'fold-fold-region)
			(define-key  'ctl-f-folding-mode-prefix "e" 'fold-enter)
			(define-key 'ctl-f-folding-mode-prefix "x" 'fold-exit)
			(define-key  'ctl-f-folding-mode-prefix "b" 'fold-whole-buffer)
			(define-key 'ctl-f-folding-mode-prefix "o" 'fold-open-buffer)
			(define-key 'ctl-f-folding-mode-prefix "h" 'fold-hide)
			(define-key 'ctl-f-folding-mode-prefix "s" 'fold-show)
			(define-key 'ctl-f-folding-mode-prefix "t" 'fold-top-level)
			(define-key 'ctl-f-folding-mode-prefix "f" 'fold-fold-region)
			)
		      (local-set-key "\C-f" 'ctl-f-folding-mode-prefix))))

(folding-add-to-marks-list 'sgml-mode
			   "<!-- {" 
			   "<!-- } -->" " --> ")
(folding-add-to-marks-list 'c-mode "/* <" "/* > */" "*/")
(folding-add-to-marks-list 'c++-mode "//<" "//>" "")
(folding-add-to-marks-list 'LaTeX-mode "%%% {{{" "%%% }}}" " ")
(folding-add-to-marks-list 'latex2e-mode "%%% {{{" "%%% }}}" " ")
(folding-add-to-marks-list 'latex-mode "%%%% {{{" "%%%% }}}" " ")
(folding-add-to-marks-list 'BibTeX-mode "%%% {{{" "%%% }}}" " ")
(folding-add-to-marks-list 'lisp-mode ";;; {" ";;; }" "")
(folding-add-to-marks-list 'lex-mode" /* {{{ " " /* }}} */ " "*/")
(folding-add-to-marks-list 'html-mode "<!-- { " "<!-- } -->" "-->")
(folding-add-to-marks-list 'shell-script-mode "# {{{" "# }}}" nil)
(folding-add-to-marks-list 'sh-mode "# {{{ " "# }}}" nil)
