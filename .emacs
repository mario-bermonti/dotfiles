; -*- lexical-binding: t -*-


;; VISUAL ASPECTS
;; Number line at the left
(global-linum-mode t)

;; Show column number from start
(setq column-number-mode t)

;; Default font size
(set-default-font "Hack 16")

;; show matching parens
(show-paren-mode 1)

;; insert parens and brackets in pair. Odes not work with braces.
(electric-pair-mode 1)

;; highlight current line
(add-to-list 'load-path "~/.emacs.d/highlight-current-line-0.57")
(require 'highlight-current-line)
(global-hl-line-mode t)
(setq highlight-current-line-globally t)
(setq highlight-current-line-high-faces nil)
(setq highlight-current-line-whole-line nil)
(setq hl-line-face (quote highlight))

;; FORMATTING
;; Eliminate trailing white space when buffer is saved
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; require final newlines in files when they are saved
(setq require-final-newline t)

;; Stop making backups and autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

;;Swap ctrl and cmd
(when (eq system-type 'darwin) ;; mac specific
  (setq mac-option-modifier 'control)
  (setq mac-command-modifier 'meta)
  )

;; CONTROL UI
; window modifications
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;;====================================
;; Using utf-8 symbols
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; insert special symbols
;; Lower case letters
(define-key key-translation-map (kbd "C-; a") (kbd "á"))
(define-key key-translation-map (kbd "C-; e") (kbd "é"))
(define-key key-translation-map (kbd "C-; i") (kbd "í"))
(define-key key-translation-map (kbd "C-; o") (kbd "ó"))
(define-key key-translation-map (kbd "C-; u") (kbd "ú"))
(define-key key-translation-map (kbd "C-; n") (kbd "ñ"))
(define-key key-translation-map (kbd "C-; ?") (kbd "¿"))
(define-key key-translation-map (kbd "C-` u") (kbd "ü"))
;; Upper case letters
(define-key key-translation-map (kbd "C-; A") (kbd "Á"))
(define-key key-translation-map (kbd "C-; E") (kbd "É"))
(define-key key-translation-map (kbd "C-; I") (kbd "Í"))
(define-key key-translation-map (kbd "C-; O") (kbd "Ó"))
(define-key key-translation-map (kbd "C-; U") (kbd "Ú"))
(define-key key-translation-map (kbd "C-; N") (kbd "Ñ"))
(define-key key-translation-map (kbd "C-` U") (kbd "Ü"))

;;====================================
;; Para usar melpa en vez de elpa. Melpa esta up-to-date.
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


;; ====================================
;; Ido mode
(require 'ido)
(ido-mode 1)

;; Git
(require 'magit)
;; Shortcuts
(global-set-key (kbd "C-x g b") 'magit-branch-and-checkout)
(global-set-key (kbd "C-x g s") 'magit-status)
(global-set-key (kbd "C-x g d") 'magit-diff)
(global-set-key (kbd "C-x g l") 'magit-log)
(global-set-key (kbd "C-x g c") 'magit-checkout)
(global-set-key (kbd "C-x g p") 'magit-push)


;; PYTHON
;; Estas son config a emacs para Python.

;; Fixes autocompletion being disabled because the original code (python.el)
;; returns '' if autocompletion should be enabled, which evaluated to nil
;; and doesn't work. (This is supposed to be fixed on emacs v. 25.3 but I
;; still got the error)

(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

;; Projectile
;; Para activar projectile al abrir emacs.
(require 'projectile)
(projectile-global-mode)

;; Auto-complete
;; Para activar auto-complete al abrir emacs.
(require 'auto-complete-config)
(ac-config-default)
; Menu para auto-complete
(setq ac-show-menu-immediately-on-auto-complete t)


;; Jedi
;; Config de Jedi
(require 'jedi)

;; Indica donde esta el shell de python
(setq jedi:server-command
      (list "/usr/local/bin/python3" jedi:server-script))

(defvar jedi-config:use-system-python t)

(defun jedi-config:set-python-executable()
  (set-exec-path-from-shell-PATH)
  (make-local-variable 'jedi:server-command)
  (set 'jedi:server-command
       (list (executable-find "python3")
	     (cadr default-jedi-server-command))))

;; Para completar luego de un punto (metodos, etc.)
(setq jedi:complete-on-dot t)

;; Para que el pop al llamar una función no salga automático.
(setq jedi:get-in-function-call-delay 1000)

;; Para bind el pop al key C-c /
(global-set-key (kbd "C-c /") 'jedi:get-in-function-call)

;; Hook up to autocomplete
(add-to-list 'ac-sources 'ac-source-jedi-direct)

;; Enable for python-mode
(add-hook 'python-mode-hook 'jedi:setup)

;; Flymake
;; Para chekear el syntax de python - flymake
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
;; Anadir flake8 porque incluye pyflake y pep8
(setq flymake-python-pyflakes-executable "flake8")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "50e9ef789d599d39a9ecb6e983757306ea19198d1a8f182be7fd3242b613f00e" "0fb6369323495c40b31820ec59167ac4c40773c3b952c264dd8651a3b704f6b5" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "64581032564feda2b5f2cf389018b4b9906d98293d84d84142d90d7986032d33" default)))
 '(doc-view-continuous t)
 '(fci-rule-color "#49483E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (ox-pandoc ob-ipython ace-window org-ref htmlize yasnippet-snippets yasnippet ac-js2 js2-mode web-mode projectile monokai-theme key-chord jedi flymake-python-pyflakes evil-tutor evil-org evil-magit elhome autotest auctex)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(python-shell-interpreter "ipython")
 '(python-shell-interpreter-args "--simple-prompt -i")
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))


;#############################################
;Load a template for python

(add-hook 'find-file-hooks 'maybe-load-template)
(defun maybe-load-template ()
  (interactive)
  (when (and
         (string-match "\\.py$" (buffer-file-name))
         (eq 1 (point-max)))
    (insert-file "~/.emacs.d/pythontemplate.py")))

;;=================================================
;; Leader Key
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
;; General commands
(evil-leader/set-key
  "lb" 'ido-switch-buffer
  "sd" 'scroll-other-window
  "su" 'scroll-other-window-down
  "f" 'find-file
  "gc" 'move-to-column
  )

;; Spell check
(evil-leader/set-key
  "scb" 'ispell-buffer
  "scr" 'ispell-region
  "scs" 'ispell-change-dictionary "spanish"
  )

;; Projectile
 (evil-leader/set-key-for-mode 'python-mode
  "pf" 'projectile-find-file
  "pw" 'projectile-find-file-other-window
  )

;; Jedi
 (evil-leader/set-key
  "jg" 'jedi:goto-definition
  "jd" 'jedi:show-doc
  )

;; Magit
 (evil-leader/set-key
  "gs" 'magit-status
  "gb" 'magit-branch-and-checkout
  "gd" 'magit-diff
  "gl" 'magit-log
  )

;; ORG
 (evil-leader/set-key-for-mode 'org-mode
  "is" 'org-edit-special
  "es" 'org-edit-src-exit
  "eab" 'org-babel-execute-buffer
  "nh" 'org-next-visible-heading
  "ph" 'org-previous-visible-heading
  "ct" 'org-todo
  "o2b" 'org2blog/wp-mode
  "bne" 'org2blog/wp-new-entry
  "pbd" 'org2blog/wp-post-buffer
  "pbp" 'org2blog/wp-post-buffer-and-publish
  "ppd" 'org2blog/wp-post-buffer-as-page
  "ppp" 'org2blog/wp-post-buffer-as-page-and-publish
  )

;; EVIL MODE
(add-to-list 'load-path "~/.emacs.d/evil")
     (require 'evil)
     (evil-mode 1)

 ;; Note: lexical-binding must be t in order for this to work correctly.
   (defun make-conditional-key-translation (key-from key-to translate-keys-p)
     "Make a Key Translation such that if the translate-keys-p function returns true,
   key-from translates to key-to, else key-from translates to itself.  translate-keys-p
   takes key-from as an argument. "
     (define-key key-translation-map key-from
       (lambda (prompt)
         (if (funcall translate-keys-p key-from) key-to key-from))))
   (defun my-translate-keys-p (key-from)
     "Returns whether conditional key translations should be active.  See make-conditional-key-translation function. "
     (and
       ;; Only allow a non identity translation if we're beginning a Key Sequence.
       (equal key-from (this-command-keys))
       (or (evil-motion-state-p) (evil-normal-state-p) (evil-visual-state-p))))
   (define-key evil-normal-state-map "c" nil)
   (define-key evil-motion-state-map "cu" 'universal-argument)
   (make-conditional-key-translation (kbd "ch") (kbd "C-h") 'my-translate-keys-p)
   (make-conditional-key-translation (kbd "g") (kbd "C-x") 'my-translate-keys-p)

;;
(when (fboundp 'cl-loop)
      ;; cl-loop iterates from ASCII '!' to ASCII '~'.
      (cl-loop for ascii-code-i from 33 to 126 by 1 do
	       (make-conditional-key-translation (kbd (format "c%c" ascii-code-i))
						 (kbd (format "C-%c" ascii-code-i))
						 'my-translate-keys-p)))
;;
 ;;; C-c as general purpose escape key sequence.
   ;;;
   (defun my-esc (prompt)
     "Functionality for escaping generally.  Includes exiting Evil insert state and C-g binding. "
     (cond
      ;; If we're in one of the Evil states that defines [escape] key, return [escape] so as
      ;; Key Lookup will use it.
      ((or (evil-insert-state-p) (evil-normal-state-p) (evil-replace-state-p) (evil-visual-state-p)) [escape])
      ;; This is the best way I could infer for now to have C-c work during evil-read-key.
      ;; Note: As long as I return [escape] in normal-state, I don't need this.
      ;;((eq overriding-terminal-local-map evil-read-key-map) (keyboard-quit) (kbd ""))
      (t (kbd "C-g"))))
   (define-key key-translation-map (kbd "C-,") 'my-esc)
   ;; Works around the fact that Evil uses read-event directly when in operator state, which
   ;; doesn't use the key-translation-map.
   (define-key evil-operator-state-map (kbd "C-,") 'keyboard-quit)
   ;; Not sure what behavior this changes, but might as well set it, seeing the Elisp manual's
   ;; documentation of it.
   (set-quit-char "C-,")



;;==========================================
;; KEYCHORD
;; Package for executing commands with two-key combinations
;; Load required package (keychord)
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)



;;============================================
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:inherit highlight :background "selectedTextBackgroundColor")))))


;;####################

;; JAVASCRIPT
;; Enable js mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; Enable autocompletion for js
(add-hook 'js2-mode-hook 'ac-js2-mode)
(global-set-key (kbd "C-c .") 'ac-js2-jump-to-definition)


;; ######################
;; org mode configuration
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ipython . t)))

;; Dont require confirmation to run code from source blocks
(setq org-confirm-babel-evaluate nil)

;; Display images inline after regular execution
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

;; Remove numbering from headings
(setq org-export-with-section-numbers nil)
(setq org-startup-indented t)

;; Org-mode Data Science workflow
;; ------------------------------
;; Use python 3 instead of python 2
(setq org-babel-python-command "python3")

;; Eliminate starting characters from python's session mode
(defun org-babel-python-strip-session-chars ()
  "Remove >>> and ... from a Python session output."
  (when (and (string=
              "python"
              (org-element-property :language (org-element-at-point)))
             (string-match
              ":session"
              (org-element-property :parameters (org-element-at-point))))

    (save-excursion
      (when (org-babel-where-is-src-block-result)
        (goto-char (org-babel-where-is-src-block-result))
        (end-of-line 1)
        ;(while (looking-at "[\n\r\t\f ]") (forward-char 1))
        (while (re-search-forward
                "\\(>>> \\|\\.\\.\\. \\|: $\\|: >>>$\\)"
                (org-element-property :end (org-element-at-point))
                t)
          (replace-match "")
          ;; this enables us to get rid of blank lines and blank : >>>
          (beginning-of-line)
          (when (looking-at "^$")
            (kill-line)))))))

(add-hook 'org-babel-after-execute-hook 'org-babel-python-strip-session-chars)
;; ------------------------------

;; ------------------------------
;; org-ref config
;; Setting path for pdf files
(setq org-ref-pdf-directory "~/Research/Mendeley_lib/pdf_bib")

;; Set up for helm-bibtex
; (setq bibtex-completion-library-path "~/Research/Mendeley_lib/pdf_bib")

;; open pdf with system pdf viewer
;(setq bibtex-completion-pdf-open-function
;  (lambda (fpath)
;    (start-process "open" "*open*" "open" fpath)))

;; Exporting to latex with bibliography
;(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

;; Specific for using Mendeley
(setq org-ref-open-pdf-function 'org-ref-get-mendeley-filename)

(require 'org-ref)
;; ------------------------------

;; ------------------------------
;; org2blog config
;; Export org files to wordpress
(setq load-path (cons "~/.emacs.d/org2blog/" load-path))
(require 'org2blog-autoloads)

(setq load-path (cons "~/.emacs.d/xml-rpc-el/" load-path))
(setq load-path (cons "~/.emacs.d/metaweblog/" load-path))
(setq org2blog/wp-blog-alist
      '(("codin cognitive research"
	 :url "https://codingcognitiveresearch.wordpress.com/xmlrpc.php"
	 :username "mbermonti"
	 :default-categories ("python" "coding" "research" "cognition" "psychology"))))

;; ------------------------------
;; ox-pandoc
(require 'ox-pandoc)

;; ######################
;; Yasnippet
;; Code templating
(require 'yasnippet)
(yas-global-mode 1)

;; #####################
;; Spell checking
;; Checks wheter aspell exists before renaming ispell
(cond
 ((executable-find "aspell")
  (setq ispell-program-name "aspell")))

;; Just spell check comments
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
