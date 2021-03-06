(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; support for zoom with mouse wheel and Ctrl key
(if (eq system-type 'windows-nt)
    (progn (global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
	   (global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)))
(if (eq system-type 'gnu/linux)
    (progn (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
	   (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)))

(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "C-c a") 'org-agenda)

;; 代码折叠
(global-set-key (kbd "<f6>") 'hs-toggle-hiding)

(global-set-key (kbd "C-x C-b") 'ibuffer)
;; 代码格式化
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key (kbd "M-/") 'hippie-expand)

;; dired模式下禁止打开多个buffer
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(global-set-key (kbd "M-s e") 'iedit-mode)

(global-set-key (kbd "C-=") 'er/expand-region)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;;(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "C-x r C-s") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)


(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)

(with-eval-after-load 'counsel-gtags
  (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
  (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-pop-stack))

(provide 'init-keybindings)
