(setq inhibit-startup-message t)
(setq visible-bell t)
(setq use-package-always-ensure nil)

(setq package-quickstart t)
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(load-theme 'tao-yin t)

(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 115)
(electric-indent-mode 1)
(setq-default electric-indent-chars '(?\{ ?\} ?\( ?\) ?: ?\; ?\#))
(add-hook 'prog-mode-hook (lambda ()
                            (setq-local electric-indent-mode t)
                            (add-hook 'post-self-insert-hook
                                      'electric-indent-post-self-insert-function
                                      nil t)))

(use-package evil

  :config
  (evil-mode 1)
  (setq evil-want-C-i-jump nil
        evil-want-C-u-scroll t
        evil-ex-substitute-global t
        evil-want-integration t)
  (defun my/indent-newline (&optional count)
    (interactive "p")
    (dotimes (_ count)
      (newline nil nil)
      (indent-according-to-mode)))
  (evil-define-key 'insert 'global (kbd "RET") 'my/indent-newline))

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
    "s" 'save-buffer))

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

(use-package apheleia

  :config
  (apheleia-global-mode +1))

(use-package company

  :config
  (global-company-mode)
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-limit 10
        company-show-numbers t))

(use-package company-box

  :after company
  :config
  (company-box-mode))

(use-package company-quickhelp

  :after company
  :config
  (company-quickhelp-mode 1)
  (setq company-quickhelp-delay 0.5))

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

(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-height 15))

(use-package consult
  :config
  (consult-customize 'find-file '((preview . t))))

(use-package consult-lsp
  :after lsp-mode)

(use-package corfu

  :after company
  :config
  (global-corfu-mode)
  (setq corfu-auto t
        corfu-auto-prefix 1
        corfu-cycle t))

(use-package lsp-mode

  :commands lsp
  :hook ((python-mode . lsp)
         (typescript-mode . lsp)
         (go-mode . lsp)
         (rust-mode . lsp)
         (lua-mode . lsp)
         (nix-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (objc-mode . lsp))
  :config
  (setq lsp-keymap-prefix "C-c l"
        lsp-enable-snippet nil
        lsp-enable-completion-at-point t
        lsp-idle-delay 0.5
        lsp-signature-auto-activate nil
        lsp-diagnostics-provider :flycheck
        lsp-enable-indentation t
        lsp-language-id-configuration '((c-mode . "c")
                                        (c++-mode . "cpp")
                                        (objc-mode . "objective-c")
                                        (nix-mode . "nix")))
  (setq lsp-clangd-args '("--query-driver=/run/current-system/sw/bin/gcc,/run/current-system/sw/bin/clang" "--clang-tidy" "--completion-style=detailed" "--header-insertion=iwyu"))
  (setq lsp-clangd-executable "/run/current-system/sw/bin/clangd")
  (add-hook 'lsp-mode-hook 'lsp-enable-which-key-integration))

(use-package lsp-ui

  :after lsp-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'bottom
        lsp-ui-sideline-enable t
        lsp-ui-peek-enable t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package flycheck

  :init (global-flycheck-mode))

(use-package flycheck-posframe

  :after flycheck
  :if (display-graphic-p)
  :config
  (flycheck-posframe-mode))

(use-package lsp-treemacs

  :after lsp-mode)

(use-package treemacs

  :after lsp-treemacs
  :config
  (setq treemacs-is-never-other-window t)
  (global-set-key (kbd "C-x t") 'treemacs))

(use-package projectile

  :config
  (projectile-mode)
  (setq projectile-completion-system 'vertico
        projectile-indexing-method 'alien))

(use-package magit

  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-completing-read-function 'completing-read))

(use-package git-gutter

  :config
  (global-git-gutter-mode)
  (setq git-gutter:update-interval 2
        git-gutter:modified-sign "~"
        git-gutter:added-sign "+"
        git-gutter:deleted-sign "-"))

(use-package nix-mode

  :mode "\\.nix\\'"
  :config
  (add-hook 'nix-mode-hook 'lsp)
  (add-hook 'nix-mode-hook 'flycheck-mode))

(use-package rustic

  :hook (rust-mode . rustic-mode)
  :config
  (rustic-lsp-enable))

(use-package dockerfile-mode

  :mode "Dockerfile\\'")

(use-package yaml-mode

  :mode "\\.ya?ml\\'")

(use-package json-mode

  :mode "\\.json\\'")

(use-package toml-mode

  :mode "\\.toml\\'")

(use-package sh-script
  :mode ("\\.sh\\'" . sh-mode))

(use-package web-mode

  :mode ("\\.html?\\'" "\\.jsx?\\'" "\\.tsx?\\'"))

(use-package css-mode
  :mode "\\.css\\'")

(use-package scss-mode

  :mode "\\.scss\\'")

(use-package typescript-mode

  :mode "\\.ts\\'")

(use-package js2-mode

  :mode "\\.js\\'")

(use-package lua-mode

  :mode "\\.lua\\'")

(use-package markdown-mode

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

(use-package all-the-icons-ivy

  :after ivy)

(use-package which-key-posframe

  :after which-key
  :if (display-graphic-p)
  :config
  (which-key-posframe-mode 1))

(use-package smartparens
  :config
  (smartparens-global-mode 1)
  (setq sp-autoindent nil))

(use-package rainbow-delimiters
  :hook ((prog-mode . rainbow-delimiters-mode)))

(use-package lsp-ivy
  :after lsp-mode ivy
  :bind (:map lsp-mode-map
              ("C-c l s" . lsp-ivy-workspace-symbol)))

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-auto-configure-mode)
  :bind (:map lsp-mode-map
              ("C-c l d" . dap-hydra)))

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

(use-package auto-compile
  :config
  (auto-compile-on-save-mode 1))

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("--" "---" "==" "===" "!=" "!==" "=:=" "=/=" "<=" ">=" "=>" "->" "-<" "-<<" "<-" "<--" "<->" "<-->" "<==>" "::" ":::" ">>" "<<" ">>=" "<<=" "|>" "<|" "||" "|||" "&&" "&&&" "%%" "%%%" "+=" "-=" "*=" "**" "***" "/=" "//" "///" "/*" "*/" "~=" "~~" "~@" ":=" "::=" "==" "==="))
  (global-ligature-mode 't))

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
 '(package-selected-packages
   '(aggressive-indent all-the-icons-dired all-the-icons-ivy all-the-icons-nerd-fonts apheleia auctex
                       auto-compile cape command-log-mode company-box company-quickhelp consult-lsp
                       corfu counsel dap-mode dockerfile-mode doom-modeline doom-themes
                       embark-consult evil-leader flycheck-posframe general git-gutter
                       greymatters-theme helm-lsp helpful js2-mode json-mode ligature lsp-ivy lsp-ui
                       lua-mode magit marginalia modus-themes nerd-icons-dired nerd-icons-ivy-rich
                       nibelung-theme nix-mode orderless org-plus-contrib projectile
                       rainbow-delimiters rustic scss-mode smartparens tao-theme toml-mode
                       treesit-auto typescript-mode undo-tree vertico web-mode which-key-posframe
                       yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-aggressive-indent-mode 1)
