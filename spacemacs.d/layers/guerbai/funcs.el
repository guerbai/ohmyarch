(setq-default guerbai/terminal-buffer-name "*terminal*")

(fset 'guerbai/close-buffer-with-auto-prompt
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\355bdy\355wd" 0 "%d")) arg)))

(defun guerbai/terminal-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The shell is renamed to match that
directory to make multiple shell windows easier."
  (interactive)
  (let* ((height (/ (window-total-height) 3)))
    (split-window-vertically (- height))
    (other-window 1)
    (term "/bin/zsh")
    (rename-buffer (guerbai/terminal-buffer-name))
    (insert "ls")
    (term-send-input)))

(defun guerbai/terminal-bye ()
  (interactive)
  (if (not (string= (buffer-name) guerbai/terminal-buffer-name))
      (switch-to-buffer-other-window guerbai/terminal-buffer-name)
    )
  (guerbai/close-buffer-with-auto-prompt))

;; Indent all or region.
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))


