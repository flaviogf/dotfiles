(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(all-the-icons
                     doom-modeline
                     dracula-theme
                     evil
                     use-package))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(load-theme 'dracula t)

(use-package all-the-icons)

(use-package doom-modeline
             :init
             (doom-modeline-mode 1))

(use-package evil
             :init
             (evil-mode 1)
             :custom
             (evil-want-C-u-scroll 1))

(setq c-basic-offset 2
      cperl-indent-level 2
      indent-tabs-mode nil
      inhibit-startup-message t
      inhibit-splash-screen t
      tab-width 2)

(global-linum-mode)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
