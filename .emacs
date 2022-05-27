(require 'package)

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package doom-themes
             :ensure t
             :init
             (setq doom-themes-enable-italic t)
             (setq doom-themes-enable-bold t)
             (load-theme 'doom-dracula t))

(use-package doom-modeline
             :ensure t
             :init
             (doom-modeline-mode 1))

(use-package evil
             :ensure t
             :init
             (setq evil-want-keybinding nil)
             (setq evil-want-integration t)
             (evil-mode 1)
             :custom
             (evil-want-C-u-scroll 1)
             (evil-shift-width 2))

(use-package evil-collection
             :ensure t
             :after evil
             :init
             (evil-collection-init))

(use-package ivy
             :ensure t
             :init
             (ivy-mode 1))

(use-package lsp-mode
             :ensure t
             :init
             (setq lsp-keymap-prefix "C-c l")
             :hook
             (ruby-mode . lsp-deferred)
             :commands
             (lsp lsp-deferred))

(use-package magit
             :ensure t
             :custom
             (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package projectile
             :ensure t
             :init
             (setq projectile-switch-project-action #'projectile-dired)
             (setq projectile-project-search-path '(("~/dev" . 1)))
             (setq projectile-completion-system 'ivy)
             (projectile-mode 1)
             :bind
             (:map projectile-mode-map
                   ("C-c p" . projectile-command-map)))

(use-package which-key
             :ensure t
             :init
             (setq which-key-idle-delay 0.3)
             (which-key-mode))

(setq-default c-basic-offset 2)
(setq-default cperl-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-startup-message t)
(setq-default inhibit-splash-screen t)
(setq-default tab-width 2)

(column-number-mode)
(global-display-line-numbers-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
