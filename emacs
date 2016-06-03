;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hans Ve Joanphan's dotemacs file
;;; Last modified time 
;;; Time-stamp: <klose 06/04/2016 0002M02S>
;;; Life is a box of chocalates,
;;; you never know what you're gonna get.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;以上是我得time stamp，在后面将有详细讲解
;;设置你的全名和邮件，在发邮件时可以用到
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
;;(load "~/.emacs.d/config/klose-vim")
(load "~/.emacs.d/config/klose-org-mode")
(load "~/.emacs.d/config/klose-wiki")
(load "~/.emacs.d/config/klose-browser-kill-ring")
(load "~/.emacs.d/config/klose-swbuff")
(load "~/.emacs.d/config/klose-tabbar")
(load "~/.emacs.d/config/klose-rect-mark")
(load "~/.emacs.d/config/klose-setnu")
(load "~/.emacs.d/config/klose-mew")
(load "~/.emacs.d/config/klose-erc")
(load "~/.emacs.d/config/klose-gnus") 
(load "~/.emacs.d/config/klose-emms")
(load "~/.emacs.d/config/klose-w3m")
(load "~/.emacs.d/config/klose-clisp")
(load "~/.emacs.d/config/klose-scheme")
(load "~/.emacs.d/config/klose-clojure")
(load "~/.emacs.d/config/klose-clojure-cider.el")
(load "~/.emacs.d/config/klose-ctypes")
;;(load "~/.emacs.d/config/klose-cedet")
;;(load "~/.emacs.d/config/klose-ecb")
(load "~/.emacs.d/config/klose-cc")
(load "~/.emacs.d/config/klose-android")
(load "~/.emacs.d/config/klose-cflow")
(load "~/.emacs.d/config/klose-auctex")
(load "~/.emacs.d/config/klose-js")
(load "~/.emacs.d/config/klose-key-binding")
;;这个东西必须放在最后
;;desktop.el是一个可以保存你上次emacs关闭时的状态，下一次启动时恢复为上次关闭的状态。就和vmware的suspend一样。
;;因为我要使用sawfish-mode,wiki-mode,html-helper-mode，放在这里才能保证下次启动时能正确辨认文件需要的模式。
(load "desktop")
(desktop-load-default) 
(desktop-read) 