
(require 'org)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/.emacs.d/org"))

(setq org-capture-templates
	  '(("t" "TodoA" entry (file+headline "~/.emacs.d/org/gtd.org" "工作安排")
		 "* TODO [#B] %?\n %i\n"
		 :empty-lines 1)))

(setq org-log-done t)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; 定义TODO关键词
(setq org-todo-keywords
  '((type "工作(w!)" "学习(s!)" "休闲(l!)" "|")
    (sequence "PENDING(p!)" "TODO(t!)"  "|" "DONE(d!)" "ABORT(a@/!)")
	))

;; 改变TODO关键词外观
(setq org-todo-keyword-faces
  '(("工作" .      (:background "red" :foreground "white" :weight bold))
    ("学习" .      (:background "white" :foreground "red" :weight bold))
    ("休闲" .      (:foreground "MediumBlue" :weight bold))
    ("PENDING" .   (:background "LightGreen" :foreground "gray" :weight bold))
    ("TODO" .      (:background "DarkOrange" :foreground "black" :weight bold))
    ("DONE" .      (:background "azure" :foreground "Darkgreen" :weight bold))
    ("ABORT" .     (:background "gray" :foreground "black"))
))

;; 优先级范围和默认任务的优先级
(setq org-highest-priority ?A)
(setq org-lowest-priority  ?E)
(setq org-default-priority ?E)
;; 优先级醒目外观
(setq org-priority-faces
  '((?A . (:background "red" :foreground "white" :weight bold))
    (?B . (:background "DarkOrange" :foreground "white" :weight bold))
    (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
    (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
    (?E . (:background "SkyBlue" :foreground "black" :weight bold))
	))

(provide 'init-org)
