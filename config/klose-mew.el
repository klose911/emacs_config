;;;;;;;;;;;;;;;;;;;;; 
;;启动和初始化mew的设置 
;;将emacs收发邮件的默认设置为gnus改为mew 
;;;;;;;;;;;;;;;;;;;;; 
(autoload 'mew "mew" nil t) 
(autoload 'mew-send "mew" nil t) 
(if (string-equal system-type "windows-nt")
    ;; Note,in windows,you must use replace stunnel4 with stunnel3 version.
    (setq mew-prog-ssl  "C:/Program Files/stunnel/stunnel.exe")
  (setq mew-prog-ssl "/usr/bin/stunnel"))

;;设定图表所在文件夹，这个和w3m类似，如果不正确，mew无法启动 
;;(setq mew-icon-directory "/usr/share/mew") 
(if (boundp 'read-mail-command) 
    (setq read-mail-command 'mew)) 
(autoload 'mew-user-agent-compose "mew" nil t) 
(if (boundp 'mail-user-agent) 
    (setq mail-user-agent 'mew-user-agent)) 
(if (fboundp 'define-mail-user-agent) 
    (define-mail-user-agent 
      'mew-user-agent 
      'mew-user-agent-compose 
      'mew-draft-send-message 
      'mew-draft-kill 
      'mew-send-hook)) 


;;;;;;;;;;;;;;;;;;;;;; 
;;信件引用设置 
;;;;;;;;;;;;;;;;;;;;;; 
(setq mew-cite-fields '("From:" "Subject:" "Date:" "Message-ID:")) 
(setq mew-cite-format "From: %s\nSubject: %s\nDate: %s\nMessage-ID: %s\n\n") 
(setq mew-cite-prefix-function 'mew-cite-prefix-username) 


;;;;;;;;;;;;;;;;;;;;; 
;;用w3m来读html格式邮件 
;;w3m的使用将在以后讲到 
;;;;;;;;;;;;;;;;;;;;; 
(setq mew-mime-multipart-alternative-list '("Text/Html" "Text/Plain" "*.")) 
(condition-case nil 
    (require 'mew-w3m) 
  (file-error nil)) 


;;;;;;;;;;;;;;;;; 
;;一些其他设置，未归类 
;;;;;;;;;;;;;;;;; 
(setq mew-pop-size 0) 
(setq toolbar-mail-reader 'Mew) 
;;(set-default 'mew-decode-quoted 't)   
;;设定公共钥匙所用程序，下面采用的是GnuPG 
;;(setq mew-prog-pgp "gpg") 


;;;;;;;;;;;; 
;;设定用户信息 
;;;;;;;;;;;; 
(setq mew-name "Wu, Shanliang") 
(setq mew-user "klose911") 


;;;;;;;;;;;; 
;;设定smtp服务器 
;;个人原因，这里不列出我的正确Email 
;;;;;;;;;;;; 
(setq mew-smtp-user "klose911@gmail.com") 
(setq mew-mail-domain "gmail.com") 
(setq mew-smtp-server "smtp.gmail.com") 
(setq mew-smtp-ssl t)
(setq mew-smtp-ssl-port "587")
(setq mew-smtp-port "587")
(setq mew-tls-smtp "smtp")
(setq mew-ssl-verify-level 0)
;;smtp服务器认证设定 
(setq mew-smtp-auth-list (quote ("CRAM-MD5" "LOGIN" "PLAIN"))) 
;;smtp服务器不用认证采用下面设定 
					;(setq mew-smtp-auth-list nil) 


;;;;;;;;;;; 
;;设定pop3服务器 
;;个人原因，这里不列出我的正确Email 
;;;;;;;;;;; 
(setq mew-pop-server "boco.com.cn") 
(setq mew-pop-user "wushanliang@boco.com.cn") 
(setq mew-pop-auth 'pass) ;;认证方式 
(setq mew-pop-delete nil) ;;将邮件留在服务器上 

;;;;;;;;;;;; 
;;设定将密码保存一段时间，默认20分钟 
;;;;;;;;;;;; 
(setq mew-use-cached-passwd t) 
;;gnus可以将密码放在配置文件里，收邮件的时候就不用输入密码了 
;;我找了一下，发现下面这个变量应该有类似功能，但没有搞掂，高人帮忙！ 
					;(setq mew-passwd-alist '(hvjhvjhvj) 

;;;;;;;;;;;;;;;;;;;;; 
;;语言设置 
;;这个不知道有用没，好像在下一版emacs对unicode支持好了就可以了 
;;当然这个试用emacs-cvs 
;;;;;;;;;;;;;;;;;;;;; 
;; (when (boundp 'utf-translate-cjk) 
;;   (setq utf-translate-cjk t) 
;;   (custom-set-variables 
;;    '(utf-translate-cjk t))) 
;; (if (fboundp utf-translate-cjk-mode) 
;;     (utf-translate-cjk-mode 1)) 
