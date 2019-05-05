; ;; window divider
; (defun my-change-window-divider ()
;     (let
;         ((display-table (or buffer-display-table standard-display-table)))
;         (set-display-table-slot display-table 5 ?│)
;         (set-window-display-table (selected-window) display-table)
;     )
; )
;
; (add-hook 'window-configuration-change-hook 'my-change-window-divider)





(setq package-list
    '(
          xah-css-mode
          yasnippet
          projectile
          use-package
          neotree
          minimap
          auto-complete
    )
)

;; ------------------------
;; add package repositories
;; ------------------------

(require 'package)

(setq
    package-archives
    '(
          ("gnu elpa" . "https://elpa.gnu.org/packages/")
          ("elpa" . "http://tromey.com/elpa/")
          ("melpa stable" . "https://stable.melpa.org/packages/")
          ("melpa" . "https://melpa.org/packages/")
          ("marmalade" . "http://marmalade-repo.org/packages/")
    )

    package-archive-priorities
    '(
          ("gnu elpa" . 11)
          ("elpa" . 10)
          ("melpa stable" . 9)
          ("melpa" . 8)
          ("marmalade" . 7)
    )
)

(package-initialize)


; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
;; --------------------------
;; automatic custom additions
;; --------------------------

;; (custom-set-variables
;;     ;; custom-set-variables was added by Custom.
;;     ;; If you edit it by hand, you could mess it up, so be careful.
;;     ;; Your init file should contain only one such instance.
;;     ;; If there is more than one, they won't work right.
;;     '(package-selected-packages
;;         (quote
;;             (xah-css-mode yasnippet projectile use-package neotree minimap auto-complete)
;;         )
;;     )
;; )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; -------------
;; mouse support
;; -------------

(unless window-system
    (require 'mouse)
    (xterm-mouse-mode t)

    (global-set-key [mouse-4]
        (lambda()
            (interactive)
            (scroll-down 1)
        )
    )

    (global-set-key [mouse-5]
        (lambda()
            (interactive)
            (scroll-up 1)
        )
    )

    (defun track-mouse (e))
    (setq mouse-sel-mode t)
)

;; ----
;; tabs
;; ----

(setq tab-width 4)
(setq indent-tabs-modes nil)
;; set auto indent spaces
(setq c-default-style "linux" c-basic-offset 4)

;; -----------------------
;; cursor (text and mouse)
;; -----------------------

;; highlight cursor line
(global-hl-line-mode 1)

(modify-all-frames-parameters (list (cons 'cursor-type 'bar)))
(setq x-pointer-shape 'modeline)

;; ------------------
;; no startup message
;; ------------------

;; (setq inhibit-startup-message t)

;; -------------------------
;; line and column numbering
;; -------------------------

(setq line-number-mode t)
(setq column-number-mode t)

;; enable line numbering
(global-linum-mode t)

(setq linum-format "%4d \u2502 ")

;; Set column-mode to always be on
(setq column-number-mode t)

;; ----------
;; load theme
;; ----------

(load "~/.emacs.d/themes/emacs-esthetique-theme/emacs-esthetique-theme.el")

;; ------------------------------
;; remove theme background colour
;; ------------------------------

(defun set-background-for-terminal(&optional frame)
    (or frame
        (setq frame (selected-frame))
    )

    "unsets the background color in terminal mode"

    (unless (display-graphic-p frame)
        (set-face-background 'default "unspecified-bg" frame)
    )
)

(add-hook 'after-make-frame-functions 'set-background-for-terminal)
(add-hook 'window-setup-hook 'set-background-for-terminal)

;; ----------------
;; package: neotree
;; ----------------

;; show on emacs startup
(defun neotree-startup ()
    (interactive)
    (neotree-show)
    (call-interactively 'other-window)
)

(setq neo-autorefresh nil)

(if (daemonp)
    (add-hook 'server-switch-hook #'neotree-startup)
    (add-hook 'after-init-hook #'neotree-startup)
)

;; show hidden files
(setq-default neo-show-hidden-files t)

(defun on-mouse1-click
    (*click)
    (interactive "e")
    (let
      ((p1 (posn-point (event-start *click))))
      (goto-char p1)
      (push-button)
      (neotree-enter))
)
(global-set-key (kbd "<mouse-1>") 'on-mouse1-click)



;; --------------
;; init dubugging
;; --------------

(save-excursion
    (let
        ((tem eval-buffer-list))

        (while
            (and tem
                (re-search-forward "^  eval-\\(buffer\\|region\\)(" nil t)
            )

            (beginning-of-line)

            (insert
                (apply 'format "Error at line %d, column %d (point %d) in %s\n"
                    (with-current-buffer (car tem)
                       (list
                            (line-number-at-pos (point))
                            (current-column)
                            (point)
                            (buffer-name)
                       )
                    )
                )
            )

            (pop tem)
        )
    )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-complete minimap neotree use-package projectile yasnippet xah-css-mode)))
)


;;(window-divider-mode)
;; (set-face-background 'vertical-border "gray")
;; (set-face-foreground 'vertical-border (face-background 'vertical-border))
