(require 'cl)
;;; Also use Melpa for most packages
(when (>= emacs-major-version 24)
  ;;(require 'package)
  ;;(package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
						   ("popkit" . "https://elpa.popkit.org/packages/")
						   ;; ("melpa" . "http://elpa.emacs-china.org/melpa/")))
						   ("melpa" . "https://melpa.org/packages/")))
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

(provide 'init-packages)
