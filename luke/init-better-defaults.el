;; 滚动到顶部或底部时不发出提示音
(setq ring-bell-function 'ignore)

;; 文件在外部被修改后重新加载
(global-auto-revert-mode t)

;; show line numbers in all buffers
;; run M-x global-linum-mode
(global-linum-mode 1)

;; 缩写补全模式与缩写列表
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
											("8zl" "LukeLeo")
											("1ml" "longlonglonglonglonglonglong")
											))

;; 禁用备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

;;禁用默认缩进
;;(electric-indent-mode -1)
;;开启最近打开文件模式
(recentf-mode t)
(setq recentf-max-menu-items 25)

;;高亮显示成对括号
(define-advice show-parent-function (:around (fn) fix-show-parent-function)
  "Hilight enclosing parents."
  (cond ((looking-at-p "\\s(") (funcall fn))
		(t (save-excursion
			 (ignore-errors (backward-up-list))
			 (funcall fn)))))

(show-paren-mode t)

;; 输入时删除选中部分的文字，而不是追加
(delete-selection-mode t)

;; 代码折叠
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;;MarkDown支持
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '(".markdown" . markdown-mode) auto-mode-alist))
;;文件保存时去掉行尾的空格
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun indent-buffer()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
	(if (region-active-p)
		(progn
		  (indent-region (region-beginning) (region-end))
		  (message "Indent selected region."))
	  (progn
		(indent-buffer)
		(message "Indent buffer.")))))

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
										 try-expand-dabbrev-all-buffers
										 try-expand-dabbrev-from-kill
										 try-complete-file-name-partially
										 try-complete-file-name
										 try-expand-all-abbrevs
										 try-expand-list
										 try-expand-line
										 try-complete-lisp-symbol-partially
										 try-complete-lisp-symbol))

;; 转换yes no 为 y n
(fset 'yes-or-no-p 'y-or-n-p)

;; 递归删除和拷贝
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; dired模式下禁止打开多个buffer
(put 'dired-find-alternate-file 'disabled nil)

;; 允许通过C-x C-j打开当前文件的dired模式
(require 'dired-x)
;; 两个dired模式同时显示时进行文件拷贝
(setq dired-dwim-target t)

;;(set-language-environment "UTF-8")

(setq c-default-style "linux"
          c-basic-offset 4)

(require 'cal-china-x)
(setq mark-holidays-in-calendar t)

(setq my-holidays
    '(;;公历节日
      (holiday-float 6 0 3 "父亲节")
      ;; 农历节日
      (holiday-lunar 1 1 "春节" 0)
      (holiday-lunar 1 15 "元宵节" 0)
      (holiday-solar-term "清明" "清明节")
      (holiday-lunar 5 5 "端午节" 0)
      (holiday-lunar 7 7 "七夕情人节" 0)
      (holiday-lunar 8 15 "中秋节" 0)
      ;;纪念日
      (holiday-fixed 8 10 "儿子生日")
      (holiday-fixed 7 23 "老婆生日")
      (holiday-lunar 5 28 "老爸生日" 0)
      (holiday-lunar 11 11 "我的生日" 0)
))
(setq calendar-holidays my-holidays)  ;只显示我定制的节假日

;; org模式长文本自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(auto-image-file-mode t);打开图片显示功能

(setq counsel-gtags-suggested-key-mapping t)

;;(setenv "PATH" (concat "C:/glo653wb/bin;" (getenv "PATH")))
;;(setq exec-path (append exec-path '("C:/glo653wb/bin")))

(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))


(provide 'init-better-defaults)
