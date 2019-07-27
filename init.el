;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configu+(let ((path (shell-command-to-string ". ~/.bash_profile; echo -n $PATH")))
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(ruby
     elixir
     octave
     ;; pdf-tools
     sql
     swift
     asciidoc
     python
     csv
     racket
     html
     yaml
     clojure
     java
     javascript
     auto-completion
     (haskell :variables haskell-completion-backend 'intero)

     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control

     osx
     sunra)

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(hcl-mode
     (firebelly-theme :location (recipe :fetcher github :repo "startling/firebelly"))
     (command-log-mode :location (recipe :fetcher github :repo "lewang/command-log-mode"))
     (use-package :location (recipe :fetcher github :repo "jwiegley/use-package")))


   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; DefiFnes the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(firebelly)

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state nil
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("PragmataPro"
                               :size 15
                               :width condensed
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after ` dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq powerline-default-separator nil)
  ;; (setq powerline-default-separator 'utf-8)

  (spacemacs/toggle-highlight-current-line-globally-off)

  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)


  ;; General
  (global-set-key (kbd "M-m x t s") 'transpose-sexps)
  (global-set-key (kbd "M-<backspace>") ' sp-backward-kill-word)
  (global-set-key (kbd "C-c C-k") 'eval-buffer)
  (global-set-key (kbd "C-c M-c") 'upcase-word)
  (global-set-key (kbd "C-x M-x") 'isearch-forward-symbol-at-point)
  (global-set-key (kbd "C-x C-g") 'grep-find)
  (global-set-key (kbd "C-x C-m") 'magit-status)
  (global-set-key (kbd "M-W") 'whitespace-cleanup)


  (global-set-key (kbd "C-\\") 'helm-global-mark-ring)


  ;; Clojure
  (setq clojure-enable-fancify-symbols t)

  ;; :always-align | :always-indent | :align-arguments
  (setq clojure-indent-style :align-arguments)
  (setq cider-repl-use-pretty-printing t)
  (setq cider-prompt-for-symbol nil)
  (setq nrepl-log-messages t)
  (setq cider-save-file-on-load t)
  (setq cider-special-mode-truncate-lines nil)
  (setq cider-overlays-use-font-lock t)

  (defun cider-repl-bindings ()
    (define-key cider-repl-mode-map (kbd "M-r") #'sp-raise-sexp))
  (add-hook 'cider-repl-mode-hook 'cider-repl-bindings)
  (add-hook 'cider-repl-mode-hook 'command-log-mode)
  (add-hook 'clojure-mode-hook 'command-log-mode)
  (add-hook 'emacs-lisp-mode-hook 'command-log-mode)


  (eval-after-load 'clojure-mode
    '(sayid-setup-package))


  ;; Trying to pin emacs packages
  ;; https://codehopper.nl/2018/05/28/a-tale-of-emacs-clojure-and-pinned-packages/
  (setq package-archives
        '(("gnu" . "https://elpa.gnu.org/packages/")
          ("melpa" . "https://stable.melpa.org/packages/")
          ("melpa-unstable" . "https://melpa.org/packages/")))

  (setq package-archive-priorities
        '(("melpa" . 50)
          ("gnu" . 10)
          ("melpa-unstable" . 0)))

  (add-to-list 'package-pinned-packages '(clj-refactor . "melpa-unstable") t)


  (defun unset-undo-tree-bindings ()
    (define-key undo-tree-map (kbd "C-/") nil)
    (global-set-key (kbd "C-/") 'avy-goto-char-2))
  (add-hook 'undo-tree-mode-hook 'unset-undo-tree-bindings)

  (global-set-key (kbd "C-/") 'avy-goto-char-2)
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
  (global-set-key (kbd "C-c m n l") 'mc/mark-next-lines)
  (global-set-key (kbd "C-c m n t") 'mc/mark-next-like-this)

  (global-set-key (kbd "C-c m n w") 'mc/mark-next-like-this-word)
  (global-set-key (kbd "C-c m n W") 'mc/mark-next-word-like-this)

  (global-set-key (kbd "C-c m n s") 'mc/mark-next-like-this-symbol)
  (global-set-key (kbd "C-c m n S") 'mc/mark-next-symbol-like-this)

  (global-set-key (kbd "C-c s n") 'mc/skip-to-next-like-this)
  (global-set-key (kbd "C-c s p") 'mc/skip-to-previous-like-this)
  (global-set-key (kbd "C-c m i n") 'mc/insert-numbers)

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

  (global-set-key (kbd "C-c m e l") 'mc/edit-lines)
  (global-set-key (kbd "C-c m e b") 'mc/edit-beginnings-of-lines)
  (global-set-key (kbd "C-c m e e") 'mc/edit-ends-of-lines)


  ;; Projectile
  (global-set-key (kbd "M-m p S") 'projectile-save-project-buffers)


  ;; Searching
  (define-key spacemacs-default-map-root-map (kbd "M-m s a /") 'helm-ag-project-root)


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


  ;; Miscellaneous
  (global-set-key (kbd "C-o") 'hs-toggle-hiding)
  (global-set-key (kbd "M-L") 'command-history)


  (defhydra smart-parens-navigation (global-map "C-M-.")
    "
     Smartparens"
    ("u" sp-backward-up-sexp)
    ("U" sp-up-sexp)
    ("d" sp-down-sexp)
    ("D" sp-backward-down-sexp)
    ("j" sp-forward-slurp-sexp)
    ("J" sp-forward-barf-sexp)
    ("y" sp-backward-slurp-sexp)
    ("Y" sp-backward-barf-sexp)
    ("n" sp-next-sexp)
    ("p" sp-previous-sexp)
    ("f" forward-sexp)
    ("b" backward-sexp)
    ("r" sp-raise-sexp)
    ("s" sp-splice-sexp)

    ("q" nil "quit" :color blue))

  (defhydra hydra-multiple-cursors-next (global-map "C-c m n")
    "
     Mark next"
    ("l" mc/mark-next-lines "lines")
    ("t" mc/mark-next-like-this "next")
    ("w" mc/mark-next-like-this-word "word")
    ("s" mc/mark-next-like-this-symbol "symbol")
    ("W" mc/mark-next-word-like-this "whole word")
    ("S" mc/mark-next-symbol-like-this "whole symbol")

    ("q" nil "quit" :color blue))

  (defhydra hydra-multiple-cursors-previous (global-map "C-c m p")
    "
     Mark previous"
    ("l" mc/mark-previous-lines "lines")
    ("t" mc/mark-previous-like-this "previous")
    ("w" mc/mark-previous-like-this-word "word")
    ("s" mc/mark-previous-like-this-symbol "symbol")
    ("W" mc/mark-previous-word-like-this "whole word")
    ("S" mc/mark-previous-symbol-like-this "whole symbol")

    ("q" nil "quit" :color blue))

  (defhydra hydra-cljr-code (:color pink :hint nil)
    "
    Ns related refactorings
    --------------------------------------------------------------------------------------------------------------------------------------
    _ai_: Add import to ns                             _am_: Add missing libspec                          _ap_: Add project dependency
    _ar_: Add require to ns                            _au_: Add use to ns                                _cn_: Clean ns
    _rm_: Require a macro into the ns                  _sr_: Stop referring

     Code related refactorings
    --------------------------------------------------------------------------------------------------------------------------------------
    _ci_: Cycle if                                     _ct_: Cycle thread
    _dk_: Destructure keys                             _el_: Expand let                                   _fu_: Find usages
    _il_: Introduce let                                _is_: Inline symbol                                _ml_: Move to let
    _pf_: Promote function                             _rl_: Remove let                                   _rs_: Rename symbol
    _tf_: Thread first all                             _th_: Thread                                       _tl_: Thread last all
    _ua_: Unwind all                                   _uw_: Unwind

     Toplevel form related refactorings
    --------------------------------------------------------------------------------------------------------------------------------------
    _as_: Add stubs for the interface/protocol at point_cp_: Cycle privacy                                _cs_: Change function signature
    _ec_: Extract constant                             _ed_: Extract form as def                          _ef_: Extract function
    _fe_: Create function from example                 _is_: Inline symbol                                _mf_: Move form
    _pf_: Promote function                             _rf_: Rename file-or-dir                           _ad_: Add declaration"

    ("ai" cljr-add-import-to-ns) ("am" cljr-add-missing-libspec)
    ("ap" cljr-add-project-dependency) ("ar" cljr-add-require-to-ns)
    ("au" cljr-add-use-to-ns) ("cn" cljr-clean-ns)
    ("rm" cljr-require-macro) ("sr" cljr-stop-referring)

    ("ci" clojure-cycle-if) ("ct" cljr-cycle-thread)
    ("dk" cljr-destructure-keys) ("el" cljr-expand-let)
    ("fu" cljr-find-usages) ("il" cljr-introduce-let)
    ("is" cljr-inline-symbol) ("ml" cljr-move-to-let)
    ("pf" cljr-promote-function) ("rl" cljr-remove-let)
    ("rs" cljr-rename-symbol) ("tf" clojure-thread-first-all)
    ("th" clojure-thread) ("tl" clojure-thread-last-all)
    ("ua" clojure-unwind-all) ("uw" clojure-unwind)

    ("as" cljr-add-stubs) ("cp" clojure-cycle-privacy)
    ("cs" cljr-change-function-signature) ("ec" cljr-extract-constant)
    ("ed" cljr-extract-def) ("ef" cljr-extract-function)
    ("fe" cljr-create-fn-from-example) ("is" cljr-inline-symbol)
    ("mf" cljr-move-form) ("pf" cljr-promote-function)
    ("rf" cljr-rename-file-or-dir) ("ad" cljr-add-declaration)

    ("q" nil "quit" :color blue))

  (defhydra hydra-cljr-project (:color pink :hint nil)
    "
    Project related refactorings
    --------------------------------------------------------------------------------------------------------------------------------------
    _ap_: Add project dependency                       _cs_: Change function signature                    _fu_: Find usages
    _hd_: Hotload dependency                           _is_: Inline symbol                                _mf_: Move form
    _pc_: Project clean                                _rf_: Rename file-or-dir _rs_: Rename symbol       _sp_: Sort project dependencies
    _up_: Update project dependencies

     Cljr related refactorings
    --------------------------------------------------------------------------------------------------------------------------------------
    _sc_: Show the project's changelog                 _?_: Describe refactoring

    Available refactoring types
    -----------------------------------------------------------------------------
    _n_: Ns related refactorings      _c_: Code related refactorings
    _p_: Project related refactorings _t_: Top level forms related refactorings
    _s_: Refactor related functions"

    ("ap" cljr-add-project-dependency) ("cs" cljr-change-function-signature)
    ("fu" cljr-find-usages) ("hd" cljr-hotload-dependency)
    ("is" cljr-inline-symbol) ("mf" cljr-move-form)
    ("pc" cljr-project-clean) ("rf" cljr-rename-file-or-dir)
    ("rs" cljr-rename-symbol) ("sp" cljr-sort-project-dependencies)
    ("up" cljr-update-project-dependencies)

    ("sc" cljr-show-changelog) ("?" cljr-describe-refactoring)

    ("n" hydra-cljr-ns-menu/body :exit t)
    ("c" hydra-cljr-code-menu/body :exit t)
    ("p" hydra-cljr-project-menu/body :exit t)
    ("t" hydra-cljr-toplevel-form-menu/body :exit t)
    ("s" hydra-cljr-cljr-menu/body :exit t)

    ("q" nil "quit" :color blue))

  (defhydra hydra-dired (:hint nil :color pink)
    "
     _+_ mkdir          _v_iew           _m_ark             _(_ details        _i_nsert-subdir    wdired
     _C_opy             _O_ view other   _U_nmark all       _)_ omit-mode      _$_ hide-subdir    C-x C-q : edit
     _D_elete           _o_pen other     _u_nmark           _l_ redisplay      _w_ kill-subdir    C-c C-c : commit
     _R_ename           _M_ chmod        _t_oggle           _g_ revert buf     _e_ ediff          C-c ESC : abort
     _Y_ rel symlink    _G_ chgrp        _E_xtension mark   _s_ort             _=_ pdiff
     _S_ymlink          ^ ^              _F_ind marked      _._ toggle hydra   \\ flyspell
     _r_sync            ^ ^              ^ ^                ^ ^                _?_ summary
     _z_ compress-file  _A_ find regexp
     _Z_ compress       _Q_ repl regexp

     T - tag prefix"

    ("\\" dired-do-ispell)
    ("(" dired-hide-details-mode)
    (")" dired-omit-mode)
    ("+" dired-create-directory)
    ("=" diredp-ediff)         ;; smart diff
    ("?" dired-summary)
    ("$" diredp-hide-subdir-nomove)
    ("A" dired-do-find-regexp)
    ("C" dired-do-copy)        ;; Copy all marked files
    ("D" dired-do-delete)
    ("E" dired-mark-extension)
    ("e" dired-ediff-files)
    ("F" dired-do-find-marked-files)
    ("G" dired-do-chgrp)
    ("g" revert-buffer)        ;; read all directories again (refresh)
    ("i" dired-maybe-insert-subdir)
    ("l" dired-do-redisplay)   ;; relist the marked or singel directory
    ("M" dired-do-chmod)
    ("m" dired-mark)
    ("O" dired-display-file)
    ("o" dired-find-file-other-window)
    ("Q" dired-do-find-regexp-and-replace)
    ("R" dired-do-rename)
    ("r" dired-do-rsynch)
    ("S" dired-do-symlink)
    ("s" dired-sort-toggle-or-edit)
    ("t" dired-toggle-marks)
    ("U" dired-unmark-all-marks)
    ("u" dired-unmark)
    ("v" dired-view-file)      ;; q to exit, s to search, = gets line #
    ("w" dired-kill-subdir)
    ("Y" dired-do-relsymlink)
    ("z" diredp-compress-this-file)
    ("Z" dired-do-compress)
    ("q" nil)
    ("." nil :color blue))

  ;; (global-set-key (kbd "C-M-.") 'smart-parens-navigation/body)
  ;; (global-set-key (kbd "C-c m n") 'hydra-multiple-cursors-next/body)
  ;; (global-set-key (kbd "C-c m p") 'hydra-multiple-cursors-previous/body)
  (global-set-key (kbd "C-M-;") 'hydra-cljr-code/body)
  (global-set-key (kbd "C-M-=") 'hydra-cljr-project/body)
  (global-set-key (kbd "C-!") 'hydra-dired/body))



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "dev")
 '(custom-safe-themes
   (quote
    ("12dd37432bb454355047c967db886769a6c60e638839405dad603176e2da366b" default)))
 '(fci-rule-color "#D0BF8F" t)
 '(helm-swoop-speed-or-color t t)
 '(hl-paren-colors (quote ("black" "IndianRed1" "IndianRed3" "IndianRed4")) t)
 '(package-selected-packages
   (quote
    (rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby fancy-narrow crux sayid visual-regexp-steroids visual-regexp visible-mark treepy graphql sesman back-button ucs-utils smartrep nav-flash persistent-soft list-utils pcache command-log-mode ob-elixir flycheck-mix flycheck-credo alchemist elixir-mode sql-indent swift-mode pdf-tools tablist org-mime winum powerline racket-mode faceup org-category-capture parent-mode projectile flx ghub let-alist smartparens iedit anzu evil goto-chg undo-tree diminish hydra highlight spinner pkg-info epl bind-map bind-key packed f dash s adoc-mode markup-faces helm avy helm-core popup firebelly-theme yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic csv-mode inf-clojure web-beautify unfill reveal-in-osx-finder pbcopy osx-trash osx-dictionary livid-mode skewer-mode simple-httpd launchctl json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc hcl-mode fuzzy async company-tern dash-functional tern coffee-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data yaml-mode intero flycheck hlint-refactor hindent helm-hoogle haskell-snippets company-ghci company-ghc ghc haskell-mode company-emacs-eclim eclim company-cabal cmm-mode xterm-color smeargle shell-pop orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help company-statistics company clojure-snippets auto-yasnippet ac-ispell auto-complete rainbow-mode rainbow-identifiers color-identifiers-mode clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider seq queue clojure-mode free-keys ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(safe-local-variable-values
   (quote
    ((inf-clojure-project . t)
     (cider-boot-parameters . "start")
     (checkdoc-minor-mode . t)
     (mangle-whitespace . t))))
 '(spacemacs-theme-comment-bg nil t))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "dev")
 '(package-selected-packages
   (quote
    (overseer nameless mvn maven-test-mode groovy-mode groovy-imports pcache clojure-cheatsheet yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic csv-mode inf-clojure web-beautify unfill reveal-in-osx-finder pbcopy osx-trash osx-dictionary livid-mode skewer-mode simple-httpd launchctl json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc hcl-mode fuzzy async company-tern dash-functional tern coffee-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data yaml-mode intero flycheck hlint-refactor hindent helm-hoogle haskell-snippets company-ghci company-ghc ghc haskell-mode company-emacs-eclim eclim company-cabal cmm-mode xterm-color smeargle shell-pop orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help company-statistics company clojure-snippets auto-yasnippet ac-ispell auto-complete rainbow-mode rainbow-identifiers color-identifiers-mode clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider seq queue clojure-mode free-keys ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(safe-local-variable-values
   (quote
    ((inf-clojure-project . t)
     (cider-boot-parameters . "start")
     (checkdoc-minor-mode . t)
     (mangle-whitespace . t))))
 '(spacemacs-theme-comment-bg nil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#222222" :foreground "#999999"))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(helm-selection ((t (:background "gray11" :distant-foreground "dark orange"))))
 '(mode-line ((t (:background "#292929" :foreground "#888888" :box nil :height 1.15))))
 '(mode-line-inactive ((t (:background "#292929" :foreground "#555555" :box nil :height 1.15))))
 '(spacemacs-emacs-face ((t (:background "DarkGoldenrod2" :foreground "#3E3D31" :inherit (quote mode-line))))))
