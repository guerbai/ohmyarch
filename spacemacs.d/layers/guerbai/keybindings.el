(spacemacs/set-leader-keys "ot" 'guerbai/terminal-here)
(spacemacs/set-leader-keys "odt" 'guerbai/terminal-bye)
(spacemacs/set-leader-keys "o=" 'indent-region-or-buffer)
(spacemacs/set-leader-keys "oc" 'indent-region-or-buffer)

;; C-n C-p to select company candidates.
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
