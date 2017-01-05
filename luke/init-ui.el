;; turn off scroll bar and toolbar
(scroll-bar-mode -1)
(tool-bar-mode -1)

;;去掉Emacs和gnus启动时的引导界面
;;(setq inhibit-startup-message t)
;;(setq gnus-inhibit-startup-message t)
(setq inhibit-splash-screen t)

;;修改光标样式
(setq-default cursor-type 'bar)

;; 启动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;高亮光标所在行
(global-hl-line-mode t)

(provide 'init-ui)
