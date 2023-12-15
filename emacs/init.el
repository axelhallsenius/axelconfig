;init.el

;package stuff:
;;melpa
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))


;(package-initialize)
;(package-refresh-contents)



;run in evil mode
(setq evil-shift-width 0)
(require 'evil)
(evil-mode 1)

;loads visual config
(load-file "~/.emacs.d/visuals.el")

;loads evil-keybinds
(load-file "~/.emacs.d/evil-keybinds.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil org-evil goto-char-preview cl-libify goto-last-change undo-tree evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
