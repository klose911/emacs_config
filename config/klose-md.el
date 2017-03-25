(require 'markdown-mode)
(require 'markdown-preview-mode)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq markdown-command "markdown2") 
