(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 150)

(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'prog-mode-hook #'whitespace-mode)

(setq-default c-basic-offset 2)
(setq-default cperl-indent-level 2)
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-startup-message t)
(setq-default inhibit-splash-screen t)
(setq-default tab-width 2)
(setq-default use-package-always-ensure t)
(setq-default whitespace-line-column 80)
(setq-default whitespace-style '(face lines-tail))

(column-number-mode)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

(use-package all-the-icons)

(use-package company
             :after lsp-mode
             :hook (lsp-mode . company-mode))

(use-package doom-themes
             :init
             (setq doom-themes-enable-italic t)
             (setq doom-themes-enable-bold t)
             (load-theme 'doom-dracula t))

(use-package doom-modeline
             :init (doom-modeline-mode 1))

(use-package evil
             :init
             (setq evil-want-keybinding nil)
             (setq evil-want-integration t)
             (evil-mode 1)
             :custom
             (evil-want-C-u-scroll 1)
             (evil-shift-width 2))

(use-package evil-collection
             :after evil
             :init (evil-collection-init))

(use-package ivy
             :init (ivy-mode 1))

(use-package lsp-mode
             :init
             (setq lsp-keymap-prefix "C-c l")
             (unless (display-graphic-p)
               (setq lsp-headerline-breadcrumb-icons-enable nil))
             :hook (ruby-mode . lsp-deferred)
             :commands (lsp lsp-deferred))

(use-package magit
             :custom (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package projectile
             :init
             (setq projectile-switch-project-action #'projectile-dired)
             (setq projectile-project-search-path '(("~/dev" . 1)))
             (setq projectile-completion-system 'ivy)
             (projectile-mode 1)
             :bind (:map projectile-mode-map ("C-c p" . projectile-command-map)))

(use-package seeing-is-believing
             :hook (ruby-mode . seeing-is-believing))

(use-package which-key
             :init
             (setq which-key-idle-delay 2)
             (which-key-mode))
