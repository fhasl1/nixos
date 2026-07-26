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

(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 125)
(set-face-attribute 'minibuffer-prompt nil :font "Iosevka Nerd Font" :height 125)
(with-eval-after-load 'ivy
  (set-face-attribute 'ivy-subdir nil :font "Iosevka Nerd Font" :height 125)
  (set-face-attribute 'ivy-current-match nil :font "Iosevka Nerd Font" :height 125))
(add-hook 'minibuffer-setup-hook
          (lambda () (set-face-attribute 'default (selected-frame) :font "Iosevka Nerd Font" :height 125)))
(set-fontset-font t nil (font-spec :family "Symbols Nerd Font Mono") nil 'append)

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
    "b" 'switch-to-buffer
    "/" 'counsel-rg
    "s" 'save-buffer
    "r" 'load-file))

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

(use-package markdown-mode
  :mode ("\\.md\\'" "\\.markdown\\'")
  :config
  (setq markdown-command "pandoc"
        markdown-hide-markup t
        markdown-fontify-code-blocks-natively t
        markdown-header-scaling t
        markdown-header-scaling-values '(1.8 1.5 1.3 1.1 1.0 1.0))
  (add-hook 'markdown-mode-hook 'visual-line-mode)
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  (add-hook 'markdown-mode-hook 'olivetti-mode))

(use-package mixed-pitch
  :hook (markdown-mode . mixed-pitch-mode))

(use-package olivetti
  :config
  (setq olivetti-body-width 80))

(setq ispell-program-name "hunspell"
      ispell-dictionary "en_US")

(use-package auctex
  :mode ("\\.tex\\'" . LaTeX-mode)
  :config
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-engine 'xetex
        preview-auto-cache-preamble nil
        preview-transparent-color '(highlight :background)
        preview-background-color "white"
        preview-foreground-color "white")
  (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode))

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
  :config
  (doom-modeline-mode 1)
  (setq doom-modeline-height 25
        doom-modeline-bar-width 2
        doom-modeline-icon t
        doom-modeline-buffer-file-name-style 'truncate-with-project
        doom-modeline-major-mode-color-icon t
        doom-modeline-minor-modes t))

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

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(setq-default fill-column 80
              x-select-enable-clipboard t
              x-select-enable-primary t
              save-place t
              require-final-newline t
              delete-old-versions -1
              kept-new-versions 6
              kept-old-versions 2
              version-control t
              scroll-margin 8)

(setq split-right t
      split-below t
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
