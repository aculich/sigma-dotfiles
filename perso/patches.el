;;; patches.el --- various patches for emacs

;; Copyright (C) 2004  Free Software Foundation, Inc.

;; Author: Yann Hodique <Yann.Hodique@lifl.fr>
;; Keywords: lisp, extensions

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; Some patches I cannot live without. Fix bad default behaviors, and provide
;; missing basic features. Some code is by me, some is hacked by me, and some
;; has nothing to do with me :-)

;;; Code:

;; Use this one instead of require to ignore errors
(defun request (pack)
  "Fail to require silently"
  (condition-case nil
    (require pack)
  (error nil)))

;; make the y or n suffice for a yes or no question
(fset 'yes-or-no-p 'y-or-n-p)

(defun match-paren ()
  "Will bounce between matching parens just like % in vi"
  (interactive)
  (let ((prev-char (char-to-string (preceding-char)))
	(next-char (char-to-string (following-char))))
	(cond ((string-match "[[{(<]" next-char) (forward-sexp 1))
		  ((string-match "[\]})>]" prev-char) (backward-sexp 1))
		  (t (error "%s" "Not on a paren, brace, or bracket")))))

(global-set-key [(control =)] 'match-paren)

;; ...never switch to overwrite mode, not even accidentally
(global-set-key [insert]
  (function
   (lambda () (interactive)
     (message "Sorry, overwrite mode has been disabled forever."))))

;; disable backups for files in /tmp or in my Mail or News directories.
(defun ecm-backup-enable-predicate (filename)
  (and (not (string= "/tmp/" (substring filename 0 5)))
       (not (string-match "/mail/" filename))
       (not (string-match "/News/" filename))))

(setq backup-enable-predicate 'ecm-backup-enable-predicate)

;; Put autosaves files in a single directory too
(setq auto-save-directory (expand-file-name "~/.autosaves/"))
(require 'auto-save "auto-save.el" t)

;; Why the hell should some commands be disabled?
(setq disabled-command-hook nil)

;; scroll-margin does not work with hl-line :-(
(defvar top-margin)
(defvar bottom-margin)
(defvar buffer-no-margin-alist)

(defun check-margin ()
  (let ((window (selected-window)))
    (if (not (or (window-minibuffer-p window) (member (buffer-name (window-buffer)) buffer-no-margin-alist)))
        (let* ((position (progn (set-buffer (window-buffer)) (point)))
               (wstart (window-start))
               (wbottl (- (window-height) 2))
               (topshift (- (max 0 (min top-margin (- wbottl 1)))))
               (diff (- (min topshift (- bottom-margin wbottl)) topshift)))
          (vertical-motion topshift)
          (if (cond
               ((> wstart (point)))
               ((= wstart (point)) nil)
               ((or (= diff 0)
                    (save-restriction
                      (narrow-to-region wstart (point-max))
                      (vertical-motion diff)
                      (< wstart (point))))))
              (set-window-start window (point)))
          (goto-char position)))))

(defun set-scroll-margin (up down except)
  "Enable hacked scroll margin"
  (setq top-margin up
        bottom-margin down
        buffer-no-margin-alist except)
  (add-hook    'post-command-hook 'check-margin))

;; Color prefix in minibuffer
;; (let ((face (cdr (memq 'face minibuffer-prompt-properties))))
;;   (if face
;;       (setcar face minibuffer-face)
;;     (setq minibuffer-prompt-properties
;;           (append minibuffer-prompt-properties
;;                   (list 'face 'minibuffer-face)))))

;; Adapt open-line behavior when arg <= 0
(defadvice open-line( around open-line-around (arg) act )
  "Open new line(s) at end of line if arg is <= 0."
  (if (<= arg 0)
      (let ((var (if (equal arg 0) -1 arg)))
        (save-excursion
          (end-of-line)
          (open-line (- var))))
    ad-do-it))

;; Suppress annoying messages. Needs some work
(defadvice message (around message-around act)
  "Don't let annoying messages popup while using the minibuffer"
  (unless (minibuffer-window-active-p (minibuffer-window))
    ad-do-it))

;; Many thanks to utis (Oliver Scholz)
(defmacro defmadvice (flist spec &rest body)
  (let ((defs (mapcar
               (lambda (f) `(defadvice ,f ,(append (list (car spec) (intern (format "ad-%s-%s-%s"
                                                                                    (symbol-name f)
                                                                                    (symbol-name (cadr spec))
                                                                                    (car spec)))) (cddr spec))
                              ,@body)) flist)))
    `(progn ,@defs)))

(defmadvice (dframe-handle-make-frame-visible dframe-handle-iconify-frame dframe-handle-delete-frame)
  (around dframe act)
  "Inhibit message function"
  (flet ((message (&rest args) nil))
    ad-do-it))

(defmadvice (split-window-vertically split-window-horizontally)
  (after split act)
  "Open another buffer in the new window"
  (set-window-buffer (next-window) (other-buffer)))

;; BUFFER SWITCHING FIX
;;
;; This changes the behaviour of the switch-to-buffer completion functions so
;; that the current buffer is NOT in the completion list.
;;
;; i.e. say you're working in "temp.c", and you want to visit "temp.h"; so you
;; type "C-xb", then "t<TAB>" which then presents you with a completion list of
;; temp.c and temp.h, so you then must type "h<RET>".  This is annoying since
;; why would you want to switch back to the buffer you're in?!?
;; Using this fix would remove "temp.c" from the completion lits so that when
;; you had typed "t<TAB>" the name would be completed as "temp.h" as desired.
;;
;; Steve Dodd
;; March 1998
;; Re-hacked and dramatically packed by Yann Hodique (2004)

(defvar yh-remove-first-completion nil)

(defun yh-clean-minibuffer-completion-table ()
  "Suppress current buffer from completion list if needed"
  (when yh-remove-first-completion
    (progn (setq yh-remove-first-completion nil)
           (when (consp minibuffer-completion-table)
             (setq  minibuffer-completion-table
                    (cdr minibuffer-completion-table))))))

(defmadvice (minibuffer-complete minibuffer-complete-word minibuffer-complete-and-exit)
  (before complete act)
  "Suppress current buffer from completion list if needed"
  (yh-clean-minibuffer-completion-table))

(defadvice switch-to-buffer (before ad-switch-to-buffer-before act)
  "Activate first entry removal, in order to avoid completing the current buffer name"
  (setq yh-remove-first-completion t))

(defun yank-rpop (arg)
  (interactive "*p")
  (yank-pop (- arg)))
(global-set-key "\M-Y" 'yank-rpop)

(provide 'patches)
;;; patches.el ends here
