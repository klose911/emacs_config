(require 'python)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(if *win*
    (progn 
      (setq python-shell-interpreter "D:/utils/python3/python.exe")
      (add-to-list 'exec-path "D:/utils/python3") 
      (add-to-list 'interpreter-mode-alist '("python.exe" . python-mode))))  
