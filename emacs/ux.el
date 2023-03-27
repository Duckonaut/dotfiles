;; UX and builtin feature adjustments

(setq
 inhibit-startup-screen t
 initial-scratch-message nil
 sentence-end-double-space nil
 ring-bell-function 'ignore
 save-interprogram-paste-before-kill t
 use-dialog-box nil
 mark-even-if-inactive nil
 kill-whole-line t
 case-fold-search nil
 compilation-read-command nil
 compilation-scroll-output 'first-error
 use-short-answers t
 default-directory "~"
 fast-but-imprecise-scrolling t
 load-prefer-newer t
 confirm-kill-processes nil
 native-comp-async-report-warnings-errors 'silent
 truncate-string-ellipsis "…"
)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'tab-insert)
(setq-default basic-offset 4)
(setq
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil)
(setq custom-file (make-temp-name "/tmp/"))
(setq custom-safe-themes t)
(setq
 scroll-conservatively 1000                     ;; only 'jump' when moving this far
 scroll-margin 4                                ;; scroll N lines to screen edge
 scroll-step 1                                  ;; keyboard scroll one line at a time
 mouse-wheel-scroll-amount '(6 ((shift) . 1))   ;; mouse scroll N lines
 mouse-wheel-progressive-speed nil              ;; don't accelerate scrolling

 redisplay-dont-pause t                         ;; don't pause display on input

 ;; Always redraw immediately when scrolling,
 ;; more responsive and doesn't hang!
 fast-but-imprecise-scrolling nil
 jit-lock-defer-time 0
 )

(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)


(blink-cursor-mode -1)
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(delete-selection-mode t)
(column-number-mode)
(global-whitespace-mode)

(setq whitespace-style '(face tabs spaces trailing space-before-tab empty space-after-tab space-mark tab-mark missing-newline-at-eof))

(add-hook 'before-save-hook #'delete-trailing-whitespace)
(setq require-final-newline t)
(defalias 'view-emacs-news 'ignore)
(defalias 'describe-gnu-project 'ignore)
