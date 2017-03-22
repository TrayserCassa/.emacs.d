
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(use-package zenburn-theme
  :ensure t)
(load-theme 'zenburn t)

(fset 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)
(set-default 'truncate-lines t)

(add-hook 'find-file-hook (lambda () (linum-mode 1)))
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

(setq jedi:setup-keys t)
(setq jedi:use-shortcuts t)

(use-package jedi
:ensure t)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(use-package flycheck
:ensure t)

(global-flycheck-mode)

(use-package py-autopep8
:ensure t)

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(use-package json-mode
:ensure t)

(use-package yaml-mode
:ensure t)
 
(use-package sqlite
:ensure t)
