;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hans Ve Joanphan's dotemacs file
;;; Last modified time 
;;; Time-stamp: <klose 02/19/2026 2102M02S>
;;; Life is a box of chocalates,
;;; you never know what you're gonna get.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;以上是我得time stamp，在后面将有详细讲解
;;设置你的全名和邮件，在发邮件时可以用到
(setq byte-compile-warnings '(not nresolved
                                  free-vars
                                  callargs
                                  redefine
                                  obsolete
                                  noruntime
                                  cl-functions
                                  interactive-only
                                  ))
(setq *win* (eq system-type 'windows-nt))


(setq user-full-name "Wu, Shanliang")
(setq user-mail-address "klose911@gmail.com")
;;设置你的书签文件，默认是~/.emacs.bmk，我喜欢把有关emacs的文件尽量放在一个文件夹，所以就修改了。
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")
;;设置缩略词的文件？不大记得了
(setq abbrev-file-name "~/.emacs.d/.abbrev_defs")
;;load-path就同bash中的$PATH相似，emacs所需要的Elisp包都得在load-path里的文件夹中，~/.emacs.d/elisp是我自己添加的Elisp包
(setq load-path (cons "~/.emacs.d/elisp" load-path))
;;设置info的路径，也可通过Shell的全局变量$INFOPATH设置
(add-to-list 'Info-default-directory-list "~/local/info/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(auctex cargo cider cygwin-mount dap-mode dirvish elpy emms erlang
	    flycheck folding go-autocomplete go-dlv helm-lsp helm-xref
	    htmlize inf-ruby jedi kotlin-mode lsp-ui magit
	    markdown-preview-mode mew mpg123 nix-mode psgml
	    py-autopep8 racket-mode rime rust-mode session slime
	    sr-speedbar toml-mode treemacs-magit treemacs-projectile
	    virtualenv virtualenvwrapper vterm w3m which-key
	    window-numbering xcscope yaml-mode))
 '(session-use-package t nil (session))
 '(virtualenv-root "~/Documents/ml/"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 159 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;;由菜单修改配置的东西将会保存在custom-file里，这里我设置他在我的elisp的集中营里
;;(setq custom-file "~/.emacs.d/elisp/klose-custom.el")
;;设置gnus启动的文件。默认是为~/.gnus.el
;;(setq gnus-init-file "~/.emacs.d/elisp/klose-gnus.el")
;;由于我的配置文件很长，所以按照分类分别放在不同的文件里，方便管理
(load "~/.emacs.d/config/klose-package")
(load "~/.emacs.d/config/klose-basic-config")
(load "~/.emacs.d/config/klose-language")
(load "~/.emacs.d/config/klose-rime")
(load "~/.emacs.d/config/klose-treemacs")
(load "~/.emacs.d/config/klose-vterm")
(load "~/.emacs.d/config/klose-session")
;; (load "~/.emacs.d/config/klose-font")
(load "~/.emacs.d/config/klose-eshell")
(load "~/.emacs.d/config/klose-calendar")
(load "~/.emacs.d/config/klose-ibuffer")
(load "~/.emacs.d/config/klose-ido")
(load "~/.emacs.d/config/klose-function")
(load "~/.emacs.d/config/klose-folding")
(load "~/.emacs.d/config/klose-git")
(load "~/.emacs.d/config/klose-org-mode")
(load "~/.emacs.d/config/klose-browser-kill-ring")
(load "~/.emacs.d/config/klose-swbuff")
(load "~/.emacs.d/config/klose-tabbar")
(load "~/.emacs.d/config/klose-rect-mark")
(load "~/.emacs.d/config/klose-setnu")
;;(load "~/.emacs.d/config/klose-mew")
;;(load "~/.emacs.d/config/klose-erc")
;;(load "~/.emacs.d/config/klose-gnus")
;;(load "~/.emacs.d/config/klose-emms")
(load "~/.emacs.d/config/klose-w3m")
(load "~/.emacs.d/config/klose-clisp")
(load "~/.emacs.d/config/klose-scheme")
(load "~/.emacs.d/config/klose-racket")
(load "~/.emacs.d/config/klose-erlang")
(load "~/.emacs.d/config/klose-clojure")
(load "~/.emacs.d/config/klose-clojure-cider")
(load "~/.emacs.d/config/klose-lsp")
(load "~/.emacs.d/config/klose-gdb")
(load "~/.emacs.d/config/klose-dap")
(load "~/.emacs.d/config/klose-cflow")
;; (load "~/.emacs.d/config/klose-cc")
;; (load "~/.emacs.d/config/klose-ctypes")
;; (load "~/.emacs.d/config/klose-cedet")
;;(load "~/.emacs.d/config/klose-ecb")
(load "~/.emacs.d/config/klose-go")
(load "~/.emacs.d/config/klose-rust")
;; (load "~/.emacs.d/config/klose-kotlin")
(load "~/.emacs.d/config/klose-python")
(load "~/.emacs.d/config/klose-ruby") 
(load "~/.emacs.d/config/klose-js")
(load "~/.emacs.d/config/klose-yaml")
(load "~/.emacs.d/config/klose-md")
(load "~/.emacs.d/config/klose-key-binding")
(load "~/.emacs.d/config/klose-auctex")  
;;这个东西必须放在最后
;;desktop.el是一个可以保存你上次emacs关闭时的状态，下一次启动时恢复为上次关闭的状态。就和vmware的suspend一样。
;;因为我要使用sawfish-mode,wiki-mode,html-helper-mode，放在这里才能保证下次启动时能正确辨认文件需要的模式。
;; (load "desktop")
;; (desktop-load-default) 
;; (desktop-read) 
