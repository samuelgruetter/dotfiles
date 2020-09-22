(require 'package)

(custom-set-variables
 ;; maximize emacs window on startup
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 ;; disable proof general splash screen
 '(proof-splash-enable nil))

(package-initialize)

;; Open .v files with Proof General's Coq mode
(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; F7 to save current buffer and recompile
(defun save-and-recompile ()
  (interactive)
  (save-buffer)
  (recompile))
(global-set-key (kbd "<f7>") 'save-and-recompile)

;; Jumping between frames using C-c arrow
;; I don't want (windmove-default-keybindings) because they are S-up, S-down etc
;; which I use for marking text
;; https://www.emacswiki.org/emacs/WindMove
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Proof General: don't print '=>' over source code to show next command to process
(setq overlay-arrow-string "")

;; Don't show Emacs startup screen
(setq inhibit-startup-screen t)

;; I don't want scroll tool bars, scroll bars, or menu bars
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)

;; Delete trailing whitespace before saving (warning: can create large diffs when
;; making a small edit in a file written by someone who doesn't use this setting)
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Break lines at word boundaries
(global-visual-line-mode 1)

;; don't jump to warnings, but only to errors, when hitting M-g M-n in *compilation* buffer
(setq compilation-skip-threshold 2)

;; compute line numbers even if there are very wide lines (might be slow)
(setq line-number-display-limit-width 2000000)

;; highlight matching parenthesis
(show-paren-mode 1)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; don't typeset superscripts and subscripts in latex mode
(setq tex-fontify-script nil)

;; scroll to end of *compilation* buffer
(setq compilation-scroll-output t)

;; Font size in all buffers
;; can also run this with M-x eval-expression for just temporary (but all buffers)
(set-face-attribute 'default nil :height 190)
