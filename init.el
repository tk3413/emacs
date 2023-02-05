(require 'org)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(auto-dim-other-buffers company-box terraform-doc lsp-java-boot java-imports interaction-log helm-lsp lsp-java lsp-ui lsp-mode flycheck projectile solarized solarized-light exec-path-from-shell cider solarized-theme add-node-modules-path js-auto-format-mode xref-js2 js2-refactor js2-mode treemacs terraform-mode which-key rust-mode feature-mode elpy magit yaml-mode json-mode rainbow-delimiters highlight-indent-guides define-word company rainbow-mode zenburn-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
