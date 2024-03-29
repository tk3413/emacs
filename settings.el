(setq-default
cursor-in-non-selected-windows nil ; disable cursor in inactive windows
cursor-type '(hbar . 2)            ; underline cursor instead of block
delete-by-moving-to-trash t        ; delete files to trash
initial-scratch-message ""         ; default string in scratch buffer
inhibit-startup-screen t           ; disable startup screen
)

(fset 'yes-or-no-p 'y-or-n-p)      ; prefer y/n to yes/no
(menu-bar-mode -1)                 ; disable menu bar
(tool-bar-mode -1)
(global-hl-line-mode +1)           ; highlight current line

(setq default-directory "~/")      ; set default to home
(setq treemacs-icon-size 0)        ; disable icons with treemacs

(add-hook 'conf-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)

(setq-default
 display-line-numbers-current-absolute nil
 display-line-numbers-width 2)

(require 'package)
(setq package-archives
  '(("gnu"          . "https://elpa.gnu.org/packages/")
    ("melpa"        . "http://melpa.org/packages/")
    ("melpa-stable" . "http://stable.melpa.org/packages/")
    ("elpy"         . "http://jorgenschaefer.github.io/packages/")
    ("org"          . "http://orgmode.org/elpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package t))
(setq-default
 use-package-always-defer t
 use-package-always-ensure t)

(load-theme 'solarized-light t)

(add-hook 'emacs-startup-hook 'treemacs)

(add-hook 'after-init-hook 'auto-dim-other-buffers-mode)

(use-package which-key
  :init (which-key-mode)
  :diminish (which-key-mode)
  :config (setq which-key-idle-delay 1))

(use-package rainbow-mode
  :hook
  (Prog-mode . rainbow-mode)
  :custom
  (rainbow-x-colors nil))

(use-package company
  :hook
  (after-init . global-company-mode)
  :custom
  (company-dabbrev-downcase nil)
  (company-dabbrev-ignore-case nil)
  (company-dabbrev-other-buffers nil)
  (company-global-modes '(not help-mode message-mode))
  (company-idle-delay 0)
  (company-minimum-prefix-length 2)
  (company-require-match nil)
  (company-selection-wrap-around t)
  (company-tooltip-align-annotations t)
  (company-tooltip-flip-when-above t)
  (company-tooltip-offset-display nil)
  (company-tooltip-width-grow-only t))

(use-package define-word)

(use-package rainbow-delimiters
:hook
(prog-mode . rainbow-delimiters-mode))

(use-package whitespace
  :ensure nil
  :hook
  (prog-mode . whitespace-mode)
  (text-mode . whitespace-mode)
  :custom
  (whitespace-style '(face empty indentation::space tab trailing)))



(use-package js2-mode)

(use-package add-node-modules-path
  :config
  (add-hook 'js-mode-hook #'add-node-modules-path))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil))
(use-package hydra)
(use-package lsp-ui)
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)
(use-package helm-lsp)
(use-package helm
  :config (helm-mode))
(use-package lsp-treemacs)

(use-package json-mode
 :mode "\\.json\\'")

(setq elpy-rpc-virtualenv-path 'current)

(require 'rust-mode)
(setq rust-format-on-save t)

(use-package yaml-mode)
(setq byte-compile-warnings '(cl-functions)) ; here because this package throws warnings on init

(setq elfeed-db-directory "~/elfeed.org")

(setq-default elfeed-search-title-max-width 100)
(setq-default elfeed-search-title-min-width 100)

(global-set-key (kbd "C-x w") 'elfeed)

(setq elfeed-feeds
  '(
("http://news.ycombinator.com/rss" hacker)
   ))
