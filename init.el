(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" default))
 '(package-selected-packages
   '(swiper lsp-treemacs ls-treemacs lsp-ivy lsp-ui lsp-mode flycheck centaur-tabs expand-region treemacs-all-the-icons treemacs-projectile treemacs counsel ivy dashboard projectile doom-modeline doom-themes alchemist which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Show a preview of commands shortcuts(try ctrl+x)
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Auto complete
(use-package company
  :ensure t
  :hook
  (after-init . global-company-mode))

(use-package doom-themes
  :ensure t
  ;; Loading doom theme for treemacs not working
  ;; :custom
  ;; (doom-themes-treemacs-theme "doom-colors")
  :config
  (load-theme 'doom-one t)
  ;; (doom-themes-treemacs-config)
  )

;; Noice bottom status bar
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; Icons for the noice status bar
(use-package all-the-icons
  :ensure t)

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-x p" . projectile-command-map)
  :config
  (projectile-mode +1)
  (setq projectile-completion-system 'ivy))

;; Add nice startup dashboard
(use-package dashboard
  :ensure t
  :pin "melpa-stable"
  :init
  (setq dashboard-items '((recents . 5)
			  (projects . 5)
			  (bookmarks . 5)))
  (setq dashboard-show-shortcuts t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-heading-icons t)
  :config
  (dashboard-setup-startup-hook))

;; Better search results interface
(use-package ivy
  :ensure t
  :pin "melpa-stable"
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :config (ivy-mode 1))

;; Better search in the file interface
(use-package swiper
  :ensure t
  :pin "melpa-stable"
  :config (global-set-key "\C-s" 'swiper))

;; Apply ivy search result in many emacs commands
(use-package counsel
  :ensure t
  :pin "melpa-stable"
  :config (counsel-mode 1))

;; Nice tree file visualisation on the left panel
(use-package treemacs
  :ensure t
  :bind
  ("C-9" . treemacs)
  ("C-0" . treemacs-select-window)
  :config
  (setq treemacs-is-never-other-window t))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;; Quick selection
(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

;; Add top tabs to Emacs Editor
(use-package centaur-tabs
  :ensure t
  :custom
  (centaur-tabs-style "rounded")
  (centaur-tabs-height 24)
  (centaur-tabs-set-icons t)
  (centaur-tabs-gray-out-icons 'buffer)
  (centaur-tabs-set-bar 'left)
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-modified-marker "·")
  (centaur-tabs-cycle-scope 'tabs)
  :config
  (centaur-tabs-headline-match)
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-mode t)
  :bind
  ("C-," . centaur-tabs-backward)
  ("C-." . centaur-tabs-forward)
  ("C-c C-j" . centaur-tabs-backward-group)
  ("C-c C-k" . centaur-tabs-forward-group))

;; Syntax checker (credo style)
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

;; lsp-mode: IDE kinda for emacs
(use-package lsp-mode
  :ensure t
  :pin "melpa-stable"
  :init
  (add-to-list 'exec-path "~/.elixir_ls")
  :custom
  (lsp-keymap-prefix "C-l")
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  (elixir-mode . lsp)
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :pin "melpa-stable"
  :custom
  (lsp-ui-doc-enable nil)
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :ensure t
  :commands (lsp-ivy-workspace-symbol))

(use-package lsp-treemacs
  :ensure t
  :commands (lsp-treemacs-error-list))

;; Hide statup message
(setq inhibit-startup-message t)

(tool-bar-mode -1)

(menu-bar-mode -1)

;; Hilight the current line
(global-hl-line-mode +1)

;; Delete the current selection when typing new things
(delete-selection-mode 1)

;; Display line numbers only for programming files
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Highlight the parens when cursor is on it
(show-paren-mode 1)

;; Set font size
(set-face-attribute 'default nil :height 200)

;; Set tab size
(setq default-tab-width 2)

;; Make left option,cmd works as mac default
;; Use the right option as Meta
(setq mac-right-option-modifier 'meta
      mac-command-modifier 'none
      mac-option-modifier 'none)

;; Follow symbolic links without asking
(setq vc-follow-symlinks t)

;; Save bookmark file for every modification
(setq bookmark-save-flag 1)

;; Save emacs support files in other directory
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t)))

(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
