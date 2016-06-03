(add-to-list 'load-path "~/.emacs.d/elisp/emacs-wiki")

(require 'emacs-wiki)
(require 'emacs-wiki-table)
(require 'emacs-wiki-menu)

(add-hook 'emacs-wiki-mode-hook
	  (lambda ()
	    (define-key emacs-wiki-mode-map (kbd "C-c C-h") 'emacs-wiki-preview-html)
	    (define-key emacs-wiki-mode-map (kbd "C-c C-c") 'emacs-wiki-preview-source)
	    (define-key emacs-wiki-mode-map (kbd "C-c C-v") 'emacs-wiki-change-project)))


(setq emacs-wiki-publishing-directory "publish")

(setq emacs-wiki-directories '("~/.wiki/default"))
(setq emacs-wiki-meta-charset "gb2312")
(setq emacs-wiki-meta-content-coding "gb2312")   ;在windows下需换为GBK
(setq emacs-wiki-style-sheet "")

(setq emacs-wiki-inline-relative-to 'emacs-wiki-publishing-directory)

(defun emacs-wiki-preview-source ()
  (interactive)
  (emacs-wiki-publish-this-page)
  (find-file (emacs-wiki-published-file)))

(defun emacs-wiki-preview-html ()
  (interactive)
  (emacs-wiki-publish-this-page)
  (browse-url (emacs-wiki-published-file)))

(setq emacs-wiki-projects
      `(("default" . ((emacs-wiki-directories . ("~/.wiki/default"))))
        ("work" . ((fill-column . 65)
		   (emacs-wiki-directories . ("~/.wiki/work/")))) 
	("sicp" . ((fill-column . 65)
		   (emacs-wiki-directories . ("~/.wiki/sicp/")))) 
	("apue" . ((fill-column . 65)
		   (emacs-wiki-directories . ("~/.wiki/apue/"))))))
