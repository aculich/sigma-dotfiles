;;; autoloads.el ---

;; Copyright (C) 2004  Free Software Foundation, Inc.

;; Author: Yann Hodique <Yann.Hodique@lifl.fr>
;; Keywords:

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

;;

;;; Code:

;;; Autoloads
(require 'perso-loaddefs)

(autoload 'css-mode "css-mode" "Major mode for editing CSS style sheets.
\\{cssm-mode-map}" t nil)
(autoload 'doxymacs-mode "doxymacs" "mode help" t nil)
(autoload 'ecb-activate "ecb" "Emacs Code Browser" t nil)
(autoload 'gnuserv-start "gnuserv-compat" "Allow this Emacs process to be a server for client processes." t)
(autoload 'guile-scheme-mode "guile-scheme" "" t nil)
(autoload 'htmlize-buffer "htmlize" "Provide an html page from the current buffer" t nil)
(autoload 'htmlize-file "htmlize" "Provide an html page from the current file" t nil)
(autoload 'htmlize-many-files "htmlize" "Provide an html page from files" t nil)
(autoload 'htmlize-many-files-dired "htmlize" "Provide an html page from files marked in dired" t nil)
(autoload 'htmlize-region "htmlize" "Provide an html page from the current region" t nil)
(autoload 'make-regexp "make-regexp" "Return a regexp to match a string item in STRINGS.")
(autoload 'make-regexps "make-regexp" "Return a regexp to REGEXPS.")
(autoload 'rpm "sb-rpm" "Rpm package listing in speedbar.")
(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
(autoload 'turn-on-eldoc-mode "eldoc" "Activate eldoc" t nil)
(autoload 'w3-speedbar-buttons "sb-w3" "s3 specific speedbar button generator.")
(autoload 'irc "erc-config" "" t nil)
(autoload 'xtla "xtla" "" t nil)

(provide 'autoloads)
;;; autoloads.el ends here
