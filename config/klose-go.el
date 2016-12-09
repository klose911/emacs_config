(require 'go-mode)
(with-eval-after-load 'go-mode
  (require 'go-autocomplete))

(cond (*win*
       (progn
	 (setq exec-path (append exec-path '("d:/util/go/bin") '("d:/util/go-projects/bin")))
	 (setenv "GOPATH" "d:/util/go-projects")
	 (add-to-list 'auto-coding-alist '("\\.go\\'" . utf-8))))
       (*linux*
	(progn
	  (setenv "GOPATH" "/home/klose/Applications/goprojects/")
	  (setq $exec-path (append exec-path '("/home/klose/Applications/goprojects/bin")))))
       (*mac*
	(progn
	  (setenv "GOPATH" "/Users/klose/Bin/goprojects/")
	  (setq exec-path (append exec-path '("/Users/klose/Bin/goprojects/bin")))))
       (t nil))

      (defun my-go-mode-hook ()
	;; Use goimports instead of go-fmt
	(setq gofmt-command "goimports")
	;; Call Gofmt before saving                                                    
	(add-hook 'before-save-hook 'gofmt-before-save)
	;; Compile and test go code
	(if (not (string-match "go" compile-command))
	    (set (make-local-variable 'compile-command)
		 "go build -v && go test -v && go vet"))
	;; Godef jump key binding                                                      
	(local-set-key (kbd "M-.") 'godef-jump)
	(local-set-key (kbd "M-*") 'pop-tag-mark))

      (add-hook 'go-mode-hook 'my-go-mode-hook)

      (defun auto-complete-for-go ()
	(auto-complete-mode 1))

      (add-hook 'go-mode-hook 'auto-complete-for-go)

