(require 'cmuscheme)  

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t) 
(autoload 'run-scheme "cmuscheme" "Switch to interactive Scheme buffer." t) 

;;(setq scheme-program-name "plt-r5rs.exe") 
(setq scheme-program-name "tinyscheme")

;;(setq scheme-program-name "D:/Program Files/Scheme 48/Scheme 48 1.9/scheme48vm.exe") 
;;(setq scheme-program-name "D:/Program Files/MIT-GNU Scheme/bin/bchscheme.exe") 
;;(setenv "MITSCHEME_LIBRARY_PATH" "D:/Program Files/MIT-Scheme/lib") 

(add-hook 'scheme-mode-hook 'turn-on-font-lock)

(defun wy-scheme-mode-hook ()
  (defun scheme-send-region (start end)
    "Send the current region to the inferior Scheme process."
    (interactive "r")
    (let ((origbuffer (current-buffer))
	  (proc (get-buffer-process (if (eq major-mode 'inferior-scheme-mode)
					(current-buffer)
 				      scheme-buffer))))
      (or proc 
	  (progn
	    (run-scheme scheme-program-name)
	    (pop-to-buffer (process-buffer (scheme-proc)) t)
	    (goto-char (point-max))
	    (pop-to-buffer origbuffer))))

    (comint-send-region (scheme-proc) start end)
    (comint-send-string (scheme-proc) "\n")
    (scheme-display-buffer))
  )

(add-hook 'scheme-mode-hook 'wy-scheme-mode-hook)

(defun scheme-display-buffer ()
  "Display the inferior-maxima-process buffer so the recent output is visible."
  (interactive)
  (let ((origbuffer (current-buffer)))
    (pop-to-buffer (process-buffer (scheme-proc)) t)
    (goto-char (point-max))
    (pop-to-buffer origbuffer)))

(defun scheme-send-line ()
  "Send the line to the inferior Scheme process."
  (interactive)
  (scheme-send-region 
   (save-excursion
     (beginning-of-line) (point))
   (save-excursion
     (progn (end-of-line) (point)))))

(define-key scheme-mode-map (kbd "C-c C-c")
  'scheme-send-line)
