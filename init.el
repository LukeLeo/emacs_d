
(setenv "HOME" "I:/emacs/")

(require 'cl)
;;; Also use Melpa for most packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
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
(require 'popwin)
(popwin-mode 1)

(setq default-directory "~/")
(add-to-list 'load-path "~/.emacs.d/luke/")

;; org mode 设置
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 代码折叠
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(global-set-key (kbd "<f6>") 'hs-toggle-hiding)

;; config for js files
(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   auto-mode-alist))
(require 'nodejs-repl)

;;去掉Emacs和gnus启动时的引导界面
;;(setq inhibit-startup-message t)
;;(setq gnus-inhibit-startup-message t)
(setq inhibit-splash-screen t)

;; show line numbers in all buffers
;; run M-x global-linum-mode
(global-linum-mode 1)
;; turn off scroll bar and toolbar
(scroll-bar-mode -1)
(tool-bar-mode -1)
;;禁用默认缩进
;;(electric-indent-mode -1)
;;开启最近打开文件模式
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;修改光标样式
(setq-default cursor-type 'bar)
;; 禁用备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)
;; 输入时删除选中部分的文字，而不是追加
(delete-selection-mode t)
;; 启动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;高亮显示成对括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;高亮光标所在行
(global-hl-line-mode t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
;;Set "filename@RuralMouse's Emacs" as title
(setq frame-title-format "%b@Luke's Emacs")

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)
;; 成对输入括号、引号等
(require 'smartparens-config)
(smartparens-global-mode t)

;;引入颜色主题
(load-theme 'monokai t)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; support for zoom with mouse wheel and Ctrl key
;; For Linux
;;(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
;;(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; 开启全局Company 补全
(global-company-mode t)

(require 'lukefont)
(init-lukefont)

;;显示时间
(display-time)
(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
(setq display-time-interval 10);;时间的变化频率，单位多少来着？

;; swiper configure
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;MarkDown支持
(autoload 'markdown-mode "markdown-mode.el"
"Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '(".markdown" . markdown-mode) auto-mode-alist))
;;文件保存时去掉行尾的空格
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; (require 'ggtags)
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;;               (ggtags-mode 1))))

;; (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;; (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;; (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;; (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
;; (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;; (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
;; (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; (setq
;;  helm-gtags-ignore-case t
;;  helm-gtags-auto-update t
;;  helm-gtags-use-input-at-cursor t
;;  helm-gtags-pulse-at-cursor t
;;  helm-gtags-prefix-key "\C-cg"
;;  helm-gtags-suggested-key-mapping t
;;  )

;; (require 'helm-gtags)
;; ;; Enable helm-gtags-mode
;; (add-hook 'dired-mode-hook 'helm-gtags-mode)
;; (add-hook 'eshell-mode-hook 'helm-gtags-mode)
;; (add-hook 'c-mode-hook 'helm-gtags-mode)
;; (add-hook 'c++-mode-hook 'helm-gtags-mode)
;; (add-hook 'asm-mode-hook 'helm-gtags-mode)

;; (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;; (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
;; (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;; (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;; (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;; (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(global-set-key (kbd "C-x C-b") 'ibuffer)
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(package-selected-packages
;;   (quote
;;    (elpy yasnippet python-mode helm-gtags ggtags auto-complete))))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;;)

;;;
;;; Org Mode
;;;
;; (setq load-path (cons "~/.emacs.d/org-mode/lisp" load-path))
;; (setq load-path (cons "~/.emacs.d/org-mode/contrib/lisp" load-path))

;; (require 'org-install)
;; (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; ;;
;; ;; Standard key bindings
;; (global-set-key (kbd "C-c l") 'org-store-link)
;; (global-set-key (kbd "C-c a") 'org-agenda)
;; (global-set-key (kbd "C-c c") 'org-capture)
;; (global-set-key (kbd "C-c b") 'org-iswitchb)

;; (setq org-capture-templates
;;       '(("t" "Todo" entry (file+headline "~/.emacs.d/org/task.org" "Tasks")
;;          "* TODO %?\n %i\n %a")
;;         ("j" "Journal" entry (file+datetree "~/.emacs.d/org/journal.org")
;;          "* %?\nEntered on %U\n %i\n %a")))

;; (require 'yasnippet)
;; (yas/initialize)

;; ;; (require 'elpy)
;; (elpy-enable)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(compilation-message-face (quote default))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
	(smartparens company monokai-theme hungry-delete swiper counsel js2-mode nodejs-repl)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(tab-width 4)
 '(vc-annotate-background nil)
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dim gray")))))
