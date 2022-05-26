(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(all-the-icons
		     doom-modeline
		     dracula-theme
		     evil))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(load-theme 'dracula t)

(require 'evil)
(evil-mode 1)

(require 'doom-modeline)
(doom-modeline-mode 1)

(setq inhibit-startup-message t
      inhibit-splash-screen t)

(global-linum-mode)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
