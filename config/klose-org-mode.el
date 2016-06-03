(require 'org-install)
;;(require 'org-publish)

;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(add-hook 'org-mode-hook 
	  (lambda () (setq truncate-lines nil)))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; (setq org-publish-project-alist
;;       '(("note-org"
;;          :base-directory "D:/Dropbox/Document/note/org"
;;          :publishing-directory "D:/Dropbox/Document/note/org/publish"
;;          :base-extension "org"
;;          :recursive t
;;          :publishing-function org-publish-org-to-html
;;          :auto-index nil
;;          :index-filename "index.org"
;;          :index-title "index"
;;          :link-home "index.html"
;;          :section-numbers nil
;;          :style "<link rel=\"stylesheet\"
;;     href=\"./style/emacs.css\"
;;     type=\"text/css\"/>")
;;         ("note-static"
;;          :base-directory "D:/Dropbox/Document/note/org"
;;          :publishing-directory "D:/Dropbox/Document/note/org/publish"
;;          :recursive t
;;          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
;;          :publishing-function org-publish-attachment)
;;         ("note" 
;;          :components ("note-org" "note-static")
;;          :author "klose911@gmail.com"))) 

