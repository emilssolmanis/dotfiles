(setq inhibit-splash-screen t)
(put 'dired-find-alternate-file 'disabled nil)
(global-set-key (kbd "C-x C-u") 'eshell)
(global-set-key (kbd "C->") 'increase-left-margin)
(global-set-key (kbd "C-<") 'decrease-left-margin)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(show-paren-mode 1)
(subword-mode 1)
(load-theme 'wombat)

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
    (normal-top-level-add-subdirs-to-load-path))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")

(require 'wide-column)
(require 'column-marker)

(add-hook 'c-mode-common-hook '(lambda () (interactive) (column-marker-3 120)))
(add-hook 'c-mode-common-hook '(lambda () (interactive) (subword-mode t)))
(add-hook 'python-mode-hook '(lambda () (interactive) (column-marker-3 120)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-visual-commands (quote ("vi" "screen" "top" "less" "more" "lynx" "ncftp" "pine" "tin" "trn" "elm" "htop" "tig"))))

(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
