
(require 'cl)
;;; Also use Melpa for most packages
(when (>= emacs-major-version 24)
  ;;(require 'package)
  ;;(package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
						   ("popkit" . "https://elpa.popkit.org/packages/")))
						   ;; ("melpa" . "http://elpa.emacs-china.org/melpa/")))
						   ;;("melpa" . "https://melpa.org/packages/")))
  )

(defvar luke/packages '(
		       company
		       monokai-theme
		       hungry-delete
		       swiper
		       counsel
		       ;;smartparents
		       js2-mode
		       nodejs-repl
		       popwin
			   expand-region
			   iedit
			   org-pomodoro
			   helm-ag
			   flycheck
			   yasnippet
			   auto-yasnippet
			   undo-tree
			   goto-chg
			   evil
			   which-key
			   mwe-log-commands
			   window-numbering
		       ) "Default packages")

(setq package-selected-packages luke/packages)

(defun luke/packages-installed-p()
  (loop for pkg in luke/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally(return t)))

(unless (luke/packages-installed-p)
  (message "%s" "Refreshing package database...")
   (package-refresh-contents)
   (dolist (pkg luke/packages)
     (when (not (package-installed-p pkg))
       (package-install pkg))))

(require 'hungry-delete)
(global-hungry-delete-mode)

;; 成对输入括号、引号等
;;(require 'smartparens-config)
(smartparens-global-mode t)
;; 但在lisp mode下面单引号不进行补全
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

;; swiper configure
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; config for js files
(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   auto-mode-alist))

;; 开启全局Company 补全
(global-company-mode t)
;;引入颜色主题
(load-theme 'monokai t)

(require 'popwin)
(popwin-mode 1)

(require 'org-pomodoro)

;;(global-flycheck-mode t)
(add-hook 'c-mode-hook 'flycheck-mode)

(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;;(evil-mode 1)

(window-numbering-mode t)
(which-key-mode 1)

(require 'rect-mark)
(autoload 'rm-set-mark "rect-mark"
      "Set mark for rectangle." t)
    (autoload 'rm-exchange-point-and-mark "rect-mark"
      "Exchange point and mark for rectangle." t)
    (autoload 'rm-kill-region "rect-mark"
      "Kill a rectangular region and save it in the kill ring." t)
    (autoload 'rm-kill-ring-save "rect-mark"
      "Copy a rectangular region to the kill ring." t)
(provide 'init-packages)
