;; (add-to-list 'load-path "~/.emacs.d/elisp/emacs-w3m")
;;启动和初始化w3m.el 
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t) 
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t) 
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t) 
;;使用mule-ucs，只有在你安装mule-ucs elisp扩展包时这个才有用，可以看Unicode解码的网页 
;(setq w3m-use-mule-ucs t) 
;;使用工具包 
(setq w3m-use-toolbar t) 
;;启用cookie 
(setq w3m-use-cookies t) 
;;设定w3m图标所在文件夹，gentoo的默认安装位置就是如下，大家可以根据自己的情况改一下 
;(setq w3m-icon-directory "/usr/share/emacs-w3m/emacs-w3m/icon") 
;;设定w3m运行的参数，分别为使用cookie和使用框架 
(setq w3m-command-arguments '("-cookie" "-F")) 
;;用w3m浏览网页时也显示图片 
(setq w3m-display-inline-image t) 
;;设定w3m的语言设置，以便方便使用和阅读中文 
;;书签解码设置 
(setq w3m-bookmark-file-coding-system 'gbk) 

;; (setq w3m-command-arguments
;;                 (nconc w3m-command-arguments
;;                        '("-o" "http_proxy=http://127.0.0.1:8080/")))

;;w3m的解码设置，后面最好都有，我也不详解了 
;(setq w3m-coding-system 'chinese-iso-8bit) 
;(setq w3m-default-coding-system 'chinese-iso-8bit) 
;(setq w3m-file-coding-system 'chinese-iso-8bit) 
;(setq w3m-file-name-coding-system 'chinese-iso-8bit) 
;(setq w3m-terminal-coding-system 'chinese-iso-8bit) 
;(setq w3m-input-coding-system 'chinese-iso-8bit) 
;(setq w3m-output-coding-system 'chinese-iso-8bit) 
;;w3m是使用tab的，设定Tab的宽度 
(setq w3m-tab-width 8) 
;;设定w3m的主页，同mozilla的默认主页一样 
;;(setq w3m-home-page "file://home/klose/.w3m/bookmark.html") 
(setq w3m-home-page "http://www.google.com") 
;;以下都给倒忘了 
(setq w3m-view-this-url-new-session-in-background t) 
(add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages) 
;;好像是有利于中文搜索的 
(defun remove-w3m-output-garbages () 
  (interactive) 
  (let ((buffer-read-only)) 
    (setf (point) (point-min)) 
    (while (re-search-forward "[\200-\240]" nil t) 
      (replace-match " ")) 
    (set-buffer-multibyte t)) 
  (set-buffer-modified-p nil))  
