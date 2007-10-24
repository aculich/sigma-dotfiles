;; -*- mode: emacs-lisp; mode: hi-lock; mode: page-break; auto-compile-lisp: nil; -*-
;; $Id: dotgnus.el 229 2007-03-07 21:10:37Z yann $

;;; Basis
;; Load site-specific stuff
(if (file-exists-p (expand-file-name "~/.gnus-local.el"))
    (load-file (expand-file-name "~/.gnus-local.el")))

(require 'nnmairix)
(require 'gnuslog)
(require 'nnir)

(require 'gnus-dired)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(require 'message-x)

;; Define url catchers
(setq browse-url-browser-function '(("^mailto:" . gnus-url-mailto)
				    ("." . browse-url-netscape)))

;; global parameters
(setq
 ;; don't annoy me with confirmation requests
 gnus-expert-user t
 ;; 5 lines of signature
 gnus-signature-limit '(5.0 "^---*Forwarded article"))

(setq
 gnus-check-new-newsgroups t
 gnus-read-active-file 'some
 gnus-save-killed-list t
 gnus-save-newsrc-file nil
 gnus-read-newsrc-file nil
 gnus-subscribe-newsgroup-method 'gnus-subscribe-topics
 message-generate-headers-first t
 gnus-gcc-mark-as-read t
 gnus-inhibit-startup-message t
 gnus-use-cache t
 gnus-agent t
 nnmail-message-id-cache-file (concat nbc-gnus-dir "nnmail-cache")

 ;; Split mails
 nnmail-message-id-cache-length 10000
 nnmail-cache-accepted-message-ids t
 nnmail-treat-duplicates 'warn)

(add-hook 'gnus-select-article-hook 'gnus-agent-fetch-selected-article)

(defun my-gnus-expiry-target (group)
  (concat my-archived-group-backend ":"
          group
          "-archive."
          (format-time-string "%m-%Y" (my-gnus-get-article-date))))

(defun my-gnus-get-article-date ()
  "Extracts the date from the current article and converts it to Emacs time"
  (save-excursion
    (goto-char (point-min))
    (gnus-date-get-time (message-fetch-field "date"))))

(setq
 ;; archiving backend
 my-archived-group-backend "nnmaildir"
 ;; set expiry target to a function call
 nnmail-expiry-target 'my-gnus-expiry-target)

(setq
 gnus-auto-expirable-newsgroups "mail.\\(root\\|delete\\)"
 nnmail-use-long-file-names t
 gnus-uncacheable-groups "^nnmaildir")

;; increase score for most read groups
(add-hook 'gnus-summary-exit-hook 'gnus-summary-bubble-group)

;; Use topics
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq
 gnus-thread-hide-subtree t
 gnus-suppress-duplicates t
 gnus-auto-select-first nil
 gnus-large-newsgroup 100)

(setq gnus-default-adaptive-score-alist
      '((gnus-unread-mark)
        (gnus-ticked-mark (from 4))
        (gnus-dormant-mark (from 5))
        (gnus-del-mark (from -4) (subject -1))
        (gnus-read-mark (from 4) (subject 2))
        (gnus-expirable-mark (from -1) (subject -1))
        (gnus-killed-mark (from -1) (subject -3))
        (gnus-kill-file-mark)
        (gnus-ancient-mark)
        (gnus-low-score-mark)
        (gnus-catchup-mark (from -1) (subject -1))))

(add-hook 'message-sent-hook 'gnus-score-followup-thread)


;;; Summary buffer
(add-hook 'gnus-summary-mode-hook
	  (lambda ()
	    (if (or (gnus-news-group-p gnus-newsgroup-name)
		    (string-match "^nnml:list" gnus-newsgroup-name))
		(setq gnus-thread-sort-functions
		      '(gnus-thread-sort-by-subject
			gnus-thread-sort-by-total-score))
	      (setq gnus-thread-sort-functions
		    '(gnus-thread-sort-by-date)))))

(setq
 gnus-extra-headers '(Newsgroups X-Spam-Status)
 nnmail-extra-headers gnus-extra-headers)

;; Personal threading view
(defun gnus-user-format-function-Z (ok)
  (format "%s%s" (replace-regexp-in-string "\\(.*\\)    " "\\1   >" gnus-tmp-indentation) gnus-tmp-subject-or-nil))

;; this corresponds to a topic line format of "%n %A"
(defun gnus-user-format-function-topic-line (dummy)
  (let ((topic-face (if (zerop total-number-of-articles)
                        'italic
                      'bold)))
    (propertize
     (format "%s %d" name total-number-of-articles)
     'face topic-face)))

;; Some line format
(when window-system
  (setq gnus-sum-thread-tree-root "\x4912f ")
  (setq gnus-sum-thread-tree-single-indent "\x4912e ")
  (setq gnus-sum-thread-tree-leaf-with-other "\x4903c\x49020\x490fa ")
  (setq gnus-sum-thread-tree-vertical "\x49022")
  (setq gnus-sum-thread-tree-single-leaf "\x490b0\x49020\x490fa "))

(setq gnus-summary-same-subject "")

(copy-face 'default 'mysubject)
(setq gnus-face-1 'mysubject)

(copy-face 'default 'mytime)
(set-face-foreground 'mytime "red")
(setq gnus-face-2 'mytime)

(copy-face 'default 'mythreads)
(set-face-foreground 'mythreads "red")
(setq gnus-face-3 'mythreads)

(copy-face 'default 'mygrey)
(set-face-foreground 'mygrey "grey")
(setq gnus-face-4 'mygrey)

(copy-face 'default 'myblack)
(set-face-foreground 'myblack "grey60")
(setq gnus-face-5 'myblack)

(copy-face 'default 'mybiggernumbers)
(set-face-foreground 'mybiggernumbers "red")
(setq gnus-face-6 'mybiggernumbers)

(setq gnus-summary-line-format (concat
                                "%*%5{%U%R%z%}"
                                "%4{|%}"
                                "%2{%-10&user-date;%}"
                                "%4{|%}"
                                "%4{|%}"
                                "%2{ %}%(%-24,24n"
                                "%4{|%}"
                                "%2{%5i%}"
                                "%4{|%}"
                                "%2{%6k %}%)"
                                "%4{|%}"
                                "%2{ %}%3{%B%}%1{%s%}\n"))

(setq
 gnus-group-line-format "%M%S%p%P%5y: %(%G%) (%t)\n"
 gnus-group-mode-line-format "Gnus: %%b"
                                        ; gnus-summary-line-format "%U%R%z %[%-15,15n%] : %-55,55uZ (%d)\n"
 gnus-summary-mode-line-format "Gnus: %g [%r/%U]"
 gnus-article-mode-line-format "Gnus: %g [%r/%U] %m"
 gnus-topic-line-format "%i[ %u&topic-line; ] %v\n")

(if (eq window-system 'x)
    (progn
      (gnus-add-configuration
       `(group
	 (vertical 1.0
		   (horizontal 9
			       ("*BBDB*" 0.3)
			       ("*Calendar*" 1.0))
		   (horizontal 1.0
			       (group 0.3 point)
			       (,(file-name-nondirectory local-home-page) 1.0)))))

      (gnus-add-configuration
       '(info
         (vertical 1.0
                   (horizontal 9
                               ("*BBDB*" 0.3)
                               ("*Calendar*" 1.0))
                   (horizontal 1.0
                               (group 0.3 point)
                               (info 1.0)))))

      (gnus-add-configuration
       '(article
	 (vertical 1.0
		   (horizontal 9
			       ("*BBDB*" 0.3)
			       (summary 1.0 point))
		   (horizontal 1.0
			       (group 0.3)
			       (article 1.0)))))

      (gnus-add-configuration
       '(reply-yank
	 (vertical 1.0
		   (horizontal 9
			       ("*BBDB*" 0.3)
			       (summary 1.0))
		   (horizontal 1.0
			       (group 0.3)
			       (message 1.0 point)))))

      (gnus-add-configuration
       '(forward
	 (vertical 1.0
		   (horizontal 9
			       ("*BBDB*" 0.3)
			       (summary 1.0))
		   (horizontal 1.0
			       (group 0.3)
			       (message 1.0 point)))))

      (gnus-add-configuration
       '(summary
	 (vertical 1.0
		   (horizontal 9
			       ("*BBDB*" 0.3)
			       (summary 1.0 point))
		   (horizontal 1.0
			       (group 0.3)
			       ("*scratch*" 1.0)))))

      (gnus-add-configuration
       '(reply
	 (vertical 1.0
                   (horizontal 9
			       ("*BBDB*" 0.3)
			       (summary 1.0))
		   (horizontal 1.0
			       (group 0.3)
			       (vertical 1.0
                                         (article 0.3)
                                         (message 1.0 point))))))
      )
  )

(setq
 nbc-gnus-visible-headers
 '("^From:\\|^Organization:\\|^To:\\|^Cc:\\|^Reply-To:\\|^Subject:\\|^Sender:"
   "^Newsgroups:.+[,]+.*$"
   "^X-Mailer:\\|^X-Newsreader:\\|^user-Agent\\|^X-Posting-Agent"
   "^Followup-To:\\|^Date:"))

(setq
 gnus-boring-article-headers '(empty followup-to reply-to))

;; Format display
(add-hook 'gnus-article-display-hook 'gnus-article-highlight)
(add-hook 'gnus-article-display-hook 'gnus-article-hide-headers-if-wanted)
(add-hook 'gnus-article-display-hook 'gnus-article-hide-boring-headers)
(add-hook 'gnus-article-display-hook 'gnus-article-de-quoted-unreadable)
(add-hook 'gnus-article-display-hook 'gnus-article-strip-leading-blank-lines)
(add-hook 'gnus-article-display-hook 'gnus-article-remove-trailing-blank-lines)
(add-hook 'gnus-article-display-hook 'gnus-article-strip-multiple-blank-lines)
(add-hook 'gnus-article-display-hook 'gnus-article-emphasize)

;; ignore vcards
(setq gnus-ignored-mime-types '("text/x-vcard"))

;; I want plain/text mails
(setq mm-discouraged-alternatives '("text/html" "text/richtext"))

(add-hook 'gnus-message-setup-hook 'font-lock-fontify-buffer)


;;; Mail sending

(add-hook 'message-mode-hook 'turn-on-auto-fill)

(setq
 message-cite-function 'trivial-cite

 gnus-signature-separator  '("^-- $"         ; The standard
			     "^--$"          ; Die OE Die !
			     "^-- *$"        ; A common mangling
			     "^-------*$"    ; Many people just use a looong
                                        ; line of dashes.  Shame!
			     "^ *--------*$" ; Double-shame!
			     "^________*$"   ; Underscores are also popular
			     "^========*$"   ; Pervert!
			     ))


;;; Posting Styles

(defun nbc-message-insert-citation-line ()
  "Function that inserts a simple citation line."
  (when message-reply-headers
    (insert (mail-header-from message-reply-headers)
	    " wrote:\n\n")))

(setq message-citation-line-function 'nbc-message-insert-citation-line)

;; Tell gnus into which group to store messages
(setq gnus-message-archive-group
      '((if (message-news-p)
            (concat "news." (format-time-string "%Y-%m" (current-time)))
          (list gnus-newsgroup-name
                (concat "mail." (format-time-string "%Y-%m" (current-time)))))))

(setq
 gnus-prompt-before-saving nil
 gnus-default-article-saver  'gnus-summary-save-in-rmail)

;;; Misc

(defadvice gnus-summary-reply (around reply-in-news activate)
  (interactive)
  (when (or (not (gnus-news-group-p gnus-newsgroup-name))
            (y-or-n-p "Really reply to author ? "))
    ad-do-it))

(defun my-gnus-summary-show-thread ()
  "Show thread without changing cursor positon."
  (interactive)
  (gnus-summary-show-thread)
  (beginning-of-line)
  (forward-char 1))

(define-key gnus-summary-mode-map [(right)] 'my-gnus-summary-show-thread)
(define-key gnus-summary-mode-map [(left)]  'gnus-summary-hide-thread)


;;; BBDB

(require 'bbdb)
(bbdb-initialize 'gnus 'message 'sc)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

(bbdb-insinuate-message)

(add-hook 'mail-setup-hook 'bbdb-insinuate-sendmail)
(add-hook 'message-setup-hook 'bbdb-define-all-aliases)

(setq
 bbdb-offer-save 'yes
 bbdb-electric-p t
 bbdb-pop-up-target-lines 5
 bbdb-use-pop-up nil
 bbdb-north-american-phone-numbers-p nil)

(add-hook 'message-mode-hook
          (lambda () (local-set-key [(meta tab)] 'bbdb-complete-name)))

(add-hook 'bbdb-list-hook 'my-bbdb-display-xface)
(defun my-bbdb-display-xface ()
  "Search for face properties and display the faces."
  (when (or (gnus-image-type-available-p 'xface)
            (gnus-image-type-available-p 'pbm))
    (save-excursion
      (goto-char (point-min))
      (let ((inhibit-read-only t)                       ; edit the BBDB buffer
            (default-enable-multibyte-characters nil)   ; prevents corruption
            pbm faces)
        (while (re-search-forward "^           face: \\(.*\\)" nil t)
          (setq faces (match-string 1))
          (replace-match "" t t nil 1)
          (dolist (data (split-string faces ", "))
            (condition-case nil
                (insert-image (create-image (gnus-convert-face-to-png data) nil t))
              (error
               (insert-image (gnus-create-image (uncompface data) nil t :face 'tooltip))))
            (insert " ")))))))
(add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)
(setq bbdb-auto-notes-alist '(("X-Face" (".+" face 0 'replace))
                              ("Face" (".+" face 0 'replace))))



;;; Gnus extensions

(add-hook 'message-mode-hook 'flyspell-mode)

;;
;; automatic mail scan without manual effort.
;;
;; level-specified group scanner.
(defun gnus-demon-scan-mail-or-news-and-update (level)
"Scan for new mail, updating the *Group* buffer."
;  (let ((win (current-window-configuration)))
    (unwind-protect
        (save-window-excursion
            (when (gnus-alive-p)
              (save-excursion
                (set-buffer gnus-group-buffer)
                (gnus-group-get-new-news level)))))
;      (set-window-configuration win))
)

;;
;; level 2: only mail groups are scanned.
(defun gnus-demon-scan-mail-and-update ()
  "Scan for new mail, updating the *Group* buffer."
  ;(osd-display "Scan for new mail")
  (gnus-demon-scan-mail-or-news-and-update 2))

;;
;; level 3: mail and local news groups are scanned.
(defun gnus-demon-scan-news-and-update ()
  "Scan for new mail, updating the *Group* buffer."
  ;(osd-display "Scan for new news")
  (gnus-demon-scan-mail-or-news-and-update 3))

(setq gnus-use-demon t)

(defun yh/gnus-demon-install ()
  (interactive)
  ;; scan for news every 20 minutes
  (gnus-demon-add-handler 'gnus-demon-scan-news-and-update 20 2)
  ;; scan for mails every 2 minutes
  (gnus-demon-add-handler 'gnus-demon-scan-mail-and-update 2 2))

(defun yh/gnus-demon-uninstall ()
  (interactive)
  (gnus-demon-cancel))

(setq message-signature t)

;; (yh/gnus-demon-install)

(setq mm-text-html-renderer 'w3m)

(setq gnus-group-highlight
      '(((and (= unread 0) (not mailp) (eq level 1)) . gnus-group-news-1-empty-face)
	((and (not mailp) (eq level 1)) . gnus-group-news-1-face)
	((and (= unread 0) (not mailp) (eq level 2)) . gnus-group-news-2-empty-face)
	((and (not mailp) (eq level 2)) . gnus-group-news-2-face)
	((and (= unread 0) (not mailp) (eq level 3)) . gnus-group-news-3-empty-face)
	((and (not mailp) (eq level 3)) . gnus-group-news-3-face)
	((and (= unread 0) (not mailp) (eq level 4)) . gnus-group-news-4-empty-face)
	((and (not mailp) (eq level 4)) . gnus-group-news-4-face)
	((and (= unread 0) (not mailp) (eq level 5)) . gnus-group-news-5-empty-face)
	((and (not mailp) (eq level 5)) . gnus-group-news-5-face)
	((and (= unread 0) (not mailp) (eq level 6)) . gnus-group-news-6-empty-face)
	((and (not mailp) (eq level 6)) . gnus-group-news-6-face)
	((and (= unread 0) (not mailp)) . gnus-group-news-low-empty-face)
	((and (not mailp)) . gnus-group-news-low-face)
	((and (= unread 0) (eq level 1)) . gnus-group-mail-1-empty-face)
	((eq level 1) . gnus-group-mail-1-face)
	((and (= unread 0) (eq level 2)) . gnus-group-mail-2-empty-face)
	((eq level 2) . gnus-group-mail-2-face)
	((and (= unread 0) (eq level 3)) . gnus-group-mail-3-empty-face)
	((eq level 3) . gnus-group-mail-3-face)
	((= unread 0) . gnus-group-mail-low-empty-face)
	(t . gnus-group-mail-low-face)))

(defun my-setup-hl-line ()
  (hl-line-mode 1)
  (setq cursor-type nil) ; make the cursor invisible
  )

(add-hook 'gnus-summary-mode-hook 'my-setup-hl-line)
(add-hook 'gnus-group-mode-hook 'my-setup-hl-line)


;;; Supercite

(autoload 'sc-cite-original     "supercite" "Supercite 3.1" t)
(autoload 'sc-submit-bug-report "supercite" "Supercite 3.1" t)

(setq message-cite-function 'sc-cite-original)



;;; Crypto

(require 'pgg)

(autoload 'pgg-encrypt-region "pgg" "Encrypt the current region." t)
(autoload 'pgg-decrypt-region "pgg" "Decrypt the current region." t)
(autoload 'pgg-sign-region "pgg" "Sign the current region." t)
(autoload 'pgg-verify-region "pgg" "Verify the current region." t)
(autoload 'pgg-insert-key "pgg" "Insert the ASCII armored public key." t)
(autoload 'pgg-snarf-keys-region "pgg" "Import public keys in the
      current region." t)

;; verify/decrypt only if mml knows about the protocl used
(setq mm-verify-option 'known)
(setq mm-decrypt-option 'known)

;; Here we make button for the multipart
(setq gnus-buttonized-mime-types '("multipart/encrypted" "multipart/signed"))

(setq mm-verify-option 'known)
(setq mm-decrypt-option 'known)
(setq gnus-article-emulate-mime t) ; already set in my gnus but you may need it.
(setq gnus-buttonized-mime-types (append (list "multipart/signed"
	    				       "multipart/encrypted")
		    			 gnus-buttonized-mime-types))

(add-hook 'gnus-message-setup-hook 'mml-secure-message-sign-pgpmime)

;;; Misc
(require 'gnus-sum)

(autoload 'bbdb/send-hook "moy-bbdb"
  "Function to be added to `message-send-hook' to notice records when sending messages" t)

(add-hook 'message-send-hook 'bbdb/send-hook)

;; (server-start)
(calendar)
(find-file local-home-page)
