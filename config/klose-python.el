(require 'python)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(if *win*
    (progn 
      (setq python-shell-interpreter "C:\\Anaconda2\\python.exe"
	    python-shell-interpreter-args "-i C:\\Anaconda2\\Scripts\\ipython2-script.py console")
      (add-to-list 'exec-path "c:\\Anaconda2") 
      (add-to-list 'interpreter-mode-alist '("python.exe" . python-mode))))  
