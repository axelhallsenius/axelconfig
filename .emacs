; Welcome to Axels horrible .emacs! It looks neat, but ycmd isn't quite working for me yet, I'm afraid. If you have questions, contact me at my gmail
					; axelhallsenius@gmail.com
;Have fun confing


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
;; Set default font
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 135
                    :weight 'light
                    :width 'normal)
;(set-face-attribute 'default t :font "Inconsolata")

;removes ugly GUI stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;(require 'powerline)
;(powerline-default-theme)
(require 'telephone-line-config)
;tel line config:
(setq telephone-line-lhs
      '((evil   . (telephone-line-evil-tag-segment))
        (accent . (telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment
                   telephone-line-process-segment))
        (nil    . (telephone-line-minor-mode-segment
                   telephone-line-buffer-segment))))
(setq telephone-line-rhs
      '((nil    . (telephone-line-misc-info-segment))
        (accent . (telephone-line-major-mode-segment))
        (evil   . (telephone-line-airline-position-segment))))

(setq telephone-line-primary-left-separator 'telephone-line-cubed-right
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-right
      telephone-line-primary-right-separator 'telephone-line-cubed-left
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-left)
(setq telephone-line-height 24
      telephone-line-evil-use-short-tag t)

(telephone-line-evil-config)

(require 'evil-leader)

(require 'smex)
; ---- Global settings ----
(global-linum-mode t)

; ---- Button mappings ----
;Mapping leader
(evil-leader/set-leader "<SPC>")

;Leader mappings
(evil-leader/set-key
	"q" 'kill-this-buffer
	"w" 'save-buffer
	"<SPC>" 'smex

	"k" 'windmove-up
	"j" 'windmove-down
	"h" 'windmove-left
	"l" 'windmove-right


	;"x" 'execute-extended-command
	;opens up ranger file explorer
	"x" 'ranger)

;misc button mappings

;Esc vim behaviour
;mapped ö to esc
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map "ö" 'keyboard-quit)
(define-key evil-visual-state-map "ö" 'keyboard-quit)
(define-key minibuffer-local-map "ö" 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map "ö" 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map "ö" 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map "ö" 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map "ö" 'minibuffer-keyboard-quit)


;;Cycle buffer mappings
;(define-key evil-normal-state-map (kbd "C-<tab>") 'evil-next-buffer)
;(define-key evil-normal-state-map (kbd "C-<backtab>") 'evil-prev-buffer)
(define-key evil-normal-state-map (kbd "M-k") 'evil-next-buffer)
(define-key evil-normal-state-map (kbd "M-j") 'evil-prev-buffer)

(unless window-system
  (add-hook 'linum-before-numbering-hook
	    (lambda ()
	      (setq-local linum-format-fmt
			  (let ((w (length (number-to-string
					    (count-lines (point-min) (point-max))))))
			    (concat "%" (number-to-string w) "d"))))))

(defun linum-format-func (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   (propertize " " 'face 'mode-line)))

(unless window-system
  Battery 0: Discharging, 80%, 04:47:55 remaining
(setq linum-format 'linum-format-func))

(with-eval-after-load 'evil-maps
    (define-key evil-insert-state-map (kbd "ö") 'evil-normal-state))

(define-key evil-normal-state-map (kbd "ä") 'ace-jump-char-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("65d9573b64ec94844f95e6055fe7a82451215f551c45275ca5b78653d505bc42" "f6a935e77513ba40014aa8467c35961fdb1fc936fa48407ed437083a7ad932de" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;completion menu
;YAsnippet
;(add-to-list 'load-path
;              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;(require 'projectile)
;(pr

;(require 'ycmd)
;(add-hook 'after-init-hook #'global-ycmd-mode)

;(set-variable 'ycmd-server-command '("python" "~/confrepos/ymcd/"))
;GLobal ycmd conf:(set-variable 'ycmd-global-config "~//to/global_config.py")
;(require 'company-ycmd)
;(add-hook 'after-init-hook 'global-company-mode)
;(company-ycmd-setup)

(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(require 'evil-org)

(add-to-list 'load-path "~/.emacs.d/plugins/edit-indirect")

(define-key evil-insert-state-map (kbd "M-e") 'edit-indirect)
;setting C- swedo chars to act as normal swedo chars
;(define-key evil-insert-state-map (kbd "C-ö") (insert-char 00F6))
;(define-key evil-insert-state-map (kbd "C-ä") (insert-char 00F6))

;resize buffers
;(define-key evil-normal-state-map (kbd "C-M-j") 'enlarge-window)
;(define-key evil-normal-state-map (kbd "C-M-k") 'shrink-window)
;(define-key evil-normal-state-map (kbd "C-M-h") 'enlarge-window-horizontally)
;(define-key evil-normal-state-map (kbd "C-M-l") 'shrink-window-horizontally)

;(add-hook 'text-mode 'visual-line-mode)
;(add-hook 'text-mode 'window-margin-mode)
;(add-hook 'text-mode window-margin-width 80)