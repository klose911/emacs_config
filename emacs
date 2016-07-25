;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hans Ve Joanphan's dotemacs file
;;; Last modified time 
;;; Time-stamp: <klose.wu 07/25/2016 1102M02S>
;;; Life is a box of chocalates,
;;; you never know what you're gonna get.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;�������ҵ�time stamp���ں��潫����ϸ����
;;�������ȫ�����ʼ����ڷ��ʼ�ʱ�����õ�
(setq *win* (eq system-type 'windows-nt))
(setq *linux* (eq system-type 'gnu/linux))
(setq user-full-name "Wu, Shanliang")
(setq user-mail-address "klose911@gmail.com")
;;���������ǩ�ļ���Ĭ����~/.emacs.bmk����ϲ�����й�emacs���ļ���������һ���ļ��У����Ծ��޸��ˡ�
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")
;;�������Դʵ��ļ�������ǵ���
(setq abbrev-file-name "~/.emacs.d/.abbrev_defs")
;;load-path��ͬbash�е�$PATH���ƣ�emacs����Ҫ��Elisp��������load-path����ļ����У�~/.emacs.d/elisp�����Լ���ӵ�Elisp��
(setq load-path (cons "~/.emacs.d/elisp" load-path))
;;����info��·����Ҳ��ͨ��Shell��ȫ�ֱ���$INFOPATH����
(add-to-list 'Info-default-directory-list "~/local/info/")
(if *win*
    (setq exec-path (append exec-path '("d:/util/cygwin/bin"))))
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
(load "~/.emacs.d/config/klose-mew")
(load "~/.emacs.d/config/klose-erc")
(load "~/.emacs.d/config/klose-gnus") 
(load "~/.emacs.d/config/klose-emms")
(load "~/.emacs.d/config/klose-clisp")
(load "~/.emacs.d/config/klose-scheme")
(load "~/.emacs.d/config/klose-clojure")
(load "~/.emacs.d/config/klose-clojure-cider.el")
(load "~/.emacs.d/config/klose-ctypes")
(load "~/.emacs.d/config/klose-cedet")
(load "~/.emacs.d/config/klose-ecb")
(load "~/.emacs.d/config/klose-cc")
(load "~/.emacs.d/config/klose-cflow") 
(load "~/.emacs.d/config/klose-js")
(load "~/.emacs.d/config/klose-key-binding")
(if (not *win*) 
(load "~/.emacs.d/config/klose-auctex"))  
;;�����������������
;;desktop.el��һ�����Ա������ϴ�emacs�ر�ʱ��״̬����һ������ʱ�ָ�Ϊ�ϴιرյ�״̬���ͺ�vmware��suspendһ����
;;��Ϊ��Ҫʹ��sawfish-mode,wiki-mode,html-helper-mode������������ܱ�֤�´�����ʱ����ȷ�����ļ���Ҫ��ģʽ��
(load "desktop")
(desktop-load-default) 
(desktop-read) 
