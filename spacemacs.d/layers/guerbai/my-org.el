;; org-agenda dir.
(setq org-agenda-files '("~/org"))
(setq org-agenda-file-note "~/org/notes.org")
(setq org-agenda-file-gtd "~/org/gtd.org")
(setq org-agenda-file-feeds "~/org/feeds.org")

(setq org-default-notes-file "~/org/notes.org")

(defun my/insert-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (insert (my/retrieve-chrome-current-tab-url)))

(defun my/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (let ((result (do-applescript
                 (concat
                  "set frontmostApplication to path to frontmost application\n"
                  "tell application \"Google Chrome\"\n"
                  "	set theUrl to get URL of active tab of first window\n"
                  "	set theResult to (get theUrl) \n"
                  "end tell\n"
                  "activate application (frontmostApplication as text)\n"
                  "set links to {}\n"
                  "copy theResult to the end of links\n"
                  "return links as string\n"))))
    (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))

;; rss.
;; (setq org-feed-alist
;;       '(("Slashdot"
;;          "http://36kr.com/feed"
;;          "~/org/feeds.org" "Slashdot Entries")))

;; capture;
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-agenda-file-note "Quick notes")
         "* TODO %?\n  %i\n  %a")
        ("c" "Chrome" entry (file+headline org-agenda-file-note "Quick notes")
         "* TODO %?\n %(my/retrieve-chrome-current-tab-url)\n %i\n %U"
         :empty-lines 1)
        ))

(setq org-highest-priority ?A)
(setq org-lowest-priority  ?D)
(setq org-default-priority ?D)
(setq org-priority-faces
      '((?A . (:background "red" :foreground "white" :weight bold))
        (?B . (:background "DarkOrange" :foreground "white" :weight bold))
        (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
        (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
        ))
