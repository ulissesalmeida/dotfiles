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
   '("e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" default))
 '(package-selected-packages
   '(dashboard projectile doom-modeline doom-themes alchemist which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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
  (load-theme 'doom-dracula))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

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
  
(setq inhibit-startup-message t)

(tool-bar-mode -1)

(menu-bar-mode -1)

(global-hl-line-mode +1)

(delete-selection-mode 1)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(show-paren-mode 1)

(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)
