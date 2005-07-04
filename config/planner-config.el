;;; Sacha's configuration for planner.el
;; Sacha Chua <sacha@free.net.ph>

;;;_+ Loading

(request 'planner)

(planner-install-extra-task-keybindings)

(planner-install-extra-note-keybindings)
(define-key planner-mode-map "\C-c\C-o\C-h" (lambda () (interactive) (planner-create-note (muse-page-name))))

(setq planner-annotation-format-local-file-name 'yh/collapse-home-directory)

(define-key planner-mode-map "\C-c\C-t\C-e" 'planner-edit-task-description)

(eval-after-load "bbdb"
  '(require 'planner-bbdb))

(eval-after-load "gnus"
  '(progn
     (require 'planner-gnus)
     (planner-gnus-insinuate)))

(request 'planner-bibtex)
(request 'planner-id)

(planner-insinuate-calendar)

(request 'planner-log-edit)

(add-to-list 'planner-log-edit-flush-regexp-list "^##.*$")

(request 'planner-w3m)

(request 'planner-xtla)

(request 'planner-bookmark)

(when (require 'planner-multi)
  (setq planner-multi-copy-tasks-to-page "TaskPool"))

(provide 'planner-config)

;;;_* Local emacs vars.
;;;Local variables:
;;;allout-layout: (* 0 : )
;;;End:

;;; planner-config.el ends here
