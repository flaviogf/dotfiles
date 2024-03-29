(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
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
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook (lambda() (modify-syntax-entry ?_ "w")))

(add-to-list 'default-frame-alist '(font . "JetBrains Mono Nerd Font-15"))
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
(customize-set-variable 'tab-width 2)
(customize-set-variable 'tool-bar-mode nil)
(customize-set-variable 'truncate-lines t)
(customize-set-variable 'use-package-always-ensure t)
(customize-set-variable 'visible-bell t)
(customize-set-variable 'whitespace-line-column 120)
(customize-set-variable 'whitespace-style '(face lines-tail))

(put 'dired-find-alternate-file 'disabled nil)

(global-unset-key (kbd "C-SPC"))

(use-package all-the-icons)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package company
  :init (company-mode))

(use-package counsel
  :init (counsel-mode))

(use-package dashboard
  :custom
  (initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  (dashboard-startup-banner 'logo)
  :init
  (dashboard-setup-startup-hook))

(use-package dockerfile-mode
  :mode "Dockerfile\\'")

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :init (load-theme 'doom-nord t))

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
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    (kbd "RET") 'dired-find-alternate-file
    "-" (lambda () (interactive) (find-alternate-file "..")))
  :init (evil-collection-init))

(use-package flycheck)

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode))

(use-package go-mode
  :custom (gofmt-command "goimports")
  :hook (before-save . gofmt-before-save)
  :mode "\\.go\\'")

(use-package ivy
  :custom
  (enable-recursive-minibuffers t)
  (ivy-use-virtual-buffers t)
  :init (ivy-mode))

(use-package lsp-mode
  :commands lsp
  :hook
  (go-mode . lsp)
  (java-mode . lsp)
  (python-mode . lsp)
  (ruby-mode . lsp)
  :custom
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-keymap-prefix "C-c l"))

(use-package lsp-java)

(use-package lsp-ui
  :custom
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover t))

(use-package magit)

(use-package marginalia
  :init (marginalia-mode))

(use-package org
  :custom
  (org-agenda-files '("/home/flaviogf/Archive.org" "/home/flaviogf/TODO.org"))
  (org-confirm-babel-evaluate nil)
  (org-timer-display nil)
  (org-ellipsis " ▼ ")
  (org-hide-emphasis-markers t)
  (org-refile-targets '((org-agenda-files :maxlevel . 1)))
  (org-startup-folded t)
  (org-timer-format "%s")
  (org-tag-alist '(("chore" . ?c) ("study" . ?s) ("work" . ?w) ("pc" . ?p)))
  (org-todo-keywords '("TODO" "DOING" "DONE" "CANCELED"))
  :ensure nil
  :hook
  (org-mode . (lambda () (org-indent-mode)
                         (auto-fill-mode 0)
                         (setq evil-auto-indent nil)))
  :init
  (org-babel-do-load-languages 'org-babel-load-languages '((ruby . t))))

(dolist (face '((org-level-1 . 1.7)
                (org-level-2 . 1.6)
                (org-level-3 . 1.5)))
  (set-face-attribute (car face) nil :font "DejaVu Sans Mono Nerd Font" :weight 'medium :height (cdr face)))

(use-package org-superstar
  :custom
  (org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆"))
  (org-superstar-item-bullet-alist '((?+ . ?➤) (?- . ?✦)))
  :hook (org-mode . org-superstar-mode))

(use-package toc-org
  :hook (org-mode . toc-org-mode))

(use-package project
  :custom
  (project-switch-commands #'project-dired))

(use-package rg)

(use-package swiper)

(use-package vterm)

(use-package which-key
  :custom (which-key-idle-delay 2)
  :init (which-key-mode))

(use-package yaml-mode
  :mode "\\.ya?ml\\'")
