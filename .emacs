(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(global-evil-leader-mode)
(require 'evil)
(evil-mode t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;changes colorscheme and font to something more useable
(load-theme 'gruvbox-dark-soft t)
(set-face-attribute 'default t :font "Inconsolata-14")

;removes ugly GUI stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'powerline)
(powerline-default-theme)

(require 'evil-leader)

; ---- Button mappings ----
;Mapping leader
(evil-leader/set-leader "<SPC>")

;Leader mappings
(evil-leader/set-key
	"q" 'kill-this-buffer
	"w" 'save-buffer
	;opens up ranger file explorer
	"e" 'ranger)

;misc button mappings
