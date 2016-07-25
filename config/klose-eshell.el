(require 'eshell)

(setq eshell-cp-interactive-query t
      eshell-ln-interactive-query t
      eshell-mv-interactive-query t
      eshell-rm-interactive-query t
      eshell-ls-use-in-dired t
      eshell-mv-overwrite-files nil)

;; (setq shell-file-name "d:/util/cygwin/bin/bash")
;; (setq explicit-shell-file-name shell-file-name)
;; (setenv "PATH"
;; 	(concat ".:/usr/local/bin:/usr/bin:/bin:"
;; 		(replace-regexp-in-string " " "\\\\ "
;; 					  (replace-regexp-in-string "\\\\" "/"
;; 								    (replace-regexp-in-string "\\([A-Za-z]\\):" "/\\1"
;; 											      (getenv "PATH"))))))

;; 启动设置
(defun klose-eshell-setup ()
  (define-key eshell-mode-map "\t" 'pcomplete-list)
  (define-key eshell-mode-map (kbd "s-a") 'eshell-maybe-bol)
  (eldoc-mode 1))
(add-hook 'eshell-mode-hook 'klose-eshell-setup)

;; 自定义补全规则
(setq eshell-cmpl-cycle-completions nil)
(defadvice pcomplete (around avoid-remote-connections activate)
  (let ((file-name-handler-alist (copy-alist file-name-handler-alist)))
    (setq file-name-handler-alist
	  (delete (rassoc 'tramp-completion-file-name-handler
			  file-name-handler-alist) file-name-handler-alist))
    ad-do-it))

;; 自定义提示符
(setq klose-emacs-name "GNU Emacs-24.1")
(defun klose-eshell-prompt ()
  "An Eshell prompt looks very cool."
  (let ((user (or (getenv "USER") user-login-name "ted"))
	(wd (eshell/pwd))
	(host (car (split-string (or (getenv "HOST")
				     system-name
				     "unknown")
				 "\\.")))
	(term (concat klose-emacs-name (format " PID %d" (emacs-pid))))
	(time (let ((time-1 (downcase (format-time-string "%Y.%m.%d %A %p %l:%M:%S"))))
		(if (char-equal (aref time-1 0) ?\ )
		    (substring time-1 1)
		  time-1)))
	;; based on `eshell-exit-success-p'
	(r (if (save-match-data
		 (string-match "#<\\(Lisp object\\|function .*\\)>"
			       (or eshell-last-command-name "")))
	       (format "%s" eshell-last-command-result)
	     (number-to-string eshell-last-command-status)))
	(h (number-to-string (+ 1 (ring-length eshell-history-ring))))
	(char (if (= (user-uid) 0) "#" "$")))
    (concat "\n" user
	    "\n"
	    "In " wd
	    "\n"
	    "On " host "'s " term
	    "\n"
	    "At " time
	    "\n"
	    "(h=" h ", "
	    "r=" r ")"
	    " " char " ")))

(setq eshell-prompt-regexp
      (mapconcat
       '(lambda (str) (concat "\\(" str "\\)"))
       '("^[^#$]* [#$] "                ; default
	 "^\\(mysql\\|[ ]\\{4\\}[-\"'`]\\)> "
	 "^>>> "                        ; python
	 "^ftp> "
	 )
       "\\|"))
(setq eshell-prompt-function 'klose-eshell-prompt)

;; 在ls命令的结果列表中，用回车键和鼠标中键访问目录和文件，来自emacs-wik，感谢ted。
(eval-after-load "em-ls"
  '(progn
     (defun ted-eshell-ls-find-file-at-point ()
       (interactive)
       (let ((fname (buffer-substring-no-properties
		     (previous-single-property-change (point) 'help-echo)
		     (next-single-property-change (point) 'help-echo))))
	 ;; Remove any leading whitespace, including newline that might
	 ;; be fetched by buffer-substring-no-properties
	 (setq fname (replace-regexp-in-string "^[ \t\n]*" "" fname))
	 ;; Same for trailing whitespace and newline
	 (setq fname (replace-regexp-in-string "[ \t\n]*$" "" fname))
	 (cond
	  ((equal "" fname)
	   (message "No file name found at point"))
	  (fname
	   (find-file fname)))))
     
     (defun pat-eshell-ls-find-file-at-mouse-click (event)
       "Middle click on Eshell's `ls' output to open files.
  From Patrick Anderson via the wiki."
       (interactive "e")
       (ted-eshell-ls-find-file-at-point (posn-point (event-end event))))

     (let ((map (make-sparse-keymap)))
       (define-key map (kbd "RET")      'ted-eshell-ls-find-file-at-point)
       (define-key map (kbd "<return>") 'ted-eshell-ls-find-file-at-point)
       (define-key map (kbd "<mouse-2>") 'pat-eshell-ls-find-file-at-mouse-click)
       (defvar ted-eshell-ls-keymap map))

     (defadvice eshell-ls-decorated-name (after ted-electrify-ls activate)
       "Eshell's `ls' now lets you click or RET on file names to open them."
       (add-text-properties 0 (length ad-return-value)
			    (list 'help-echo "RET, mouse-2: visit this file"
				  'mouse-face 'highlight
				  'keymap ted-eshell-ls-keymap)
			    ad-return-value)
       ad-return-value)))

;; 不用圆括号时eldoc也能工作，有一点bug，况且是鸡肋，干掉。
;; (defadvice eldoc-fnsym-in-current-sexp (around eldoc-fnsym-in-current-sexp-or-command activate)
;;   ad-do-it
;;   (if (and (not ad-return-value)
;;            (eq major-mode 'eshell-mode))
;;       (save-excursion
;;         (goto-char eshell-last-output-end)
;;         (setq ad-return-value (eldoc-current-symbol)))))

;; 使用"emacs"命令在当前的emacs中打开文件
(defun eshell/emacs (&rest args)
  "Open a file in emacs. Some habits die hard."
  (if (null args)
      ;; If I just ran "emacs", I probably expect to be launching
      ;; Emacs, which is rather silly since I'm already in Emacs.
      ;; So just pretend to do what I ask.
      (bury-buffer)
    ;; We have to expand the file names or else naming a directory in an
    ;; argument causes later arguments to be looked for in that directory,
    ;; not the starting directory
    (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))

;; 在apt包管理机制下的包查看工具
(defun eshell/deb (&rest args)
  (eshell-eval-using-options
   "deb" args
   '((?f "find" t find "list available packages matching a pattern")
     (?i "installed" t installed "list installed debs matching a pattern")
     (?l "list-files" t list-files "list files of a package")
     (?s "show" t show "show an available package")
     (?v "version" t version "show the version of an installed package")
     (?w "where" t where "find the package containing the given file")
     (nil "help" nil nil "show this usage information")
     :show-usage)
   (eshell-do-eval
    (eshell-parse-command
     (cond
      (find
       (format "apt-cache search %s" find))
      (installed
       (format "dlocate -l %s | grep '^.i'" installed))
      (list-files
       (format "dlocate -L %s | sort" list-files))
      (show
       (format "apt-cache show %s" show))
      (version
       (format "dlocate -s %s | egrep '^(Package|Status|Version):'" version))
      (where
       (format "dlocate %s" where))))
    t)))

;; 删除当前目录下的文件名以~结尾备份文件
(defun eshell/ro ()
  "Delete files matching pattern \".*~\" and \"*~\""
  (eshell/rm (directory-files "." nil "^\\.?.*~$" nil)))

;; 如果找到了info项，则打开该项，否则回到eshell
(defun eshell/info (subject)
  "Read the Info manual on SUBJECT."
  (let ((buf (current-buffer)))
    (Info-directory)
    (let ((node-exists (ignore-errors (Info-menu subject))))
      (if node-exists
	  0
	;; We want to switch back to *eshell* if the requested
	;; Info manual doesn't exist.
	(switch-to-buffer buf)
	(eshell-print (format "There is no Info manual on %s.\n"
			      subject))
	1))))

(defun tyler-eshell-view-file (file)
  "A version of `view-file' which properly respects the eshell prompt."
  (interactive "fView file: ")
  (unless (file-exists-p file) (error "%s does not exist" file))
  (let ((had-a-buf (get-file-buffer file))
	(buffer (find-file-noselect file)))
    (if (eq (with-current-buffer buffer (get major-mode 'mode-class))
	    'special)
	(progn
	  (switch-to-buffer buffer)
	  (message "Not using View mode because the major mode is special"))
      (let ((undo-window (list (window-buffer) (window-start)
			       (+ (window-point)
				  (length (funcall eshell-prompt-function))))))
	(switch-to-buffer buffer)
	(view-mode-enter (cons (selected-window) (cons nil undo-window))
			 'kill-buffer)))))
(defun eshell/less (&rest args)
  "Invoke `view-file' on a file. \"less +42 foo\" will go to line 42 in
      the buffer for foo."
  (while args
    (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
	(let* ((line (string-to-number (match-string 1 (pop args))))
	       (file (pop args)))
	  (tyler-eshell-view-file file)
	  (goto-line line))
      (tyler-eshell-view-file (pop args)))))
(defalias 'eshell/more 'eshell/less)

;; 如果光标在提示符处，移到其到行首，否则，移到提示符处。
(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
	(beginning-of-line))))

;; Here’s how to compile in the background, also by Kai.
(defun eshell/ec (&rest args)
  "Use `compile' to do background makes."
  (if (eshell-interactive-output-p)
      (let ((compilation-process-setup-function
	     (list 'lambda nil
		   (list 'setq 'process-environment
			 (list 'quote (eshell-copy-environment))))))
	(compile (eshell-flatten-and-stringify args))
	(pop-to-buffer compilation-last-buffer))
    (throw 'eshell-replace-command
	   (let ((l (eshell-stringify-list (eshell-flatten-list args))))
	     (eshell-parse-command (car l) (cdr l))))))
(put 'eshell/ec 'eshell-no-numeric-conversions t)

;; 整合eshell和bookmark
(require 'bookmark)
(defun pcomplete/eshell-mode/bmk ()
  "Completion for `bmk'"
  (pcomplete-here (bookmark-all-names)))
(defun eshell/bmk (&rest args)
  "Integration between EShell and bookmarks.
  For usage, execute without arguments."
  (setq args (eshell-flatten-list args))
  (let ((bookmark (car args))
	filename name)
    (cond
     ((eq nil args)
      (format "Usage: bmk BOOKMARK to change directory pointed to by BOOKMARK
      or bmk . BOOKMARK to bookmark current directory in BOOKMARK.
  Completion is available."))
     ((string= "." bookmark)
      ;; Store current path in EShell as a bookmark
      (if (setq name (car (cdr args)))
	  (progn
	    (bookmark-set name)
	    (bookmark-set-filename name (eshell/pwd))
	    (format "Saved current directory in bookmark %s" name))
	(error "You must enter a bookmark name")))
     (t
      ;; Assume the user wants to go to the path pointed out by a bookmark.
      (if (setq filename (cdr (car (bookmark-get-bookmark-record bookmark))))
	  (if (file-directory-p filename)
	      (eshell/cd filename)
	    ;; TODO: Handle this better and offer to go to directory
	    ;; where the file is located.
	    (error "Bookmark %s points to %s which is not a directory" 
		   bookmark filename))
	(error "%s is not a bookmark" bookmark))))))

;; Here's a little trick to get "ssh" in eshell to launch ssh in a new
;; screen when running under GNU screen, or a new xterm when running
;; under X. Otherwise, ssh is run in a new term buffer.
(defun eshell/ssh (&rest args)
  "Secure shell"
  (let ((cmd (eshell-flatten-and-stringify
	      (cons "ssh" args)))
	(display-type (framep (selected-frame))))
    (cond
     ((and
       (eq display-type 't)
       (getenv "STY"))
      (send-string-to-terminal (format "\033]83;screen %s\007" cmd)))
     ((eq display-type 'x)
      (eshell-do-eval
       (eshell-parse-command
	(format "rxvt -e %s &" cmd)))
      nil)
     (t
      (apply 'eshell-exec-visual (cons "ssh" args))))))

