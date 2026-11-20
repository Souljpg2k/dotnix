;;; init-ui.el --- UI settings -*- lexical-binding: t; -*-

;;; Interface
(menu-bar-mode -1)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(column-number-mode 1)

;;; Themes
(load-theme 'tokyo-night t)

(set-face-attribute 'default nil :background "unspecified-bg")
(set-face-background 'line-number nil)
(set-face-attribute 'line-number-current-line nil :foreground "#ff9e64")
(set-face-attribute 'line-number nil :foreground "#737aa2")

(provide 'init-ui)
;;; init-ui.el ends here
