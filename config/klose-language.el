;;------------���Ի����ַ�������(utf-8)-------------

(setq locale-env 'Chinese-GBK)  
(setq locale-code 'gb2312) 

(set-language-environment locale-env)
(set-keyboard-coding-system locale-code)
(set-terminal-coding-system locale-code)
(set-buffer-file-coding-system locale-code)
(set-default-coding-systems locale-code)
;; (set-selection-coding-system locale-code)
(modify-coding-system-alist 'process "*" locale-code)
(setq default-process-coding-system  (cons locale-code locale-code))
(setq-default pathname-coding-system locale-code)
(set-file-name-coding-system locale-code)
;; (set-clipboard-coding-system locale-code)
(setq ansi-color-for-comint-mode t)
