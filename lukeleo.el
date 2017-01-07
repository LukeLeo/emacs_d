
(package-initialize)

(setq default-directory "~/")
(add-to-list 'load-path "~/.emacs.d/luke/")

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)

(setq custom-file (expand-file-name "luke/custom.el" user-emacs-directory))

(load-file custom-file)
(require 'nodejs-repl)
