;; (require 'twittering-mode)
;; (setq twittering-use-ssl nil
;;       twittering-oauth-use-ssl nil)
;; (setq twittering-icon-mode 1)
;; (setq twittering-enabled-services '(sina))
;; (setq twittering-accounts '((sina (username "klose911@hotmail.com")
;; 				  (auth oauth))))

(add-to-list 'load-path "~/.emacs.d/elisp/weibo")
(require 'weibo) 
