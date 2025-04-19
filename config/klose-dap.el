(require 'dap-lldb)

(setq dap-lldb-debug-program '("/usr/local/bin/lldb-dap"))

(setq dap-auto-configure-features (remove 'controls dap-auto-configure-features))

;; (defcustom dap-lldb-debug-program `(,(expand-file-name "/usr/local/bin/lldb-dap"))
;;   "The path to the LLDB debugger."
;;   :group 'dap-lldb
;;   :type '(repeat string))


;; (setq dap-auto-configure-features '(sessions locals tooltip))

;; (dap-mode 1)

;; The modes below are optional

;; (dap-ui-mode 1)
;; enables mouse hover support
;; (dap-tooltip-mode 1)
;; use tooltips for mouse hover
;; if it is not enabled `dap-mode' will use the minibuffer.
;; (tooltip-mode 1)
;; displays floating panel with debug buttons
;; requies emacs 26+
;; (dap-ui-controls-mode 1)

