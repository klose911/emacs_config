(load-file "~/.emacs.d/elisp/cedet/cedet-devel-load.el") 
;;(require 'cedet)
(semantic-mode 1)
(global-ede-mode 1)

(setq semanticdb-project-roots 
      (list
       (expand-file-name "/")))

(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command))
  )

(global-set-key [(control tab)] 'my-indent-or-complete)

(autoload 'senator-try-expand-semantic "senator")

(setq hippie-expand-try-functions-list
      '(
	senator-try-expand-semantic
	try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-expand-list
	try-expand-list-all-buffers
	try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
      )

;; (global-semantic-tag-folding-mode 1)

;; Key bindings
;;(defun my-cedet-hook ()
;;  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;  (local-set-key "\C-cd" 'semantic-ia-fast-jump)
;;  (local-set-key "\C-cr" 'semantic-symref-symbol)
;;  (local-set-key "\C-cR" 'semantic-symref))
;;(add-hook 'c-mode-common-hook 'my-cedet-hook)
 
;;automatically show memeber of struct
;;(defun my-c-mode-cedet-hook ()
;;  (local-set-key "." 'semantic-complete-self-insert)
;;  (local-set-key ">" 'semantic-complete-self-insert))
;;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
