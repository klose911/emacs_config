(require 'setnu)
(defun toggle-setnu-mode ()
  (interactive)
  (if setnu-mode
      (setnu-mode -1)
    (setnu-mode 1)))

(global-set-key [f10] 'toggle-setnu-mode)
