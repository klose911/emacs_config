(add-to-list 'load-path "~/.emacs.d/elisp/muse/lisp") 

(require 'muse-mode)     ; load authoring mode

(require 'muse-html)     ; load publishing styles I use
(require 'muse-latex)
(require 'muse-texinfo)
(require 'muse-docbook)

(require 'muse-project)  ; publish files in project 

(setq muse-project-alist
      '(("website" ("~/.pages" :default "index")
         (:base "html" :path "~/.pages/public"))))
         ;;(:base "pdf" :path "~/.pages/pdf"))))

