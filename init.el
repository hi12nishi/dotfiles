;; theme
(load-theme 'misterioso t)

;; utf-8
(prefer-coding-system 'utf-8)

;; disable creating backup file
(setq make-backup-files nil)

;; column / line
(column-number-mode t)
(global-display-line-numbers-mode)
;;(setq linum-format "%4d \u2502")

;; highlighting
(global-hl-line-mode t)
(custom-set-faces '(hl-line ((t (:background "dark green")))))

;; show full path in the titlebar
(setq frame-title-format "%f")

;; tab
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; change C-z to undo
(define-key global-map (kbd "C-z") 'undo)

;; get mouse event to emacs
(xterm-mouse-mode t)
(when (require 'mwheel nil 'noerror)
  (mouse-wheel-mode t))

;; move cursor by mouse wheel
(global-set-key [mouse-4] (kbd "C-p"))
(global-set-key [mouse-5] (kbd "C-n"))

;; clip board
(setq x-select-enable-clipboard t)


;; ====== package management =======
;; use straight.el
;; https://github.com/raxod502/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; install use-package
(straight-use-package 'use-package)

;; use straight.el and use-package collaboration
(setq straight-use-package-by-default t)


;; company
(use-package company
  :init
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)  ; default=4
  (setq company-selection-wrap-around t)
  :bind
  (:map company-active-map
		("M-n" . nil)
		("M-p" . nil)
		("C-n" . company-select-next)
		("C-p" . company-select-previous)
		("C-h" . nil)
		("<tab>" . company-complete-common-or-cycle))
  :config
  ;;(global-company-mode)
  (set-face-attribute 'company-tooltip nil
					  :foreground "black"
					  :background "lightgray")
  (set-face-attribute 'company-preview-common nil
					  :foreground "dark gray"
					  :background "black"
					  :underline t)
  (set-face-attribute 'company-tooltip-selection nil
					  :foreground "steelblue"
					  :background "white")
  (set-face-attribute 'company-tooltip-common nil
					  :foreground "black"
					  :underline t)
  (set-face-attribute 'company-tooltip-common-selection nil
					  :foreground "white"
					  :background "steelblue"
					  :underline t)
  (set-face-attribute 'company-tooltip-annotation nil
					  :foreground "red"))

;; company-irony
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

