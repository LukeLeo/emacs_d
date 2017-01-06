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


(provide 'init-better-defaults)
