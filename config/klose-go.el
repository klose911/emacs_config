(require 'go-mode)
(require 'go-autocomplete)
(require 'go-dlv)

(cond (*win*
       (progn
	 (setq exec-path (append exec-path '("d:/util/go/bin") '("d:/util/go-projects/bin")))
	 (setenv "GOPATH" "d:/util/go-projects")
	 (setq tags-table-list '("d:/util/go/src" 
				 "d:/util/go-projects/src/github.com/jinzhu"
				 "d:/util/go-projects/src/github.com/gin-gonic"
				 "d:/util/go-projects/src/ebaocloud.com"))
	 (add-to-list 'auto-coding-alist '("\\.go\\'" . utf-8))))
      (*linux*
       (progn
	 (setenv "GOPATH" "/home/klose/Documents/goprojects/")
	 (setq exec-path (append exec-path '("/usr/local/go/bin") '("/home/klose/Documents/goprojects/bin") ))))
      (*mac*
       (progn
	 (setenv "GOPATH" "/Users/klose/Bin/goprojects/")
	 (setq exec-path (append exec-path '("/Users/klose/Bin/goprojects/bin")))))
      (*cygwin*
       (setq exec-path (append exec-path '("~/d/util/go/bin") '("~/d/util/go-projects/bin"))))
      (t nil))

(defun my-go-mode-hook ()
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ;; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; Compile and test go code
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
	   ;; "go build -v && go test -v && go vet"))
	   "go build "))
  ;; Godef jump key binding
  (if (not *win*)
      (local-set-key (kbd "M-.") 'godef-jump))
  (local-set-key (kbd "M-*") 'pop-tag-mark))

(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun auto-complete-for-go ()
  (auto-complete-mode 1))

(add-hook 'go-mode-hook 'auto-complete-for-go)

