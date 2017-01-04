(setenv "HOME" "I:/emacs/")

;;; Also use Melpa for most packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
;;  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;						   ("melpa" . "https://melpa.org/packages/")
  ;;						   ("elpy" . "https://jorgenschaefer.github.io/packages/")))
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "https://elpa.emacs-china.org/melpa/")))
  )

(require 'cl)
(defvar luke/packages '(
		       company
		       monokai-theme
			   hungry-delete
			   swiper
			   counsel
			   smartparents
			   js2-mode
			   nodejs-repl
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
      (package-initialize pkg))))

(require 'hungry-delete)
(global-hungry-delete-mode)

(setq default-directory "~/")
(add-to-list 'load-path "~/site-lisp")

;; org mode ����
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; �����۵�
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(global-set-key (kbd "<f3>") 'hs-toggle-hiding)

;; config for js files
(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   auto-mode-alist))
(require 'nodejs-repl)

;;ȥ��Emacs��gnus����ʱ����������
;(setq inhibit-startup-message t)
;(setq gnus-inhibit-startup-message t)
(setq inhibit-splash-screen t)

;; show line numbers in all buffers
;; run M-x global-linum-mode
(global-linum-mode 1)
;; turn off scroll bar and toolbar
(scroll-bar-mode -1)
(tool-bar-mode -1)
;;����Ĭ������
;;(electric-indent-mode -1)
;;����������ļ�ģʽ
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;�޸Ĺ����ʽ
(setq-default cursor-type 'bar)
;; ���ñ����ļ�
(setq make-backup-files nil)
;; ����ʱɾ��ѡ�в��ֵ����֣�������׷��
(delete-selection-mode t)
;; ����ȫ��
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;������ʾ�ɶ�����
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;�������������
(global-hl-line-mode t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
;;Set "filename@RuralMouse's Emacs" as title
(setq frame-title-format "%b@Luke's Emacs")

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)
;; �ɶ��������š����ŵ�
(require 'smartparens-config)
(smartparens-global-mode t)

;;������ɫ����
(load-theme 'monokai t)
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-subtle-hacker)
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

;; ����ȫ��Company ��ȫ
(global-company-mode t)

(require 'lukefont)
(init-lukefont)

;;��ʾʱ��
(display-time)
(display-time-mode 1);;����ʱ����ʾ���ã���minibuffer������Ǹ�����
(setq display-time-24hr-format t);;ʱ��ʹ��24Сʱ��
(setq display-time-day-and-date t);;ʱ����ʾ�������ں;���ʱ��
(setq display-time-use-mail-icon t);;ʱ�����Ա������ʼ�����
(setq display-time-interval 10);;ʱ��ı仯Ƶ�ʣ���λ�������ţ�

;; swiper configure
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;MarkDown֧��
(autoload 'markdown-mode "markdown-mode.el"
"Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '(".markdown" . markdown-mode) auto-mode-alist))
;;�ļ�����ʱȥ����β�Ŀո�
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;(require 'auto-complete-config)
;;(ac-config-default)

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
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
	("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
	(nodejs-repl js2-mode smartparens counsel swiper hungry-delete monokai-theme python-mode markdown-mode helm-gtags ggtags elpy auto-complete)))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dim gray")))))
