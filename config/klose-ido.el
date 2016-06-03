(require 'ido) 
(ido-mode t) 
(add-hook 'ido-define-mode-map-hook 'ido-klose-keys) 
(defun ido-klose-keys () 
  "Set up the keymap for `ido'." 
  ;; common keys 
  (define-key ido-mode-map "C-e" 'ido-edit-input)    
  (define-key ido-mode-map "t" 'ido-complete) ;; complete partial 
  (define-key ido-mode-map "C-j" 'ido-select-text) 
  (define-key ido-mode-map "C-m" 'ido-exit-minibuffer) 
  (define-key ido-mode-map "?" 'ido-completion-help) ;; list completions 
  (define-key ido-mode-map [(control ? )] 'ido-restrict-to-matches) 
  (define-key ido-mode-map [(control ?@)] 'ido-restrict-to-matches) 
  ;; cycle through matches 
  (define-key ido-mode-map "C-r" 'ido-prev-match) 
  (define-key ido-mode-map "C-s" 'ido-next-match) 
  (define-key ido-mode-map [right] 'ido-next-match) 
  (define-key ido-mode-map [left] 'ido-prev-match) 
  ;; toggles 
  (define-key ido-mode-map "C-t" 'ido-toggle-regexp) ;; same as in isearch 
  (define-key ido-mode-map "C-p" 'ido-toggle-prefix) 
  (define-key ido-mode-map "C-c" 'ido-toggle-case) 
  (define-key ido-mode-map "C-a" 'ido-toggle-ignore) 
  ;; keys used in file and dir environment 
  (when (memq ido-cur-item '(file dir)) 
    (define-key ido-mode-map "C-b" 'ido-enter-switch-buffer) 
    (define-key ido-mode-map "C-d" 'ido-enter-dired) 
    (define-key ido-mode-map "C-f" 'ido-fallback-command) 
    ;; cycle among directories 
    ;; use [left] and [right] for matching files 
    (define-key ido-mode-map [down] 'ido-next-match-dir) 
    (define-key ido-mode-map [up]   'ido-prev-match-dir) 
    ;; backspace functions 
    (define-key ido-mode-map [backspace] 'ido-delete-backward-updir) 
    (define-key ido-mode-map "d"        'ido-delete-backward-updir) 
    (define-key ido-mode-map [(meta backspace)] 'ido-delete-backward-word-updir) 
    (define-key ido-mode-map [(control backspace)] 'ido-up-directory) 
    ;; I can't understand this 
    (define-key ido-mode-map [(meta ?d)] 'ido-wide-find-dir) 
    (define-key ido-mode-map [(meta ?f)] 'ido-wide-find-file) 
    (define-key ido-mode-map [(meta ?k)] 'ido-forget-work-directory) 
    (define-key ido-mode-map [(meta ?m)] 'ido-make-directory) 
    (define-key ido-mode-map [(meta down)] 'ido-next-work-directory) 
    (define-key ido-mode-map [(meta up)] 'ido-prev-work-directory) 
    (define-key ido-mode-map [(meta left)] 'ido-prev-work-file) 
    (define-key ido-mode-map [(meta right)] 'ido-next-work-file) 
    ;; search in the directories 
    ;; use C-_ to undo this 
    (define-key ido-mode-map [(meta ?s)] 'ido-merge-work-directories) 
    (define-key ido-mode-map [(control ?\_)] 'ido-undo-merge-work-directory) 
    ) 
  (when (eq ido-cur-item 'file) 
    (define-key ido-mode-map "C-k" 'ido-delete-file-at-head) 
    (define-key ido-mode-map "C-l" 'ido-toggle-literal) 
    (define-key ido-mode-map "C-o" 'ido-copy-current-word) 
    (define-key ido-mode-map "C-v" 'ido-toggle-vc) 
    (define-key ido-mode-map "C-w" 'ido-copy-current-file-name) 
    ) 
   
  (when (eq ido-cur-item 'buffer) 
    (define-key ido-mode-map "C-b" 'ido-fallback-command) 
    (define-key ido-mode-map "C-f" 'ido-enter-find-file) 
    (define-key ido-mode-map "C-k" 'ido-kill-buffer-at-head) 
    ))  
