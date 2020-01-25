(require 'markdown-mode)
(require 'markdown-preview-mode)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; (if *win*
;;     (setq markdown-command "D:/utils/python3/Lib/site-packages/markdown2.py")
;;   (setq markdown-command "markdown2"))

(setq markdown-command "markdown2")
