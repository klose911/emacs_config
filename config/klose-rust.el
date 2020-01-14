(require 'rust-mode)
(require 'cargo)

(setq auto-mode-alist
	  (append
	   '(("\\.rs\\'" . rust-mode))
	   auto-mode-alist))

(add-hook 'rust-mode-hook 'cargo-minor-mode)
