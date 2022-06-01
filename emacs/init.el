(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
(add-to-list 'exec-path "/home/flaviogf/.asdf/shims")
(add-to-list 'exec-path "/home/flaviogf/.asdf/bin")

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 150)

(global-set-key (kbd "C-x b") 'counsel-switch-buffer)
(global-set-key (kbd "C-M-u") 'universal-argument)

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

(defun efs/update-class-name ()
  (exwm-workspace-rename-buffer exwm-class-name))

(defun efs/update-title ()
  (exwm-workspace-rename-buffer exwm-title))

(defun efs/run-in-background (command)
  (let ((command-parts (split-string command "[ ]+")))
    (apply #'call-process `(,(car command-parts) nil 0 nil ,@(cdr command-parts)))))

(defun efs/exwm-init-hook ()
  (setq display-time-day-and-date t)
  (display-time-mode 1)
  (efs/run-in-background "nm-applet")
  (efs/run-in-background "pasystray")
  (efs/run-in-background "blueman-applet"))

(use-package edwina
             :config
             (setq display-buffer-base-action '(display-buffer-below-selected))
             (edwina-mode 1))

(use-package exwm
             :config
             (setq exwm-workspace-number 4)
             (require 'exwm-systemtray)
             (setq exwm-systemtray-height 22)
             (exwm-systemtray-enable)
             (add-hook 'exwm-update-class-hook #'efs/update-class-name)
             (add-hook 'exwm-update-title-hook #'efs/update-title)
             (add-hook 'exwm-init-hook #'efs/exwm-init-hook)
             (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)
             (exwm-input-set-key (kbd "s-SPC") 'counsel-linux-app)
             (exwm-input-set-key (kbd "s-r") 'exwm-reset)
             (exwm-input-set-key (kbd "s-w") 'exwm-workspace-switch)
             (exwm-enable))

(use-package all-the-icons)

(use-package company
             :init
             (company-mode))

(use-package counsel
             :custom (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
             :config (counsel-mode))

(use-package doom-themes
             :init
             (setq doom-themes-enable-bold t)
             (setq doom-themes-enable-italic t)
             (load-theme 'doom-dracula t))

(use-package doom-modeline
             :init (doom-modeline-mode))

(use-package evil
             :init
             (setq evil-want-keybinding nil)
             (setq evil-want-integration t)
             (evil-mode)
             :custom
             (evil-want-C-u-scroll 1)
             (evil-shift-width 2))

(use-package evil-collection
             :init (evil-collection-init))

(use-package ivy
             :init (ivy-mode))

(use-package lsp-mode
             :init
             (unless (display-graphic-p) (setq lsp-headerline-breadcrumb-icons-enable nil))
             (setq lsp-keymap-prefix "C-c l")
             :hook
             (ruby-mode . lsp)
             (lsp-mode . lsp-enable-which-key-integration)
             :commands lsp)

(use-package magit
             :custom (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package perspective
             :bind
             ("C-x b" . persp-counsel-switch-buffer)
             :custom
             (persp-mode-prefix-key (kbd "C-c M-p"))
             :init
             (persp-mode))

(use-package projectile
             :init
             (setq projectile-switch-project-action #'projectile-dired)
             (setq projectile-project-search-path '(("~/dev" . 1)))
             (setq projectile-completion-system 'ivy)
             (setq projectile-git-submodule-command nil)
             (projectile-mode)
             :bind (:map projectile-mode-map ("C-c p" . projectile-command-map)))

(use-package rspec-mode
             :init
             (setq rspec-use-docker-when-possible t)
             (setq rspec-docker-command "docker-compose exec")
             (setq rspec-docker-container "web")
             (setq rspec-docker-cwd "/var/app/")
             (add-hook 'after-init-hook 'inf-ruby-switch-setup))

(use-package vterm)

(use-package which-key
             :init
             (setq which-key-idle-delay 2)
             (which-key-mode))
