
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(use-package base16-theme
  :ensure t)
(load-theme 'base16-default-dark t)

(fset 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)
(set-default 'truncate-lines t)
(setq column-number-mode t)
(windmove-default-keybindings 'meta)

(custom-set-variables
'(initial-frame-alist (quote ((fullscreen . maximized)))))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-set-key (kbd "<f1>") 'describe-mode) 
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "<f4>") 'helm-buffers-list)
(global-set-key (kbd "<M-f1>") 'helm-dash)
(global-set-key (kbd "C-<f6>") 'compile)
(global-set-key (kbd "<f6>") 'recompile)
(global-set-key (kbd "<f2>") 'helm-projectile)

(use-package auto-complete
  :ensure t)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(use-package magit
 :ensure t)

(use-package helm
  :ensure t)

(use-package json-mode
:ensure t)

(use-package yaml-mode
:ensure t)
 
(use-package sqlite
:ensure t)
