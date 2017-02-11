;; remove produce of #file#
(setq create-lockfiles nil)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ("8mail" "guerbai8@gmail.com")
                                            ("ut" "# -*- coding: utf-8 -*-")
                                            ))

;; decrease prompt type.
(fset 'yes-or-no-p 'y-or-n-p)
