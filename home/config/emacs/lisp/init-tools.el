;;; init-tools.el --- development tools -*- lexical-binding: t; -*-

(require 'company)
(require 'indent-bars)
(require 'diff-hl)
(require 'yasnippet)

(global-company-mode 1)
(add-hook 'prog-mode-hook #'indent-bars-mode)
(global-diff-hl-mode 1)
(yas-global-mode 1)

(provide 'init-tools)
;;; init-tools.el ends here
