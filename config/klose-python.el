(require 'python)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; (require 'elpy)
;; (elpy-enable)

;; (define-key global-map (kbd "C-c o") 'iedit-mode)

;;(add-hook 'after-init-hook #'global-flycheck-mode);全局开启
;;(when (require 'flycheck nil t)
;;  (setq elpy-modules(delq 'elpy-module-flymake elpy-modules))
;;  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "D:/home/I514692/virtualenv"); setup virtual environment folder
;; if there multiple folder:
;; (setq venv-location '("~/myvenv-1/"
;;                       "~/myvenv-2/"))
;; M-x venv-workon open virtual environment

;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
