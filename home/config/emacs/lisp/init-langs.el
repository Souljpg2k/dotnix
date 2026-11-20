;;; init-langs.el --- language modes -*- lexical-binding: t; -*-

;;; Packages
(require 'rainbow-mode)
(require 'nix-mode)
(require 'typescript-mode)
(require 'lsp-mode)
(require 'qml-ts-mode)

;;; File associations
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'"  . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.qml\\'" . qml-ts-mode))
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))

;;; Color highlights
(dolist (hook '(nix-mode-hook
                typescript-mode-hook
                tsx-ts-mode-hook
                qml-ts-mode-hook
                lua-ts-mode-hook))
  (add-hook hook #'rainbow-mode))

(setq treesit-font-lock-level 4)

;;; QML
(setq trusted-content '("~/.config/quickshell/"))

(use-package qml-ts-mode
  :after lsp-mode
  :config
  (add-to-list 'lsp-language-id-configuration '(qml-ts-mode . "qml-ts"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("qmlls" "-E"))
                    :activation-fn (lsp-activate-on "qml-ts")
                    :server-id 'qmlls))
  (add-hook 'qml-ts-mode-hook
            (lambda ()
              (setq-local electric-indent-chars
                          '(?\n ?\( ?\) ?{ ?} ?\[ ?\] ?\; ?,))
              (lsp-deferred))))

(provide 'init-langs)
;;; init-langs.el ends here
