(use-package centaur-tabs
  :init
  (centaur-tabs-mode t)
  :config
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'under)
  (setq centaur-tabs-height 28)
  (setq centaur-tabs-style "bar"))

(global-set-key (kbd "C-<prior>")  #'centaur-tabs-backward)
(global-set-key (kbd "C-<next>")   #'centaur-tabs-forward)
