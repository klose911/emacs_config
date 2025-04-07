(use-package eglot
  :hook ((c-mode c++-mode) . eglot-ensure)
  :config
  ;; 如果 clangd 不在 PATH 中可以手动指定路径：
  ;; (setq eglot-server-programs '((c++-mode c-mode) . ("/path/to/clangd")))
  )

;; 自动补全
(use-package company
;;  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))  ;; 实时补全

;; 快捷键提示（非必须但推荐）
(use-package which-key
  :config (which-key-mode))

;; 项目管理（eglot 会自动使用 Emacs 内置的 project.el）
(use-package project
  :config
  (setq project-switch-commands '((project-find-file "Find file")
                                  (project-find-dir "Find dir"))))

;; 显示函数名（代码导航辅助）
(which-function-mode 1)

(with-eval-after-load 'eglot
  (company-mode 1)
  (yas-global-mode))

;; -----------------------------
;; 快捷键建议
;; -----------------------------
;; M-.         跳转定义
;; M-,         返回
;; M-x eglot-code-actions     查看代码动作（如自动修复）
;; M-x eglot-rename           重命名符号
;; M-x eglot-format           格式化
