(defconst sunra-packages
  '(free-keys
    visual-regexp
    visual-regexp-steroids
    back-button
    smartrep
    visible-mark
    smartrep
    back-button
    sayid
    command-log-mode
    crux
    fancy-narrow))

(defun sunra/init-free-keys ()
  (use-package free-keys
               :defer t))

(defun sunra/init-visual-regexp ()
  (use-package visual-regexp
               :defer t))

(defun sunra/init-visual-regexp-steroids ()
  (use-package visual-regexp-steroids
               :defer t))

(defun sunra/init-back-button ()
  (use-package back-button
               :defer t))

(defun sunra/init-smartrep ()
  (use-package smartrep
               :defer t))

(defun sunra/init-visible-mark ()
  (use-package visible-mark
               :defer t))

(defun sunra/init-sayid ()
  (use-package sayid
    :defer t))

(defun sunra/init-command-log-mode ()
  (use-package command-log-mode
    :defer t))

(defun sunra/init-crux-mode ()
  (use-package crux
    :ensure t
    :bind (("C-x M-o" . crux-smart-open-line-above)
           ("C-x C-o" . crux-smart-open-line)
           ("C-'" . crux-kill-whole-line))))

(defun sunra/init-fancy-narrow ()
  (use-package fancy-narrow
    :ensure t))


;; -> For `bind-key` function
;; https://github.com/jwiegley/use-package/blob/master/bind-key.el


;; Color config
(setq ns-use-srgb-colorspace nil)
;; (setq transient-mark-mode t)

(defun copy-sexp-at-point ()
  (interactive)
  (kill-new (thing-at-point 'sexp)))

(defun delete-whitespace-except-one ()
  (interactive)
  (just-one-space -1))


;; enable the meta - ALWAYS!!
(setq mac-command-modifier 'meta)
;; (setq mac-option-modifier 'super)
(setq mac-option-modifier 'meta)


(add-to-list 'auto-mode-alist '("\\.tf\\'" . hcl-mode))
(add-to-list 'auto-mode-alist '("\\.tfvars\\'" . hcl-mode))


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

(setq cider-test-show-report-on-success nil)
