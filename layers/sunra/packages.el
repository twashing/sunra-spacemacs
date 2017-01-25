(setq sunra-packages '(free-keys))

(defun sunra/init-free-keys ()
  (use-package free-keys
               :defer t))


(defun copy-sexp-at-point ()
  (interactive)
  (kill-new (thing-at-point 'sexp)))

(defun delete-whitespace-except-one ()
  (interactive)
  (just-one-space -1))

;; (use-package dash)
;; (use-package dash-functional)
;; (use-package s)

(global-set-key (kbd "C-x M-x") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "C-x C-g") 'grep-find)
(global-set-key (kbd "C-x C-m") 'magit-status)
(global-set-key (kbd "C-x M-o") 'crux-smart-open-line-above)
(global-set-key (kbd "C-x C-o") 'crux-smart-open-line)
(global-set-key (kbd "C-'") 'crux-kill-whole-line)


;; Navigation
(fset 'buf-move-up "\C-u10\C-p")
(fset 'buf-move-down "\C-u10\C-n")

(global-set-key (kbd "M-U") 'buf-move-up)
(global-set-key (kbd "M-D") 'buf-move-down)
(global-set-key (kbd "C-d") 'sp-kill-sexp)
(global-set-key (kbd "C-M-k") 'copy-sexp-at-point)
(global-set-key (kbd "M-[") 'ace-select-window)
(global-set-key (kbd "C-c M-[") 'ace-swap-window)
(global-set-key (kbd "C-x M-[") 'ace-delete-window)
(global-set-key (kbd "M-y") 'browse-kill-ring)
(global-set-key (kbd "C-M-SPC") 'delete-whitespace-except-one)
(global-set-key (kbd "C-M-[") 'scroll-other-window-down)
(global-set-key (kbd "C-M-]") 'scroll-other-window)
(global-set-key (kbd "C-M-s") 'sp-splice-sexp)

(global-set-key (kbd "C-`") 'crux-kill-other-buffers)
(global-set-key (kbd "C-<") 'crux-rename-buffer-and-file)
(global-set-key (kbd "C->") 'crux-delete-buffer-and-file)

(global-set-key (kbd "C-?") 'mc/mark-next-lines)
(global-set-key (kbd "C-M-?") 'mc/mark-all-in-region)

;; Smart Parens Navigation
(global-set-key (kbd "C-M-u") 'sp-up-sexp)
(global-set-key (kbd "M-u") 'sp-backward-up-sexp)
(global-set-key (kbd "C-M-d") 'sp-down-sexp)
(global-set-key (kbd "M-d") 'sp-backward-down-sexp)
(global-set-key (kbd "C-M-n") 'sp-next-sexp)
(global-set-key (kbd "C-M-j") 'sp-forward-slurp-sexp)
(global-set-key (kbd "C-x C-M-j") 'sp-forward-barf-sexp)
(global-set-key (kbd "C-M-y") 'sp-backward-slurp-sexp)
(global-set-key (kbd "C-x C-M-y") 'sp-backward-barf-sexp)

