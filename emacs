;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hans Ve Joanphan's dotemacs file
;;; Last modified time 
;;; Time-stamp: <I514692 11/19/2021 1802M02S>
;;; Life is a box of chocalates,
;;; you never know what you're gonna get.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;以上是我得time stamp，在后面将有详细讲解
;;设置你的全名和邮件，在发邮件时可以用到

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (setq package-archives '(("gnu"   . "http://mirrors4.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors4.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(setq byte-compile-warnings '(not nresolved
                                  free-vars
                                  callargs
                                  redefine
                                  obsolete
                                  noruntime
                                  cl-functions
                                  interactive-only
                                  ))

(setq user-full-name "Wu, Shanliang")
(setq user-mail-address "klose911@gmail.com")
;;设置你的书签文件，默认是~/.emacs.bmk，我喜欢把有关emacs的文件尽量放在一个文件夹，所以就修改了。
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")

(setq *win* (eq system-type 'windows-nt))

;;设置缩略词的文件？不大记得了
(setq abbrev-file-name "~/.emacs.d/.abbrev_defs")
;;load-path就同bash中的$PATH相似，emacs所需要的Elisp包都得在load-path里的文件夹中，~/.emacs.d/elisp是我自己添加的Elisp包
(setq load-path (cons "~/.emacs.d/elisp" load-path))
;;设置info的路径，也可通过Shell的全局变量$INFOPATH设置
(add-to-list 'Info-default-directory-list "~/local/info/")
;;由菜单修改配置的东西将会保存在custom-file里，这里我设置他在我的elisp的集中营里
;;(setq custom-file "~/.emacs.d/elisp/klose-custom.el")
;;设置gnus启动的文件。默认是为~/.gnus.el
;;(setq gnus-init-file "~/.emacs.d/elisp/klose-gnus.el")
;;由于我的配置文件很长，所以按照分类分别放在不同的文件里，方便管理
(load "~/.emacs.d/config/klose-basic-config")
(load "~/.emacs.d/config/klose-language")
(load "~/.emacs.d/config/klose-font")
(load "~/.emacs.d/config/klose-session")
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
(load "~/.emacs.d/config/klose-erc")
;;(load "~/.emacs.d/config/klose-gnus")
(load "~/.emacs.d/config/klose-clisp")
(load "~/.emacs.d/config/klose-scheme")
(load "~/.emacs.d/config/klose-racket")
(load "~/.emacs.d/config/klose-clojure")
(load "~/.emacs.d/config/klose-clojure-cider")
(load "~/.emacs.d/config/klose-ctypes")
(load "~/.emacs.d/config/klose-cedet")
(load "~/.emacs.d/config/klose-ecb")
(load "~/.emacs.d/config/klose-go")
(load "~/.emacs.d/config/klose-rust")
(load "~/.emacs.d/config/klose-cc")
(load "~/.emacs.d/config/klose-cflow")
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-tip-of-the-day nil)
 '(package-selected-packages
   (quote
    (xcscope toml-mode toml cargo rust-mode groovy-mode py-autopep8 flycheck jedi elpy yaml-mode window-numbering w3m virtualenvwrapper virtualenv slime session racket-mode psgml mpg123 mew markdown-preview-mode magit inf-ruby htmlize go-dlv go-autocomplete folding emms ecb cygwin-mount cider auctex)))
 '(session-use-package t nil (session))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(virtualenv-root "~/Documents/ml/graphlib/"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 163 :width normal :foundry "outline" :family "Microsoft YaHei")))))
