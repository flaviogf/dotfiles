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
(add-to-list 'default-frame-alist '(font . "Mononoki Nerd Font-16"))
(add-to-list 'exec-path "/home/flaviogf/.asdf/shims")
(add-to-list 'exec-path "/home/flaviogf/.asdf/bin")

(customize-set-variable 'c-basic-offset 2)
(customize-set-variable 'column-number-mode t)
(customize-set-variable 'cperl-indent-level 2)
(customize-set-variable 'dired-listing-switches "-agho --group-directories-first")
(customize-set-variable 'fill-column 120)
(customize-set-variable 'indent-tabs-mode nil)
(customize-set-variable 'inhibit-startup-message t)
(customize-set-variable 'inhibit-splash-screen t)
(customize-set-variable 'initial-scratch-message nil)
(customize-set-variable 'make-backup-files nil)
(customize-set-variable 'menu-bar-mode nil)
(customize-set-variable 'scroll-bar-mode nil)
(customize-set-variable 'tab-width 2)
(customize-set-variable 'tool-bar-mode nil)
(customize-set-variable 'truncate-lines t)
(customize-set-variable 'use-package-always-ensure t)
(customize-set-variable 'whitespace-line-column 120)
(customize-set-variable 'whitespace-style '(face lines-tail))

(use-package all-the-icons)

(use-package all-the-icons-dired
             :hook
             (dired-mode . all-the-icons-dired-mode))

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

(use-package org
             :ensure nil
             :init
             (setq org-hide-emphasis-markers t))

(use-package org-superstar
             :hook
             (org-mode . org-superstar-mode)
             :init
             (setq org-superstar-remove-leading-stars t)
             (setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

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

(use-package slime
             :init
             (setq inferior-lisp-program "sbcl"))

(use-package vterm)

(use-package which-key
             :init
             (setq which-key-idle-delay 2)
             (which-key-mode))

(use-package whitespace
             :ensure nil
             :hook
             (prog-mode . whitespace-mode))

(use-package yaml-mode)
