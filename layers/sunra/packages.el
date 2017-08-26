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


(defun elephant-cider-connect ()
  (interactive)
  (cider-connect "localhost" 5554 "/Users/timothyw/Projects/wadeandwendy/elephant"))

(global-set-key (kbd "C-c C-a C-c") 'elephant-cider-connect)

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
(global-set-key (kbd "C-c m l") 'mc/mark-next-lines)


;; (setq-default dotspacemacs-themes '(firebelly))  ;; additionally use with spacemacs

;; (use-package firebelly-theme
;;   :config (progn
;;         (let
;;         ;; This beautiful palette is shamelessly stolen from chris
;;         ;; kempson's base16: https://github.com/chriskempson/base16
;;         ;; I keep a local copy of the firebelly colour layout so I
;;         ;; can tweak it to my taste
;;         ((palette
;;           '("#ac4142" "#d28445" "#f4bf75" "#90a959"
;;             "#75b5aa" "#6a9fb5" "#aa759f" "#8f5536"))
;;          ;; Simple grayscale palette.
;;          (greys
;;           '("#222222" "#292929" "#444444" "#555555"
;;             "#666666" "#777777" "#888888" "#999999")))
;;           ;; Tiny functions to make getting from the palettes easier.
;;           (cl-flet
;;           ((color (n) (nth n palette))
;;            (grey (n) (nth n greys)))
;;         ;; Define some faces for our theme.
;;         (custom-theme-set-faces
;;          'firebelly
;;                  ;;;; Styling emacs.
;;          `(default
;;             ((t (:background ,(grey 0) :foreground ,(grey 7)))))
;;          `(cursor
;;            ((t (:background ,(grey 3)))))
;;          `(highlight
;;            ((t (:background ,(color 5) :foreground ,(grey 3)))))
;;          `(shadow
;;            ((t (:foreground ,(grey 6)))))
;;          `(isearch
;;            ((t (:background ,(grey 2) :foreground ,(color 6)))))
;;          `(query-replace
;;            ((t (:background ,(grey 2) :foreground ,(color 6)))))
;;          `(lazy-highlight
;;            ((t (:background ,(grey 1) :foreground ,(grey 3)))))
;;          `(minibuffer-prompt
;;            ((t (:foreground ,(color 1)))))
;;          `(trailing-whitespace
;;            ((t (:background ,(grey 1)))))
;;          `(nobreak-space
;;            ((t (:background ,(grey 1)))))
;;          `(escape-glyph
;;            ((t (:foreground ,(color 2)))))
;;          ;; Fringes are ugly.
;;          `(fringe
;;            ((t (:background ,(grey 0)))))
;;          ;; Highlight the border.
;;          `(vertical-border
;;            ((t (:foreground ,(grey 1)))))
;;          ;; Mode lines look the same but for the text.
;;          `(mode-line
;;            ((t (:background ,(grey 1) :foreground ,(grey 6) :box nil))))
;;          `(mode-line-inactive
;;            ((t (:background ,(grey 1) :foreground ,(grey 3) :box nil))))
;;          `(header-line
;;            ((t (:background ,(grey 1) :foreground ,(grey 3) :box nil))))
;;          `(mode-line-buffer-id
;;            ((t (:bold t))))
;;          `(mode-line-highlight
;;            ((t (:foreground ,(grey 7)))))
;;          ;; Regions are slightly lighter.
;;          `(region
;;            ((t (:background ,(grey 2)))))
;;          `(secondary-selection
;;            ((t (:background ,(grey 2)))))
;;     ;;;; Styling code.
;;          ;; Comments are lighter than their delimiters.
;;          `(font-lock-comment-face
;;            ((t (:foreground ,(grey 4)))))
;;          `(font-lock-comment-delimiter-face
;;            ((t (:foreground ,(grey 2)))))
;;          ;; Docstrings are slightly lighter.
;;          `(font-lock-doc-face
;;            ((t (:foreground ,(grey 4) :background ,(grey 0)))))
;;          `(font-lock-function-name-face
;;            ((t (:foreground ,(color 3)))))
;;          `(font-lock-variable-name-face
;;            ((t (:foreground ,(grey 2)))))
;;          `(font-lock-builtin-face
;;            ((t (:foreground ,(color 6)))))
;;          `(font-lock-constant-face
;;            ((t (:foreground ,(color 1)))))
;;          `(font-lock-type-face
;;            ((t (:foreground ,(color 4)))))
;;          `(font-lock-string-face
;;            ((t (:foreground ,(color 5) :background ,(grey 1)))))
;;          `(font-lock-keyword-face
;;            ((t (:foreground ,(color 6)))))
;;     ;;;; Styling extensions.
;;          ;; Erc faces.
;;          `(erc-notice-face
;;            ((t (:foreground ,(grey 2)))))
;;          `(erc-current-nick-face
;;            ((t (:foreground ,(color 3) :bold t))))
;;          `(erc-prompt-face
;;            ((t (:foreground ,(color 1) :background ,(grey 0)))))
;;          `(erc-input-face
;;            ((t (:foreground ,(grey 6)))))
;;          `(erc-my-nick-face
;;            ((t (:foreground ,(color 1)))))
;;          `(erc-error-face
;;            ((t (:foreground ,(color 0)))))
;;          `(erc-timestamp-face
;;            ((t (:foreground ,(color 3)))))
;;          ;; Rainbow delimiters are mostly in order.
;;          `(rainbow-delimiters-depth-1-face
;;            ((t (:foreground ,(color 7)))))
;;          `(rainbow-delimiters-depth-2-face
;;            ((t (:foreground ,(color 6)))))
;;          `(rainbow-delimiters-depth-3-face
;;            ((t (:foreground ,(color 5)))))
;;          `(rainbow-delimiters-depth-4-face
;;            ((t (:foreground ,(grey 3)))))
;;          `(rainbow-delimiters-depth-5-face
;;            ((t (:foreground ,(color 4)))))
;;          `(rainbow-delimiters-depth-6-face
;;            ((t (:foreground ,(color 3)))))
;;          `(rainbow-delimiters-depth-7-face
;;            ((t (:foreground ,(color 2)))))
;;          `(rainbow-delimiters-depth-8-face
;;            ((t (:foreground ,(color 1)))))
;;          `(rainbow-delimiters-depth-9-face
;;            ((t (:foreground ,(color 0)))))
;;          ;; shm faces
;;          `(shm-current-face
;;            ((t (:background ,(grey 1)))))
;;          `(shm-quarantine-face
;;            ((t (:foreground ,(color 0) :background ,(grey 1)))))
;;          ;; linum-relative faces
;;          `(linum-relative-current-face
;;            ((t (:background ,(grey 0) :foreground ,(color 1))))))))))
