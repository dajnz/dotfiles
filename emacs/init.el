;;---------
;; Packages settings
;;---------

;; Use the package manager
(require 'package)

;; Sets package management sources
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives 
               '("gnu" . "http://elpa.gnu.org/packages/")))

;; Initialize the package manager
(package-initialize)


;;---------
;; UI settings
;;---------

;; Don't display the ugly startup message (particularly ugly in the GUI)
(setq inhibit-startup-message t)

;; No toolbar
(tool-bar-mode -1)

;; Hides main menu bar
(menu-bar-mode -1)

;; No tooltips
(tooltip-mode -1)

;; No scrollbars
(scroll-bar-mode -1)

;; No gui dialogs, everything via minibuffer
(setq use-dialog-box nil)

;; Better buffer rendering
(setq redisplay-dont-pause t)

;; Disable sound
(setq ring-bell-function 'ignore)

;; Get rid of the butt ugly OSX scrollbars in GUI
(when (display-graphic-p) (set-scroll-bar-mode nil))

;; Use solarized dark (in GUI)
(when (display-graphic-p) (load-theme 'molokai t))

;; Short answers format for importans stuff ('y' or 'n' instead 'yes' or 'no')
(defalias 'yes-or-no-p 'y-or-n-p)

;;---------
;; Visual style settings
;;---------

;; Use Source Code Pro 14pt in GUI
(when (display-graphic-p) (set-face-attribute 'default nil :font "Droid Sans Mono For Powerline" :height 100))

;; (powerline-center-theme)
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)


;;---------
;; Helm mode settings
;;---------

;; Enabling of fuzzy-searcher
(helm-mode 1)


;;---------
;; Evil leader mode settings
;;--------- 

(require 'evil-leader)
;; Enabling evil-leader in all buffers where evil mode is enabled
(global-evil-leader-mode)
;; Settings spacebar as leader key
(evil-leader/set-leader "<SPC>")
;; Definition of evil-leader key-combos and actions
(evil-leader/set-key
  "a" 'ace-jump-mode
  "b" 'ace-jump-mode-pop-mark)

(setq evil-shift-width 2)
;;---------
;; Evil mode settings
;;--------- 

;; Use evil mode
(require 'evil)
(evil-mode t)


;;---------
;; Enable evil-surrount mode
;;---------

(add-to-list 'load-path "~/.emacs.d/vendor/evil-surround")
(require 'evil-surround)
(global-evil-surround-mode 1)


;;---------
;; Expand-region mode settings
;;---------

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;;---------
;; Ace jump mode settings
;;--------- 

(add-to-list 'load-path "~/.emacs.d/elpa/ace-jump-mode-20140616.115")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; enable a more powerful jump back function from ace jump mode
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; If you use evil
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)


;;---------
;; Text wrapping settings
;;--------- 

;; Enables wrapping of long lines and keeping existing line indentation (with use of adaptive-wrap package)
(require 'adaptive-wrap)

;; Wrapping by words
(setq word-wrap t)
(global-visual-line-mode t)

;; (global-adaptive-wrap-prefix-mode 1)
(add-hook 'visual-line-mode-hook 'adaptive-wrap-prefix-mode)

;; keep indentation when moving on new line 
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))


;;---------
;; Text indentation settings
;;--------- 

;; Indentation size - 4 spaces
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default evil-shift-width 4)

;; Default indentation - 4 spaces
; (setq-default standart-indent 4)

;; Indent lisp-expressions by 4 spaces
; (setq-default lisp-body-indent 4)

;; Disable indentation with tabs characters
(setq-default indent-tabs-mode nil)

;; Do newline and indentation on enter key pressing
(global-set-key (kbd "RET") 'newline-and-indent)
(setq lisp-indent-function  'common-lisp-indent-function)


;;---------
;; Code-specific settings
;;--------- 

;; Autoclosing of {}, [], ()
(electric-pair-mode 1)
;; Show paired braces and brackets
(show-paren-mode t)


;;---------
;; Autobackup and lock files settings
;;--------- 

;; Disable lock files
(setq create-lockfiles nil)
;; Don't create backup files
(setq make-backup-files nil)


;;---------
;; Codepage settings
;;--------- 

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;;---------
;; Hotkeys
;;--------- 

;; Give us back Ctrl+U for vim emulation
(setq evil-want-C-u-scroll t)

(define-key evil-normal-state-map " " 'helm-mini)

;; Moving up and down by visual lines, so long wrapped lines treated as several visual lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; C-k and C-j works like PageUp/PageDown
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                    (interactive)
                    (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                        (interactive)
                        (evil-scroll-down nil)))

;; -------------
; (define-key evil-insert-state-map (kbd "<tab>") 'indent-relative)
; (define-key evil-insert-state-map (kbd "<backtab>") 'back-to-indentation)

(defun djoyner/evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun djoyner/evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

; Overload shifts so that they don't lose the selection
; (define-key evil-visual-state-map (kbd ">") 'djoyner/evil-shift-right-visual)
; (define-key evil-visual-state-map (kbd "<") 'djoyner/evil-shift-left-visual)
; (define-key evil-visual-state-map (kbd "<tab>") 'djoyner/evil-shift-right-visual)
; (define-key evil-visusl-state-map (kbd "<backtab>") 'djoyner/evil-shift-left-visual)
(define-key evil-insert-state-map (kbd "<tab>") 'indent-relative)
(define-key evil-insert-state-map (kbd "<backtab>") 'delete-indentation)

