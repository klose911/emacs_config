;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hans Ve Joanphan's dotemacs file
;;; Last modified time 
;;; Time-stamp: <I514692 11/19/2021 1802M02S>
;;; Life is a box of chocalates,
;;; you never know what you're gonna get.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;�������ҵ�time stamp���ں��潫����ϸ����
;;�������ȫ�����ʼ����ڷ��ʼ�ʱ�����õ�

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
;;���������ǩ�ļ���Ĭ����~/.emacs.bmk����ϲ�����й�emacs���ļ���������һ���ļ��У����Ծ��޸��ˡ�
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")

(setq *win* (eq system-type 'windows-nt))

;;�������Դʵ��ļ�������ǵ���
(setq abbrev-file-name "~/.emacs.d/.abbrev_defs")
;;load-path��ͬbash�е�$PATH���ƣ�emacs����Ҫ��Elisp��������load-path����ļ����У�~/.emacs.d/elisp�����Լ���ӵ�Elisp��
(setq load-path (cons "~/.emacs.d/elisp" load-path))
;;����info��·����Ҳ��ͨ��Shell��ȫ�ֱ���$INFOPATH����
(add-to-list 'Info-default-directory-list "~/local/info/")
;;�ɲ˵��޸����õĶ������ᱣ����custom-file����������������ҵ�elisp�ļ���Ӫ��
;;(setq custom-file "~/.emacs.d/elisp/klose-custom.el")
;;����gnus�������ļ���Ĭ����Ϊ~/.gnus.el
;;(setq gnus-init-file "~/.emacs.d/elisp/klose-gnus.el")
;;�����ҵ������ļ��ܳ������԰��շ���ֱ���ڲ�ͬ���ļ���������
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
;;�����������������
;;desktop.el��һ�����Ա������ϴ�emacs�ر�ʱ��״̬����һ������ʱ�ָ�Ϊ�ϴιرյ�״̬���ͺ�vmware��suspendһ����
;;��Ϊ��Ҫʹ��sawfish-mode,wiki-mode,html-helper-mode������������ܱ�֤�´�����ʱ����ȷ�����ļ���Ҫ��ģʽ��
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
