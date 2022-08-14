(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package '(use-package diminish))
  (unless (package-installed-p package)
    (package-install package)))

(require 'use-package)
(require 'diminish)

(add-hook 'org-mode-hook 'hl-line-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook (lambda() (modify-syntax-entry ?_ "w")))

(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
(add-to-list 'default-frame-alist '(font . "JetBrains Mono Nerd Font-16"))
(add-to-list 'exec-path "/home/flaviogf/.asdf/shims")
(add-to-list 'exec-path "/home/flaviogf/.asdf/bin")

(customize-set-variable 'c-basic-offset 2)
(customize-set-variable 'column-number-mode t)
(customize-set-variable 'cperl-indent-level 2)
(customize-set-variable 'dired-listing-switches "-agho --group-directories-first")
(customize-set-variable 'display-line-numbers-type 'relative)
(customize-set-variable 'fill-column 120)
(customize-set-variable 'indent-tabs-mode nil)
(customize-set-variable 'inhibit-startup-message t)
(customize-set-variable 'inhibit-splash-screen t)
(customize-set-variable 'initial-scratch-message nil)
(customize-set-variable 'make-backup-files nil)
(customize-set-variable 'menu-bar-mode nil)
(customize-set-variable 'recentf-mode t)
(customize-set-variable 'scroll-bar-mode nil)
(customize-set-variable 'scroll-margin 8)
(customize-set-variable 'tab-width 2)
(customize-set-variable 'tool-bar-mode nil)
(customize-set-variable 'truncate-lines t)
(customize-set-variable 'use-package-always-ensure t)
(customize-set-variable 'visible-bell t)
(customize-set-variable 'whitespace-line-column 120)
(customize-set-variable 'whitespace-style '(face lines-tail))

(global-unset-key (kbd "C-SPC"))

(use-package general
  :config
  (general-evil-setup t)
  (general-create-definer my-leader-key :prefix "C-SPC"))

(use-package all-the-icons)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package avy
  :config
  (my-leader-key
    "a t" 'avy-goto-char-timer))

(use-package company
  :init (company-mode))

(use-package counsel
  :config
  (my-leader-key
    "c r" 'counsel-rg)
  :init (counsel-mode))

(use-package dashboard
  :custom
  (initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  (dashboard-startup-banner 'logo)
  :init
  (dashboard-setup-startup-hook))

(use-package docker
  :config
  (my-leader-key
    "d" 'docker))

(use-package dockerfile-mode
  :mode "Dockerfile\\'")

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :init (load-theme 'doom-dracula t))

(use-package minions
  :hook (doom-modeline-mode . minions-mode))

(use-package doom-modeline
  :custom
  (doom-modeline-minor-modes t)
  :init (doom-modeline-mode))

(use-package editorconfig
  :init (editorconfig-mode))

(use-package evil
  :custom
  (evil-kill-on-visual-paste)
  (evil-shift-width 2)
  (evil-want-C-u-scroll t)
  (evil-want-integration t)
  (evil-want-keybinding nil)
  :init (evil-mode))

(use-package evil-collection
  :init (evil-collection-init))

(use-package flycheck
  :config
  (my-leader-key
    "f t" 'flycheck-mode))

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode))

(use-package go-mode
  :custom (gofmt-command "goimports")
  :hook (before-save . gofmt-before-save)
  :mode "\\.go\\'")

(use-package haskell-mode
  :mode "\\.hs\\'")

(use-package ivy
  :custom
  (enable-recursive-minibuffers t)
  (ivy-use-virtual-buffers t)
  :init (ivy-mode))

(use-package lua-mode
  :mode "\\.lua\\'")

(use-package lsp-mode
  :commands lsp
  :hook
  (go-mode . lsp)
  (ruby-mode . lsp)
  :custom
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-keymap-prefix "C-c l"))

(use-package lsp-ui
  :custom
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover t))

(use-package magit)

(use-package marginalia
  :init (marginalia-mode))

(use-package org
  :config
  (my-leader-key
    "o t" 'org-todo-list
    "o _" 'org-timer-stop
    "o ;" 'org-timer-set-timer)
  :custom
  (org-agenda-files '("/home/flaviogf/dev/org-files/Archive.org" "/home/flaviogf/dev/org-files/TODO.org"))
  (org-clock-sound "/home/flaviogf/Downloads/bell.mp3")
  (org-refile-targets '((org-agenda-files :maxlevel . 1)))
  (org-confirm-babel-evaluate nil)
  (org-hide-emphasis-markers t)
  (org-startup-folded t)
  (org-tag-alist '(("chore" . ?c) ("study" . ?s) ("work" . ?w) ("pc" . ?p)))
  (org-todo-keywords '("TODO" "DOING" "DONE" "CANCELED"))
  :ensure nil
  :hook
  (org-mode . (lambda () (org-indent-mode)
                         (auto-fill-mode 0)
                         (setq evil-auto-indent nil)))
  :init (org-babel-do-load-languages 'org-babel-load-languages '((ruby . t))))

(use-package org-roam
  :custom
  (org-roam-dailies-directory "daily")
  (org-roam-directory "/home/flaviogf/dev/org-files/notes")
  :init (org-roam-db-autosync-mode))

(use-package org-superstar
  :hook (org-mode . org-superstar-mode))

(use-package toc-org
  :hook (org-mode . toc-org-mode))

(use-package project
  :custom
  (project-switch-commands #'project-dired))

(use-package rainbow-mode
  :hook
  (conf-unix-mode . rainbow-mode)
  (prog-mode . rainbow-mode))

(use-package rspec-mode)

(use-package rg)

(use-package slime
  :init (setq inferior-lisp-program "sbcl"))

(use-package swiper
  :config
  (my-leader-key
    "s" 'swiper))

(use-package which-key
  :custom (which-key-idle-delay 2)
  :init (which-key-mode))

(use-package yaml-mode
  :mode "\\.ya?ml\\'")
