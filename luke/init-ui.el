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

;; ;;显示时间
;; (display-time)
;; (display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
;; (setq display-time-24hr-format t);;时间使用24小时制
;; (setq display-time-day-and-date t);;时间显示包括日期和具体时间
;; (setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
;; (setq display-time-interval 10);;时间的变化频率，单位多少来着？

(require 'lukefont)
(init-lukefont)

(setq show-paren-style 'parentheses)
;;Set "filename@RuralMouse's Emacs" as title
(setq frame-title-format "%b@Luke's Emacs")

(provide 'init-ui)
