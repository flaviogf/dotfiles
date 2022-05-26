(require 'package)

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'dracula-theme)
  (package-install 'dracula-theme))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(load-theme 'dracula t)

(use-package doom-modeline
             :ensure t
             :init
             (doom-modeline-mode 1))

(use-package evil
             :ensure t
             :init
             (evil-mode 1)
             :custom
             (evil-shift-width 2)
             (evil-want-C-u-scroll 1))

(use-package ivy
             :ensure t
             :init
             (ivy-mode 1))

(setq c-basic-offset 2
      cperl-indent-level 2
      indent-tabs-mode nil
      inhibit-startup-message t
      inhibit-splash-screen t
      tab-width 2)

(column-number-mode)
(global-display-line-numbers-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
