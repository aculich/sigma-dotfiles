;;; visual.el --- visual settings

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

;;;;;;;;;;;;
;; Visuals
;;

;; New faces
(defvar font-lock-escape-char-face 'font-lock-escape-char-face)
(defvar font-lock-number-face 'font-lock-number-face)
(defvar font-lock-hexnumber-face 'font-lock-hexnumber-face)
(defvar font-lock-floatnumber-face 'font-lock-floatnumber-face)
(defvar font-lock-keys-face 'font-lock-keys-face)
(defvar font-lock-qt-face 'font-lock-qt-face)

(defface font-lock-escape-char-face
  '((((class color)) (:foreground "seagreen2")))
  "highlight c escapes char like vim"
  :group 'font-lock-faces)

(defface font-lock-number-face
  '(
    (((class grayscale) (background light)) (:foreground "LightGray" :bold t))
    (((class grayscale) (background dark)) (:foreground "DimGray" :bold t))
    (((class color) (background light)) (:background "hotpink"))
    (((class color) (background dark)) (:foreground "yellow3" :background "hotpink"))
    (t (:italic t)))
  "blah"
  :group 'font-lock-highlighting-faces)

(defface font-lock-hexnumber-face
  '(
    (((class grayscale) (background light)) (:foreground "LightGray" :bold t))
    (((class grayscale) (background dark)) (:foreground "DimGray" :bold t))
    (((class color) (background light)) (:background "darkblue"))
    (((class color) (background dark)) (:foreground "black" :background "darkblue"))
    (t (:italic t)))
  "blah"
  :group 'font-lock-highlighting-faces)

(defface font-lock-floatnumber-face
  '(
    (((class grayscale) (background light)) (:foreground "LightGray" :bold t))
    (((class grayscale) (background dark)) (:foreground "DimGray" :bold t))
    (((class color) (background light)) (:background "darkgreen"))
    (((class color) (background dark)) (:foreground "black" :background "darkgreen"))
    (t (:italic t)))
  "blah"
  :group 'font-lock-highlighting-faces)

(defface font-lock-keys-face
  '(
    (((class grayscale) (background light)) (:foreground "LightGray" :bold t))
    (((class grayscale) (background dark)) (:foreground "DimGray" :bold t))
    (((class color) (background light)) (:background "yellow"))
    (((class color) (background dark)) (:foreground "yellow"))
    (t (:italic t)))
  "blah"
  :group 'font-lock-highlighting-faces)

(defface font-lock-qt-face
  '(
    (((class grayscale) (background light)) (:foreground "LightGray" :bold t))
    (((class grayscale) (background dark)) (:foreground "DimGray" :bold t))
    (((class color) (background light)) (:background "brown"))
    (((class color) (background dark)) (:foreground "green" :background "brown"))
    (t (:italic t)))
  "blah"
  :group 'font-lock-highlighting-faces)

(unless (facep 'minibuffer-prompt)
  (defvar minibuffer-face 'minibuffer-face)
  (defface minibuffer-face '((t (:bold t :foreground "LightBlue")))
    "Face used to color the minibuffer."))

(require 'jit-lock)
(setq font-lock-support-mode 'jit-lock-mode)
(setq jit-lock-stealth-time 1)

;; Frame appearence
(setq default-frame-alist '((left-fringe)
                            (right-fringe)
                            (menu-bar-lines . 0)
                            (vertical-scroll-bars)
                            (tool-bar-lines . 0)))

(setq window-system-default-frame-alist
      '((x (width . 100)
           (height . 50)
           (foreground-color . "wheat")
           (background-color . "darkslategray")
           (cursor-color . "yellow")
           )))

(if (> emacs-major-version 20) (custom-set-variables '(tool-bar-mode nil nil (tool-bar))))
(if (> emacs-major-version 20) (set-scroll-bar-mode nil))
(menu-bar-mode -1)

(setq-default even-window-heights nil
              resize-mini-windows nil)

;; Window Fringes
(require 'fringe)
(setq default-indicate-buffer-boundaries 'left) ; Indicate the
(setq default-indicate-empty-lines t)           ; Display an in
(fringe-mode 'default)

(provide 'visual)
;;; visual.el ends here
