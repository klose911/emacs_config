(require 'dap-cpptools)

(setq dap-auto-configure-features '(sessions locals controls tooltip))

(dap-mode 1)

;; The modes below are optional

(dap-ui-mode 1)
;; enables mouse hover support
(dap-tooltip-mode 1)
;; use tooltips for mouse hover
;; if it is not enabled `dap-mode' will use the minibuffer.
(tooltip-mode 1)
;; displays floating panel with debug buttons
;; requies emacs 26+
(dap-ui-controls-mode 1)


;; (setq url-proxy-services
;;    '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
;;      ("http" . "127.0.0.1:8800")
;;      ("https" . "127.0.0.1:8800")))

;; (setq url-http-proxy-basic-auth-storage
;;     (list (list "127.0.0.1:8800"
;;                 (cons "Input your LDAP UID !"
;;                       (base64-encode-string "klose911:c8a9fda05")))))
