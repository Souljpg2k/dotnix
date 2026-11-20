;;; init-tools.el --- development tools -*- lexical-binding: t; -*-

;;; Packages
(require 'company)
(require 'indent-bars)
(require 'diff-hl)
(require 'yasnippet)

;;; Completion & snippets
(global-company-mode 1)
(yas-global-mode 1)

;;; Editing aids
(add-hook 'prog-mode-hook #'indent-bars-mode)
(global-diff-hl-mode 1)

(provide 'init-tools)
;;; init-tools.el ends here
