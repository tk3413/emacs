(setq-default
cursor-in-non-selected-windows nil ; disable cursor in inactive windows
cursor-type '(hbar . 2)            ; underline cursor instead of block
delete-by-moving-to-trash t        ; delete files to trash
initial-scratch-message ""         ; default string in scratch buffer
inhibit-startup-screen t           ; disable startup screen
)

(blink-cursor-mode 0)              ; prefer non-blinking cursor
(fset 'yes-or-no-p 'y-or-n-p)      ; prefer y/n to yes/no
(menu-bar-mode -1)                 ; disable menu bar
(tool-bar-mode -1)                 ; disable tool bar
(global-hl-line-mode +1)           ; highlight current line

(setq default-directory "~/")      ; set default to home

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

(load-theme 'zenburn t)

(use-package simple
  :ensure nil
  :hook
  (org-mode  . auto-fill-mode)
  (prog-mode . auto-fill-mode)
  (text-mode . auto-fill-mode))

(use-package rainbow-mode
  :hook
  (prog-mode . rainbow-mode)
  :custom
  (rainbow-x-colors nil))

(use-package company
  :hook
  (after-init . global-company-mode)
  :custom
  (company-backends '(company-capf))
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
  (company-tooltip-width-grow-only t)
  :config
  (company-tng-mode))

(use-package company-box
  :disabled
  :hook
  (company-mode . company-box-mode)
  :custom
  (company-box-enable-icon nil)
  (company-box-max-candidates 50)
  (company-box-scrollbar nil)
  (company-box-show-single-candidate 'always))

(use-package define-word)

(use-package highlight-indent-guides
  :hook
  (python-mode . highlight-indent-guides-mode)
  (scss-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character))

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

(use-package json-mode
 :mode "\\.json\\'")

(use-package yaml-mode)
(setq byte-compile-warnings '(cl-functions)) ; here because this package throws warnings on init

(setq elpy-rpc-virtualenv-path 'current)

(setq elfeed-db-directory "~/elfeed.org")

(setq-default elfeed-search-title-max-width 100)
(setq-default elfeed-search-title-min-width 100)

(global-set-key (kbd "C-x w") 'elfeed)

(setq elfeed-feeds
  '(
("http://news.ycombinator.com/rss" hacker)
   ))
