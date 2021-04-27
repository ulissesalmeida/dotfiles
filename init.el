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
   '(counsel ivy dashboard projectile doom-modeline doom-themes alchemist which-key use-package)))
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

(use-package company
  :ensure t
  :config (add-hook 'after-init-hook 'global-company-mode))

(use-package alchemist
  :pin "melpa-stable"
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one))

;; Noice bottom status bar
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; Icons for the noice status bar
(use-package all-the-icons
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))

(use-package dashboard
  :ensure t
  :pin "melpa-stable"
  :init
  (progn
    (setq dashboard-items '((recents . 3)
			   (projects . 3)
			   (bookmarks . 5)))
    (setq dashboard-show-shortcuts t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-heading-icons t)
    )
  :config
  (dashboard-setup-startup-hook))

(use-package ivy
  :ensure t
  :pin "melpa-stable"
  :init
  (progn
    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "(%d/%d) ")
    )
  :config (ivy-mode 1))

(use-package swiper
  :ensure t
  :pin "melpa-stable"
  :config (global-set-key "\C-s" 'swiper))

(use-package counsel
  :ensure t
  :pin "melpa-stable"
  :config (counsel-mode 1))

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

;; Make left option,cmd works as mac default
;; Use the right option as Meta
(setq mac-right-option-modifier 'meta
      mac-command-modifier 'none
      mac-option-modifier 'none)

;; Follow symbolic links without asking
(setq vc-follow-symlinks t)

;; (setq ido-everywhere t)
;; (setq ido-enable-flex-matching t)
;; (ido-mode t)
