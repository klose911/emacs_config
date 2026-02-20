(use-package vterm)

(add-to-list 'display-buffer-alist
 '("\\*vterm\\*"
   (display-buffer-in-side-window)
   (side . bottom)
   (window-height . 0.3)))
