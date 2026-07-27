(setq inhibit-startup-message t)
(setq visible-bell t)
(setq use-package-always-ensure nil)

(setq package-quickstart t)
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(setq warning-suppress-types '((package)))
(dolist (dir load-path)
  (when (string-match-p "elpa/" dir)
    (add-to-list 'custom-theme-load-path dir)))
(load-theme 'tao-yin t)

(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 115)
(electric-indent-mode 1)
(electric-pair-mode -1)
(setq-default electric-indent-chars '(?\{ ?\} ?\( ?\) ?: ?\; ?\#))

(setq evil-want-C-i-jump nil
      evil-want-C-u-scroll t
      evil-ex-substitute-global t
      evil-want-integration t)
(use-package evil
  :config
  (evil-mode 1)
  (evil-define-key 'insert 'global (kbd "RET") 'newline-and-indent))

(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "-" 'counsel-find-file
    "b" 'switch-buffer
    "g" 'magit-status
    "/" 'counsel-rg
    "s" 'save-buffer
    "r" 'load-file
    "n" 'denote
    "N" 'denote-region
    "l" 'denote-link
    "B" 'denote-backlinks
    "f" 'denote-grep))

(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3
        which-key-idle-secondary-delay 0.05))

(use-package use-package
  :config
  (setq use-package-always-ensure t))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package nerd-icons
  :if (display-graphic-p))

(use-package vertico
  :config
  (vertico-mode)
  (setq vertico-count 15
        vertico-cycle t))

(use-package orderless
  :config
  (setq completion-styles '(orderless basic)
        completion-category-overrides nil))

(use-package marginalia
  :config
  (marginalia-mode))

(use-package counsel
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x b") 'counsel-ibuffer)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "M-y") 'counsel-yank-pop))

(use-package consult
  :config
  (consult-customize 'find-file '((preview . t))))

(use-package corfu
  :config
  (global-corfu-mode)
  (setq corfu-auto t
        corfu-auto-prefix 1
        corfu-auto-delay 0.1
        corfu-cycle t
        corfu-preselect 'prompt)
  (define-key corfu-map (kbd "TAB") 'corfu-next)
  (define-key corfu-map (kbd "<backtab>") 'corfu-previous))

(use-package cape
  :config
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

(use-package org
  :ensure org-plus-contrib
  :config
  (setq org-startup-indented t
        org-hide-leading-stars t
        org-log-done 'time
        org-hide-emphasis-markers t
        org-link-descriptive t
        org-pretty-entities t)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture))

(use-package markdown-mode
  :mode ("\\.md\\'" "\\.markdown\\'")
  :config
  (setq markdown-command "pandoc")
  (setq markdown-enable-math t))

(use-package org-fragtog
  :hook (org-mode . org-fragtog-mode))

(use-package org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star '("●" "○" "•" "-")
        org-modern-table t
        org-modern-tag 'box))

(use-package org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autolinks t
        org-appear-autosubmarkers t
        org-appear-autoentities t
        org-appear-delay 0.2))

(use-package cdlatex
  :hook (org-mode . cdlatex-mode))

(use-package olivetti
  :hook ((org-mode markdown-mode) . olivetti-mode)
  :config
  (setq olivetti-body-width 80))

(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'markdown-mode-hook #'visual-line-mode)

(use-package denote
  :config
  (setq denote-directory "~/Documents/notes/"
        denote-file-type 'org
        denote-known-keywords nil
        denote-infer-keywords t
        denote-sort-keywords t
        denote-prompts '(title keywords)))

(use-package auctex
  :after denote
  :config
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-save-query nil
        TeX-show-compilation t))

(use-package texfrag
  :after auctex
  :hook (markdown-mode . texfrag-mode)
  :config
  (setq texfrag-preview-buffer-at-start nil))

(use-package doom-modeline
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
  :after dired
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package nerd-icons-dired
  :after dired
  :config
  (add-hook 'dired-mode-hook 'nerd-icons-dired-mode))

(use-package which-key-posframe
  :after which-key
  :if (display-graphic-p)
  :config
  (which-key-posframe-mode 1))

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(use-package embark
  :bind
  ("C-." . embark-act)
  ("C-;" . embark-dwim)
  :config
  (setq embark-prompter 'embark-completing-read-prompter))

(use-package embark-consult
  :after embark consult)

(use-package helpful
  :bind
  ("C-h f" . helpful-callable)
  ("C-h v" . helpful-variable)
  ("C-h k" . helpful-key)
  ("C-h x" . helpful-command))

(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-completing-read-function 'completing-read))

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
              version-control t
              scroll-margin 8
              truncate-lines t)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative
      display-line-numbers-current-absolute t)

(setq split-right t
      split-below t
      hlsearch t
      case-fold-search t)

(global-hl-line-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'switch-to-buffer)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
