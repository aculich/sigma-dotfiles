;; -*-Emacs-Lisp-*- 
;; gnus.el version 0.2
;; NBC - chuche@soda.teaser.fr
;; http://www.teaser.fr/~nchuche/gnus/
;; 
;; insertion d'une signature al�atoire.
;; 
;; fortement inspir� du code de Jack Vinson <jvinson@cheux.ecs.umass.edu> 
;; trouv� dans la FAQ gnus.
;;
;; ATTENTION, ce programme ne marchera pas avec un emacs < 20.3 � cause 
;; de la fonction 'assoc-default'.
;; Si vous voulez faire des signatures al�atoires avec votre vieil emacs,
;; utilisez le programme sig.oldemacs.el trouvable au m�me endroit.
;;
;; mode d'emploi :
;;
;; 1 - Soit vous l'ajoutez directement � la fin de votre .gnus
;;     soit vous le chargez depuis votre .gnus grace � une instruction du type :
;;        (load "~/.elisp/gnus/sig.el")
;;     Si vous avez r�cup�r� mon .gnus, vous n'avez rien � faire sauf � aller 
;;     dedans et � remplacer la ligne
;;          (setq nbc-sig nil)
;;         par 
;;          (setq nbc-sig t)
;;     est d�j� charg� tout � la fin.
;; 2 - Vous cr�ez un r�pertoire .sig directement dans votre homedir
;; 3 - Vous cr�ez les r�pertoires pour les diff�rents groupes avec les 
;;     signatures que vous voulez et remplissez la alist nomm�e nbc-sig-dir.
;; 4 - et enfin, vous mettez les signatures que vous voulez dans les r�pertoires 
;;     ad�quats dans des fichiers commen�ant comme la variable nbc-signature-base.
;;     exemple, chez moi, mon r�pertoire .sig contient :
;;       [nc@soda nc]$ cd ; tree .sig
;;       .sig
;;       |-- fmbd
;;       |   |-- sig1
;;       |   `-- sig2
;;       |-- mail
;;       |   |-- sig1
;;       |   `-- sig2
;;       |-- sig1
;;       |-- sig2
;;       `-- sig3


;; *********************
;; les variables � modifier
;; *********************

;; la alist (liste associ�e) mettant en correspondance une regexp et le r�pertoire
;; ou sont stock�s les signatures des groupes v�rifiant la regexp
(defvar nbc-sig-group
      '(("dino" . "fmbd")		; les groupes v�rifiant la regexp dino auront
					; une signature dans .sig/fmbd/
	("nnml" . "mail")		; les groupes v�rifiant la regexp nnml auront 
					; une signature dans .sig/mail
	;; ne pas enlever, r�pertoire par d�faut des signatures
	(".*" . "")))			; les autres auront une signature dans .sig

;; le r�pertoire ou sont plac�s vos signatures
(defvar nbc-signature-dir   "~/.sig/")
;; le d�but du nom des fichiers de signatures
(defvar nbc-signature-base  "sig")

;; *********************
;; le corps de sig.el que vous n'avez, normalement, pas � modifier
;; *********************

;; la d�finition du test de 'assoc-default'
(defvar nbc-assoc-default-test 'string-match)
;; on d�finit la variable nbc-sig-dir sinon le defadvice hurle � la mort
(defvar nbc-sig-dir "")

;; la fonction qui est ajout�e a la fonction message-insert-signature
(defadvice message-insert-signature (before random-mail-sig-ag act comp)
  "Change the value of message-signature-file each time
`message-insert-signature' is called."
  ;; le chemin complet du r�pertoire des signatures pour le groupe actuel
  (let* ((group (or gnus-newsgroup-name ""))
	(nbc-sig-dir (concat nbc-signature-dir
			     (assoc-default group nbc-sig-group nbc-assoc-default-test)
			     "/")))
    (let* ((files (file-name-all-completions
		  nbc-signature-base (expand-file-name nbc-sig-dir))))
      (if files (let ((file (nth (random (length files)) files)))
		  (setq message-signature-file (concat nbc-sig-dir file))
		  )))))