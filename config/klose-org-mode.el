(require 'org-install)
(require 'htmlize) 
(setq org-src-fontify-natively t)

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 1)
    (org-edit-src-code)))

(defun klose-html-postamble (info)
  "Org-mode website HTML export preamble."
  (format "
<div id=\"uyan_frame\"></div>
<script type=\"text/javascript\" src=\"http://v2.uyan.cc/code/uyan.js?uid=2124392\"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-90850421-1', 'auto');
  ga('send', 'pageview');
</script>
"))


(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-coding-alist '("\\.org\\'" . utf-8))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(add-hook 'org-mode-hook 
	  (lambda ()
	    (setq truncate-lines nil)
	    ;; C-TAB for expanding
	    (local-set-key (kbd "C-<tab>")
			   'yas/expand-from-trigger-key)
	    ;; keybinding for editing source code blocks
	    (local-set-key (kbd "C-c s e")
			   'org-edit-src-code)
	    ;; keybinding for inserting code blocks
	    (local-set-key (kbd "C-c s i")
			   'org-insert-src-block)
	    (local-set-key (kbd "C-c s l")
			   'org-store-link)
	    (local-set-key (kbd "C-c s a")
			   'org-agenda)
	    (local-set-key (kbd "C-c s b")
			   'org-iswitchb)
	    ))
