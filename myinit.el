
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

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(add-hook 'prog-mode-hook #'hs-minor-mode)

(global-set-key (kbd "<f1>") 'describe-mode) 
(global-set-key (kbd "<f6>") 'revert-buffer)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "<f4>") 'helm-buffers-list)
(global-set-key (kbd "<M-f1>") 'helm-dash)
(global-set-key (kbd "C-<f5>") 'compile)
(global-set-key (kbd "<f5>") 'quickrun)
(global-set-key (kbd "<f2>") 'helm-projectile)
(global-set-key (kbd "C-c C-o") 'hs-toggle-hiding)

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

(use-package groovy-mode
:ensure t)

(add-to-list 'auto-mode-alist
          '("Jenkinsfile" . groovy-mode))

(use-package go-mode
  :ensure t)

(use-package go-autocomplete
  :ensure t)

(defun my-go-mode-hook ()
  (interactive)
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v -gcflags '-N -l' && go test -v && go vet"))
  
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (require 'go-autocomplete)

  (setq-local helm-dash-docsets '("Go"))
  (message "Go Hook loaded"))
 
(add-hook 'go-mode-hook 'my-go-mode-hook)

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

(use-package tide
  :ensure t)

(use-package typescript-mode
  :ensure t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))
 
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(use-package json-mode
:ensure t)

(use-package yaml-mode
:ensure t)
 
(use-package sqlite
:ensure t)

(use-package quickrun
:ensure t)
