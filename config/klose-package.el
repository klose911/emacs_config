;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)

(custom-set-variables
 '(package-selected-packages
   (quote
    (kotlin-mode erlang xcscope rust-mode cargo toml-mode py-autopep8 flycheck jedi elpy yaml-mode window-numbering w3m virtualenvwrapper virtualenv slime session racket-mode psgml mpg123 mew markdown-preview-mode magit inf-ruby htmlize go-dlv go-autocomplete folding emms ecb cygwin-mount cider auctex))))

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

(package-install-selected-packages)

;; install the missing packages
;; (dolist (package package-list)
;;   (unless (package-installed-p package)
;;     (package-install package)))
