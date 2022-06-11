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

(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
(add-to-list 'exec-path "/home/flaviogf/.asdf/shims")
(add-to-list 'exec-path "/home/flaviogf/.asdf/bin")

(setq-default c-basic-offset 2)
(setq-default cperl-indent-level 2)
(setq-default default-frame-alist '((font . "Fira Code Nerd Font")))
(setq-default dired-listing-switches "-agho --group-directories-first")
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-startup-message t)
(setq-default inhibit-splash-screen t)
(setq-default initial-major-mode 'ruby-mode)
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
(set-face-attribute 'default nil :font "Fira Code Nerd Font" :height 150)
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(tool-bar-mode -1)
(tooltip-mode -1)

(use-package all-the-icons)

(use-package all-the-icons-dired
             :hook
             (dired-mode . all-the-icons-dired-mode))

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

(use-package editorconfig
             :init
             (editorconfig-mode))

(use-package elfeed
             :init
             (setq elfeed-search-filter "@1-week-ago +unread")
             (setq elfeed-feeds '(("jovemnerd.com.br/feed/" news)
                                  ("blog.digitalocean.com/rss/" tech))))

(use-package evil
             :init
             (setq evil-shift-width 2)
             (setq evil-want-C-u-scroll t)
             (setq evil-want-integration t)
             (setq evil-want-keybinding nil)
             (evil-mode))

(use-package evil-collection
             :after evil
             :init
             (evil-collection-init))

(use-package git-gutter
             :hook
             (prog-mode . git-gutter-mode))

(use-package go-mode
             :init
             (setq gofmt-command "goimports"))

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
             (go-mode . lsp)
             :init
             (setq lsp-diagnostics-provider :none)
             (setq lsp-eldoc-enable-hover nil)
             (setq lsp-headerline-breadcrumb-enable nil)
             (setq lsp-keymap-prefix "C-c l")
             (setq lsp-modeline-code-actions-enable nil)
             (setq lsp-ui-sideline-enable nil))

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
             (setq projectile-completion-system 'ivy)
             (setq projectile-git-submodule-command nil)
             (setq projectile-project-search-path '(("~/dev" . 1)))
             (setq projectile-switch-project-action 'projectile-dired)
             (projectile-mode))

(use-package rainbow-mode
             :hook
             (conf-unix-mode . rainbow-mode)
             (prog-mode . rainbow-mode))

(use-package rg)

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
