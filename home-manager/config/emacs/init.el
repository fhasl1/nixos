(setq inhibit-startup-message t)
(setq visible-bell t)
(setq use-package-always-ensure t)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-want-C-i-jump nil
        evil-want-C-u-scroll t
        evil-ex-substitute-global t
        evil-want-integration t))

(use-package evil-leader
  :ensure t
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "f" 'find-file
    "b" 'switch-buffer
    "g" 'magit-status
    "/" 'counsel-rg
    "s" 'save-buffer))

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3
        which-key-idle-secondary-delay 0.05))

(use-package use-package
  :ensure t
  :config
  (setq use-package-always-ensure t))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p)
  :config
  (all-the-icons-install-fonts '(:font "DejaVuSansMono" :scale 1.2)))

(use-package nerd-icons
  :ensure t
  :if (display-graphic-p))

(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-limit 10
        company-show-numbers t))

(use-package company-box
  :ensure t
  :after company
  :config
  (company-box-mode))

(use-package company-quickhelp
  :ensure t
  :after company
  :config
  (company-quickhelp-mode 1)
  (setq company-quickhelp-delay 0.5))

(use-package vertico
  :ensure t
  :config
  (vertico-mode)
  (setq vertico-count 15
        vertico-cycle t))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-overrides nil))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package embark
  :ensure t
  :config
  (embark-dwim-mode))

(use-package consult
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'consult-M-x)
  (global-set-key (kbd "C-x b") 'consult-buffer)
  (global-set-key (kbd "C-x C-f") 'consult-file)
  (global-set-key (kbd "M-y") 'consult-yank-pop)
  (consult-customize 'find-file '((preview . t))))

(use-package consult-lsp
  :ensure t
  :after lsp-mode)

(use-package corfu
  :ensure t
  :after company
  :config
  (global-corfu-mode)
  (setq corfu-auto t
        corfu-auto-prefix 1
        corfu-cycle t))

(use-package cape
  :ensure t
  :after company
  :config
  (add-hook 'company-completion-started-hook 'cape-company-on)
  (add-hook 'company-completion-finished-hook 'cape-company-off))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((python-mode . lsp)
         (typescript-mode . lsp)
         (go-mode . lsp)
         (rust-mode . lsp)
         (lua-mode . lsp)
         (nix-mode . lsp))
  :config
  (setq lsp-keymap-prefix "C-c l"
        lsp-enable-snippet nil
        lsp-enable-completion-at-point t
        lsp-idle-delay 0.5
        lsp-signature-auto-activate nil
        lsp-diagnostics-provider :flycheck
        lsp-enable-indentation nil)
  (add-hook 'lsp-mode-hook 'lsp-enable-which-key-integration))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'bottom
        lsp-ui-sideline-enable t
        lsp-ui-peek-enable t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-posframe
  :ensure t
  :after flycheck
  :if (display-graphic-p)
  :config
  (flycheck-posframe-mode))

(use-package lsp-treemacs
  :ensure t
  :after lsp-mode)

(use-package treemacs
  :ensure t
  :after lsp-treemacs
  :config
  (setq treemacs-is-never-other-window t)
  (global-set-key (kbd "C-x t") 'treemacs))

(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-completion-system 'vertico
        projectile-indexing-method 'alien))

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-completing-read-function 'completing-read))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode)
  (setq git-gutter:update-interval 2
        git-gutter:modified-sign "~"
        git-gutter:added-sign "+"
        git-gutter:deleted-sign "-"))

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'"
  :config
  (add-hook 'nix-mode-hook 'lsp)
  (add-hook 'nix-mode-hook 'flycheck-mode))

(use-package rustic
  :ensure t
  :hook (rust-mode . rustic-mode)
  :config
  (rustic-lsp-enable))

(use-package lsp-treemacs
  :ensure t
  :after lsp-mode)

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'")

(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'")

(use-package json-mode
  :ensure t
  :mode "\\.json\\'")

(use-package toml-mode
  :ensure t
  :mode "\\.toml\\'")

(use-package sh-script
  :mode ("\\.sh\\'" . sh-mode))

(use-package web-mode
  :ensure t
  :mode ("\\.html?\\'" "\\.jsx?\\'" "\\.tsx?\\'"))

(use-package css-mode
  :mode "\\.css\\'")

(use-package scss-mode
  :ensure t
  :mode "\\.scss\\'")

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'")

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")

(use-package lua-mode
  :ensure t
  :mode "\\.lua\\'")

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" "\\.markdown\\'")
  :config
  (setq markdown-command "pandoc"))

(use-package org
  :ensure org-plus-contrib
  :config
  (setq org-startup-indented t
        org-hide-leading-stars t
        org-log-done 'time)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode 1)
  (setq doom-modeline-height 25
        doom-modeline-bar-width 2
        doom-modeline-buffer-file-name-style 'truncate-with-project
        doom-modeline-major-mode-color-icon t
        doom-modeline-minor-modes t
        doom-modeline-github t
        doom-modeline-gitlab t
        doom-modeline-persp-name t))

(use-package all-the-icons-dired
  :ensure t
  :after dired
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package nerd-icons-dired
  :ensure t
  :after dired
  :config
  (add-hook 'dired-mode-hook 'nerd-icons-dired-mode))

(use-package all-the-icons-ivy
  :ensure t
  :after ivy)

(use-package nerd-icons-ivy
  :ensure t
  :after ivy-rich)

(use-package nerd-icons-ivy-rich
  :ensure t
  :after ivy-rich)

(use-package which-key-posframe
  :ensure t
  :after which-key
  :if (display-graphic-p)
  :config
  (which-key-posframe-setup))

(setq-default indent-tabs-mode nil
              tab-width 2
              fill-column 100
              x-select-enable-clipboard t
              x-select-enable-primary t
              save-place t
              require-final-newline t
              delete-old-versions -1
              kept-new-versions 6
              kept-old-versions 2
              version-control t)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative
      display-line-numbers-current-absolute t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-f") 'find-file)
(global-set-key (kbd "C-x b") 'switch-to-buffer)

(setq-default indent-tabs-mode nil)
(setq tab-width 2)

(setq frame-title-format '("%b" " %f"))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq make-backup-files nil
      auto-save-default nil)

(setq initial-scratch-message nil)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'undo)

(provide 'init)