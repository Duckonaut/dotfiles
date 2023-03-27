;; Packages

(use-package recentf
  :config
  (add-to-list 'recentf-exclude "\\elpa")
  (add-to-list 'recentf-exclude "private/tmp")
  (recentf-mode))

(use-package request
  :ensure t)
(use-package s)
(use-package dash)

(use-package undo-tree
  :diminish
  :bind (("C-c _" . undo-tree-visualize))
  :init
  (global-undo-tree-mode +1)
  (unbind-key "M-_" undo-tree-map))

(use-package dabbrev
  :bind (("C-/" . #'dabbrev-completion))
  :custom
  (dabbrev-case-replace nil))

;; TODO: I want to use the fancy-dabbrev package everywhere,
;; but it uses popup.el rather than read-completion, and
;; I don't like how quickly it operates on its inline suggestions

(use-package all-the-icons)

(use-package all-the-icons-dired
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package doom-themes
  :config
  (let ((chosen-theme 'doom-one))
    (doom-themes-visual-bell-config)
    (doom-themes-org-config)
    (setq doom-challenger-deep-brighter-comments t
          doom-challenger-deep-brighter-modeline t
          doom-ir-black-brighter-comments t
          modus-themes-org-blocks 'gray-background
          doom-dark+-blue-modeline nil)
    (load-theme chosen-theme)))

(use-package diminish
  :config
  (diminish 'visual-line-mode))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package evil
  :ensure t
  :init
  (evil-mode 1)
  :config
  (custom-set-variables
   '(evil-undo-system 'undo-tree))
  (add-hook 'evil-local-mode-hook 'turn-on-undo-tree-mode))

(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t))

(use-package which-key
  :ensure t
  :init (which-key-mode))

(use-package tree-sitter
  :ensure t
  :init
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t)

(use-package tree-sitter-indent
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package csharp-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-tree-sitter-mode)))

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (rust-mode . lsp)
         (charp-mode . lsp)
         (c++-mode . lsp)
         (c-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)


(use-package flycheck
  :ensure t)

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.0)
  (setq company-minimum-prefix-length 1)
  :init
  (company-mode))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1))

(use-package vterm
    :ensure t)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "It's Emacs Time")
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (registers . 5)))
  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
      `(
        (
         (,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
          "Github"
          "Browse github"
          (lambda (&rest _) (browse-url "https://github.com")))
         (,(all-the-icons-faicon "gitlab" :height 1.1 :v-adjust 0.0)
          "Gitlab"
          "Browse gitlab"
          (lambda (&rest _) (browse-url "https://gitlab-stud.elka.pw.edu.pl")) error)
        )
        (
         (,(all-the-icons-octicon "globe" :height 1.1 :v-adjust 0.0)
          "Homepage"
          "Browse homepage"
          (lambda (&rest _) (browse-url "https://duckonaut.me")) warning)
         )
        )
      )
  (dashboard-setup-startup-hook))

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))


(use-package git-gutter-fringe
  :ensure t)

(define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom)
