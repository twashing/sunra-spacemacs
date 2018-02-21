(setq sunra-packages '(free-keys))

(defun sunra/init-free-keys ()
  (use-package free-keys
               :defer t))

;; Color config
(setq ns-use-srgb-colorspace nil)


(defun copy-sexp-at-point ()
  (interactive)
  (kill-new (thing-at-point 'sexp)))

(defun delete-whitespace-except-one ()
  (interactive)
  (just-one-space -1))

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

(global-set-key (kbd "C-M-j") 'sp-forward-slurp-sexp)
(global-set-key (kbd "C-x C-M-j") 'sp-forward-barf-sexp)

(global-set-key (kbd "C-M-y") 'sp-backward-slurp-sexp)
(global-set-key (kbd "C-x C-M-y") 'sp-backward-barf-sexp)

(global-set-key (kbd "C-M-n") 'sp-next-sexp)
(global-set-key (kbd "M-r") 'sp-raise-sexp)


;; Searching
;; (define-key spacemacs-default-map-root-map (kbd "M-m s a /") 'helm-ag-project-root)

;; Hide / Show
(global-set-key (kbd "C-o") 'hs-toggle-hiding)


(setq clojure-enable-fancify-symbols t)

;; enable the meta - ALWAYS!!
(setq mac-option-modifier 'meta)


(add-to-list 'auto-mode-alist '("\\.tf\\'" . hcl-mode))
(add-to-list 'auto-mode-alist '("\\.tfvars\\'" . hcl-mode))


(global-set-key (kbd "C-c g c") 'avy-goto-char-2)
(global-set-key (kbd "C-c g C") 'avy-goto-char)
(global-set-key (kbd "C-c g l") 'avy-goto-line)
(global-set-key (kbd "C-c g L") 'avy-goto-char-in-line)

;; jump to beginning of some word
(global-set-key (kbd "C-c g w") 'avy-goto-word-1)
(global-set-key (kbd "C-c g W") 'avy-goto-word-0)

;; jump to subword starting with a char
(global-set-key (kbd "C-c g s") 'avy-goto-subword-1)

;; jump to some subword
(global-set-key (kbd "C-c g S") 'avy-goto-subword-0)


;; Transpose
;; (global-set-key (kbd "M-m x t s") 'transpose-sexps)


;; Copy line
(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
    kill-line, so see documentation of kill-line for how to use it including prefix
    argument and relevant variables.  This function works by temporarily making the
    buffer read-only."
  (interactive "P")
  (let ((buffer-read-only t)
        (kill-read-only-ok t))
    (kill-line arg)))

(global-set-key (kbd "C-c k") 'copy-line)


;; Multiple cursors
;; (global-set-key (kbd "C-c m l") 'mc/mark-next-lines)

(global-set-key (kbd "C-c m n l") 'mc/mark-next-lines)
(global-set-key (kbd "C-c m p l") 'mc/mark-previous-lines)
;; (global-set-key (kbd "C-x C-c m n l") 'mc/unmark-next-like-this)
;; (global-set-key (kbd "C-x C-c m p l") 'mc/unmark-previous-like-this)
(global-set-key (kbd "C-c m a t") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m a w") 'mc/mark-all-words-like-this)
(global-set-key (kbd "C-c m a s") 'mc/mark-all-symbols-like-this)
(global-set-key (kbd "C-c m a r") 'mc/mark-all-in-region)
(global-set-key (kbd "C-c m a x") 'mc/mark-all-in-region-regexp)
(global-set-key (kbd "C-c m a d") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "C-c m a D") 'mc/mark-all-dwim)


;; Ace window customizations
(custom-set-faces
 '(aw-leading-char-face
   ((t (:inherit ace-jump-face-foreground :height 3.0)))))

(setq aw-background nil)


;; Ansi-term - stolen from here: http://oremacs.com/2015/01/01/three-ansi-term-tips/
(defun terminal ()
  "Switch to terminal. Launch if nonexistent."
  (interactive)
  (if (get-buffer "*ansi-term*")
      (switch-to-buffer "*ansi-term*")
    (ansi-term "/bin/bash"))
  (get-buffer-process "*ansi-term*"))

(global-set-key (kbd "C-t") 'terminal)

;; use bash
(setq explicit-shell-file-name "/bin/bash")

;; kill buffer after exit
(defun oleh-term-exec-hook ()
  (let* ((buff (current-buffer))
         (proc (get-buffer-process buff)))
    (set-process-sentinel
     proc
     `(lambda (process event)
        (if (string= event "finished\n")
            (kill-buffer ,buff))))))

(add-hook 'term-exec-hook 'oleh-term-exec-hook)

;; Nicer paste
(eval-after-load "term"
  '(define-key term-raw-map (kbd "C-c C-y") 'term-paste))

(custom-set-faces
 '(aw-leading-char-face
   ((t (:foreground "Rosybrown4" :weight normal :inverse-video nil :height 5.0)))))

;; DarkOrange3 - as a backup color



;; 'sp-raise-sexp
;; backward-kill-word
;; sp-backward-kill-word
