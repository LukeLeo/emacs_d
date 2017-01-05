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

(provide 'init-better-defaults)
