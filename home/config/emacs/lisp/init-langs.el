;;; init-langs.el --- language modes -*- lexical-binding: t; -*-

(require 'rainbow-mode)
(require 'nix-mode)
(require 'typescript-mode)
(require 'qml-mode)
(require 'lua-mode)

(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.qml\\'" . qml-mode))
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))

(add-hook 'css-mode-hook #'rainbow-mode)
(add-hook 'nix-mode-hook #'rainbow-mode)

(defun lua-setup ()
  (setq-local lua-indent-level 4
              tab-width 4
              indent-tabs-mode nil))

(add-hook 'lua-mode-hook #'lua-setup)
(add-hook 'lua-mode-hook #'rainbow-mode)

(provide 'init-langs)
;;; init-langs.el ends here
