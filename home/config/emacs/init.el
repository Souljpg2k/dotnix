;;; init.el --- Emacs config -*- lexical-binding: t; -*-

(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory))

(require 'init-base)
(require 'init-ui)
(require 'init-langs)
(require 'init-tools)
(require 'init-clipboard)

;;; init.el ends here
