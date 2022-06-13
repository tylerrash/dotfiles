(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(o)" "BLOCKED(b!)" "|" "DONE(d!)" "CANCELLED(c!)" "EVENT(e!)")))

;(setq debug-on-error t)

(require 'org-super-agenda)
(setq org-agenda-custom-commands
      '(("v" "Agenda"
	 ((agenda "" ((org-agenda-span 'day)
		      (org-super-agenda-groups	       
		       '((:name "Today"
				:and (:date today :not (:todo t))
				:and (:scheduled today :not (:todo ("DONE" "CANCELLED")))
				:order 1)
			 (:name "Future"
				:deadline future
				:order 2)
			 (:name "Recent"
				:log closed
				:order 0)
			 (:name "App Arch"
				:tag "apparch"
				)))))))))

;; -*- mode: elisp -*-
;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

(menu-bar-mode -1)
(setq org-log-done 'time)
(global-set-key "\C-ca" 'org-agenda)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((t (:foreground "#1e1c31")))))

(global-set-key "\C-cc" 'org-capture)

(setq org-agenda-files '("~/org/inbox.org" "~/org/todo.org" "~/org/notes.org" "~/org/journal"))

(setq org-capture-templates
          '(("t" "TODO" entry (file+headline "~/org/inbox.org" "Inbox")
             "* TODO %i%?\n")
	    ("e" "Event" entry (file+headline "~/org/inbox.org" "Inbox")
	     "* EVENT %i%?\n")))

(setq org-refile-targets `(("~/org/todo.org" :maxlevel . 1)))
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-log-mode-items '(state))
(setq org-agenda-window-setup "only-window")

(require 'org-journal)
(setq org-journal-dir "~/org/journal")
(setq org-journal-enable-agenda-integration t)
(setq org-journal-file-format "%Y-%m-%d.org")

;; This is broken :-(
;; (Global-hl-line-mode 1)
;;(set-face-attribute 'hl-line nil :inherit nil :background "color-233")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("/Users/tylerrash/org/inbox.org" "/Users/tylerrash/org/todo.org" "/Users/tylerrash/org/notes.org" "/Users/tylerrash/org/journal/2022-06-07.org"))
 '(package-selected-packages '(org-journal ## org-super-agenda)))
