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

(add-to-list 'exec-path "/home/flaviogf/.asdf/shims")
(add-to-list 'exec-path "/home/flaviogf/.asdf/bin")

(set-face-attribute 'default nil :font "Fira Code Nerd Font" :height 150)

(setq-default c-basic-offset 2)
(setq-default cperl-indent-level 2)
(setq-default default-frame-alist '((font . "Fira Code Nerd Font")))
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-startup-message t)
(setq-default inhibit-splash-screen t)
(setq-default initial-scratch-message nil)
(setq-default make-backup-files nil)
(setq-default tab-width 2)
(setq-default truncate-lines t)
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
             :init
             (company-mode))

(use-package counsel
             :init
             (counsel-mode))

(use-package display-fill-column-indicator
             :ensure nil
             :hook
             (prog-mode . display-fill-column-indicator-mode))

(use-package display-line-numbers
             :ensure nil
             :hook
             (prog-mode . display-line-numbers-mode))

(use-package doom-themes
             :init
             (setq doom-themes-enable-bold t)
             (setq doom-themes-enable-italic t)
             (load-theme 'doom-dracula t))

(use-package doom-modeline
             :init
             (doom-modeline-mode))

(use-package evil
             :init
             (setq evil-shift-width 2)
             (evil-mode))

(use-package haskell-mode)

(use-package hl-line
             :ensure nil
             :hook
             (prog-mode . hl-line-mode))

(use-package ivy
             :init
             (ivy-mode))

(use-package lsp-mode
             :commands
             lsp
             :hook
             (ruby-mode . lsp)
             :init
             (setq lsp-headerline-breadcrumb-icons-enable nil)
             (setq lsp-keymap-prefix "C-c l"))

(use-package magit)

(use-package perspective
             :bind
             ("C-x b" . persp-counsel-switch-buffer)
             :init
             (setq persp-mode-prefix-key (kbd "C-c M-p"))
             (persp-mode))

(use-package projectile
             :bind
             (:map projectile-mode-map ("C-c p" . projectile-command-map))
             :init
             (setq projectile-project-search-path '(("~/dev" . 1)))
             (setq projectile-completion-system 'ivy)
             (setq projectile-git-submodule-command nil)
             (projectile-mode))

(use-package rainbow-mode
             :hook
             (conf-unix-mode . rainbow-mode)
             (prog-mode . rainbow-mode))

(use-package rspec-mode
             :init
             (setq rspec-use-docker-when-possible t)
             (setq rspec-docker-command "docker-compose exec")
             (setq rspec-docker-container "web")
             (setq rspec-docker-cwd "/var/app/"))

(use-package vterm)

(use-package which-key
             :init
             (setq which-key-idle-delay 2)
             (which-key-mode))

(use-package whitespace
             :ensure nil
             :hook
             (prog-mode . whitespace-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(haskell-mode which-key vterm use-package seeing-is-believing rspec-mode rainbow-mode projectile perspective magit lsp-mode inf-ruby exwm evil-collection edwina doom-themes doom-modeline desktop-environment counsel company all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
