;; Mappings

(-map (lambda (x) (unbind-key x)) '("C-x C-f" ;; find-file-read-only
                                    "C-x C-d" ;; list-directory
                                    "C-z" ;; suspend-frame
                                    "C-x C-z" ;; again
                                    "M-o" ;; facemenu-mode
                                    "<mouse-2>" ;; pasting with mouse-wheel click
                                    "<C-wheel-down>" ;; text scale adjust
                                    "<C-wheel-up>" ;; ditto
                                    "s-n" ;; make-frame
                                    "C-x C-q" ;; read-only-mode
                                    ))

(defun pt/yank ()
  "Call yank, then indent the pasted region, as TextMate does."
  (interactive)
  (let ((point-before (point)))
    (if mark-active (call-interactively 'delete-backward-char))
    (yank)
    (indent-region point-before (point))))

(bind-key "C-y" #'pt/yank)
(bind-key "s-v" #'pt/yank)
(bind-key "C-Y" #'yank)
(bind-key "C-s" #'isearch-forward-regexp)
(bind-key "C-c s" #'isearch-forward-symbol)

(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)
(defun my-move-key (keymap-from keymap-to key)
    "Moves key binding from one keymap to another, deleting from the old location. "
    (define-key keymap-to key (lookup-key keymap-from key))
    (define-key keymap-from key nil))
(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(my-move-key evil-motion-state-map evil-normal-state-map " ")

;; Pane focus

(windmove-default-keybindings)

;; Leader mappings

(define-key evil-normal-state-map " " nil)
(define-key evil-motion-state-map " " nil)

(define-prefix-command 'leader-map)

(define-key evil-normal-state-map " " 'leader-map)
(define-key leader-map "e" 'neotree-toggle)
(define-key leader-map "|" 'split-window-right)
(define-key leader-map "-" 'split-window-below)

(define-key leader-map (kbd "p") 'projectile-command-map)
(define-key leader-map (kbd "lf") 'lsp-format-buffer)
(define-key leader-map (kbd "ls") 'lsp)
(define-key leader-map (kbd "lx") 'lsp-workspace-shutdown)
(define-key leader-map (kbd "li") 'lsp-describe-session)
(define-key leader-map (kbd "lr") 'lsp-rename)
(define-key leader-map (kbd "lh") 'lsp-describe-thing-at-point)
(define-key leader-map (kbd "lc") 'lsp-execute-code-action)
(define-key leader-map (kbd "lgr") 'lsp-find-references)
(define-key leader-map (kbd "lgi") 'lsp-find-implementation)
(define-key leader-map (kbd "lgd") 'lsp-find-definition)
(define-key leader-map (kbd "lgD") 'lsp-find-declaration)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "C") 'neotree-change-root)
