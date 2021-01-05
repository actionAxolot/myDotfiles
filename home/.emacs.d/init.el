;; package --- something
;;; Comentary:
;; Usability configurationsAnd what not
;;; Code:
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-splash-screen t)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(global-visual-line-mode t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Make text editing more normal
(delete-selection-mode t)
(transient-mark-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)


;; Constant definitions
(defconst *sys/gui*
  (display-graphic-p)
  "Are we running on a GUI Emacs?")

(defconst *sys/win32*
  (eq system-type 'windows-nt)
  "Are we running on a WinTel system?")

(defconst *sys/linux*
  (eq system-type 'gnu/linux)
  "Are we running on a GNU/Linux system?")

(defconst *sys/mac*
  (eq system-type 'darwin)
  "Are we running on a Mac system?")

(defconst *sys/root*
  (string-equal "root" (getenv "USER"))
  "Are you a ROOT user?")

(defconst *rg*
  (executable-find "rg")
  "Do we have ripgrep?")

(defconst *python*
  (executable-find "python")
  "Do we have python?")

(defconst *python3*
  (executable-find "python3")
  "Do we have python3?")

(defconst *mvn*
  (executable-find "mvn")
  "Do we have Maven?")

(defconst *gcc*
  (executable-find "gcc")
  "Do we have gcc?")

(defconst *git*
  (executable-find "git")
  "Do we have git?")

(defconst *pdflatex*
  (executable-find "pdflatex")
  "Do we have pdflatex?")

;; Line numbers
(column-number-mode)
(global-display-line-numbers-mode)

;; Load the straight.el version of use-package
(defvar straight-use-package-by-default)
(straight-use-package 'use-package)
;; Tell straight to use use-package by default

(setq straight-use-package-by-default t)

;; Tell straight to use ssh by default, instead of https.
(setq straight-vc-git-default-protocol 'ssh)

(unless *sys/win32*
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(when *sys/gui*
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; Smart beginning of line
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character"
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

;; Remove the installed org version to get a newer one
(require 'cl-seq)
(setq load-path
      (cl-remove-if
       (lambda (x)
         (string-match-p "org$" x))
       load-path))

(use-package gruvbox-theme
  :straight t
  :config
  (load-theme 'gruvbox t))

(use-package org
  :straight t
  :bind
  (("C-c o a" . org-agenda)
   ("C-c o c" . org-capture)
   ("C-c o l" . org-store-link)
   :map org-mode-map
   ("C-c C-q" . counsel-org-tag))
  :config
  (add-to-list 'org-modules 'org-habit t)
  (setq org-tag-alist '((:startgrouptag)
                        ("Locations")
                        (:grouptags)
                        ("@home")
                        ("@office")
                        ("@living_room")
                        ("@dinning_room")
                        ("@outside")
                        ("@bedroom")
                        ("@andrea_bedroom")
                        ("@upstairs")
                        ("@computer")
                        ("@phone")
                        (:endgrouptag)
                        (:startgrouptag)
                        ("Contexts")
                        (:grouptags)
                        ("_client_time")
                        ("_family_time")
                        ("_personal_time")
                        ("_habit_time")
                        ("_house_time")
                        ("_physical_activity_time")
                        ("_relationship_time")
                        ("_hobby_time")
                        (:endgrouptag)
                        (:startgrouptag)
                        ("Projects")
                        (:grouptags)
                        ("aparato")
                        ("office_migration")
                        ("family_game_company")
                        ("cerra")
                        ("flabuless")
                        ("marketplace")
                        ("language_learning")
                        ("media")
                        ("favors")
                        ("berrinchuda")
                        ("chores")
                        ("tool_sharpening")
                        ("habits")
                        ("family")
                        ("rewardz")
                        (:endgrouptag)
                        (:startgrouptag)
                        ("Influence")
                        (:grouptags)
                        ("1year")
                        ("3year")
                        ("5year")
                        ("10year")
                        ("15year")
                        ("25year")
                        (:endgrouptag)))
  (setq org-log-reschedule 'note)

  (setq org-use-fast-todo-selection t)
  (setq org-todo-keywords
        '(
          ;; Tasks
          (sequence "TODO(t!)" "NEXT(n!)" "WAITING(w@/!)" "|" "DONE(d@/!)" "DELEGATED(e@/!)" "CANCELLED(c@/!)")
          ;; Objects
          (sequence "PURCHASE(p@/!)" "PURCHASED(j@/!)" "TRANSIT(u@/!)" "GIFT(h@/!)" "SELL(k@/!)" "LOANED(n@/!)" "|" "UNWANTED(a@/!)" "OWN(o@/!)" "GIFTED(g@/!)")
          ;; MEDIA
          (sequence "CONSUME(r@/!)" "SUBSCRIBE(b@/!)" "CONSUMING(l@/!)" "SHARE(s@/!)" "|" "IGNORED(i@/!)" "REFERENCE(f@?!)" "SHARED(,?@/!")
          ;; Events
          (sequence "VISIT(v@/!)" "|" "DIDNOTGO(z!/!)" "MEETING(m@/!)" "VISITED(y@/!)")
          ))
  (setq org-treat-insert-todo-heading-as-state-change t)
  (setq org-log-into-drawer t)
  (setq org-log-done 'time)
  (setq org-agenda-files '("~/Dropbox/Org/Projects")))

(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/Dropbox/Org/Notes")
      :config
      (setq org-roam-index-file "~/Dropbox/Org/index.org")
      (setq org-roam-dailies-directory "~/Dropbox/Org/Journal")
      (setq org-roam-dailies-capture-templates
            '(("d" "default" entry
               #'org-roam-capture--get-point
               "* %?"
               :file-name "~/Dropbox/Org/Notes/%<%Y-%m-%d>"
               :head "#+title: %<%Y-%m-%d>\n\n")))
      :bind (:map org-roam-mode-map
              (("C-c r l" . org-roam)
               ("C-c r f" . org-roam-find-file)
               ("C-c r g" . org-roam-graph))
              :map org-mode-map
              (("C-c r i" . org-roam-insert))
              (("C-c r I" . org-roam-insert-immediate))))

(use-package org-pomodoro
  :config
  (setq org-pomodoro-long-break-length 30)
  (setq org-pomodoro-clock-break t))

;; Disable numbers in some buffers
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package uniquify
  :straight nil
  :ensure nil
  :init
  (setq
   uniquify-buffer-name-style 'post-forward
   uniquify-separator ":"))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper))
  :config
  (ivy-mode 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         ("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode 1)
  (setq ivy-initial-inputs-alist nil))

(use-package ivy-rich
  :straight t
  :init
  (ivy-rich-mode 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(defun apto/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . apto/org-mode-visual-fill))

(use-package company
  :hook (prog-mode . global-company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package expand-region
  :straight t
  :bind
  (("C-c w" . er/expand-region)))

(use-package magit
  :straight t
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package markdown-mode
  :straight t
  :mode
  (("README\\.md\\'" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "pandoc"))

(use-package all-the-icons
  :if (display-graphic-p)
  :commands all-the-icons-install-fonts
  :init
  (unless (find-font (font-spec :name "all-the-icons"))
    (all-the-icons-install-fonts t)))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package spaceline
  :ensure t
  :init
  (require 'spaceline-config)
  :config
  (spaceline-define-segment buffer-id
    (if (and (featurep 'projectile) buffer-file-name)
        (let ((project-root (projectile-project-p)))
          (if project-root
              (file-relative-name (buffer-file-name) project-root)
              (abbreviate-file-name (buffer-file-name))))
      (powerline-buffer-id)))
  (spaceline-emacs-theme)
  (spaceline-toggle-minor-modes-off))

(use-package nyan-mode
  :init
  (setq-default nyan-animate-nyancat t
                nyan-wavy-trail t)
  :after (spaceline))

;; Keybindings that need all packages already initialized
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)
(provide 'init)
;;; init.el ends here
