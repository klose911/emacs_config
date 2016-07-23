(require 'python)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(if *win*
    (progn 
      (add-to-list 'exec-path "c:/Python27/") 
      (add-to-list 'interpreter-mode-alist '("python.exe" . python-mode))))  
