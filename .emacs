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
             (setq doom-themes-enable-bold t)
             (setq doom-themes-enable-italic t)
             (load-theme 'doom-dracula t))

(use-package doom-modeline
             :ensure t
             :init
             (doom-modeline-mode 1))

(use-package evil
             :ensure t
             :init
             (setq evil-want-integration t)
             (setq evil-want-keybinding nil)
             (evil-mode 1)
             :custom
             (evil-shift-width 2)
             (evil-want-C-u-scroll 1))

(use-package evil-collection
             :ensure t)

(use-package ivy
             :ensure t
             :init
             (ivy-mode 1))

(use-package magit
             :ensure t)

(use-package projectile
             :ensure t
             :init
             (setq projectile-project-search-path '(("~/dev" . 1)))
             (setq projectile-switch-project-action #'projectile-dired)
             (projectile-mode 1)
             :bind
             (:map projectile-mode-map
                   ("C-c p" . projectile-command-map)))

(use-package which-key
             :ensure t
             :init
             (setq which-key-idle-delay 0)
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
