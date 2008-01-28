;; -*- mode: emacs-lisp; auto-compile-lisp: nil; -*-

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(1on1-*Completions*-frame-flag nil)
 '(1on1-*Help*-frame-flag nil)
 '(1on1-minibuffer-frame-alist (quote ((foreground-color . "Red") (background-color . "LightBlue") (font . "fixed") (mouse-color . "Black") (cursor-color . "Black") (menu-bar-lines) (height . 2) (icon-type) (minibuffer . only) (user-position . t) (vertical-scroll-bars) (name . "Emacs Minibuffer"))))
 '(Man-notify-method (quote bully))
 '(add-log-keep-changes-together t)
 '(ange-ftp-ftp-program-args (quote ("-i" "-n" "-g" "-v" "-u")))
 '(apropos-do-all t)
 '(apropos-sort-by-scores t)
 '(auto-insert nil)
 '(auto-insert-mode nil)
 '(auto-insert-query (quote function))
 '(auto-revert-check-vc-info t)
 '(bbdb-complete-name-allow-cycling t)
 '(bbdb-dwim-net-address-allow-redundancy t)
 '(blink-cursor-mode nil nil (frame))
 '(browse-url-browser-function (quote browse-url-firefox))
 '(browse-url-netscape-program "mozilla-firefox")
 '(c++-font-lock-extra-types (quote ("Q[a-zA-Z]*" "uint" "ulong" "string")))
 '(c-default-style (quote ((java-mode . "java") (other . "personal"))))
 '(calendar-week-start-day 1)
 '(canlock-password "86b712369f839f776688a36513969db03cf50eb2")
 '(case-fold-search t)
 '(circe-format-self-say "<{nick}> {body}")
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(compilation-read-command t)
 '(compilation-scroll-output t)
 '(compilation-window-height 10)
 '(compile-command "make")
 '(custom-file "~/.emacs-cust")
 '(default-justification (quote left))
 '(desktop-save (quote if-exists))
 '(desktop-save-mode nil nil (desktop))
 '(dired-omit-files "^\\.?#\\|^\\.$")
 '(dired-recursive-deletes (quote top))
 '(display-battery-mode nil)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(doxymacs-doxygen-style "JavaDoc")
 '(doxymacs-doxygen-tags "DOXYTAGS")
 '(ecb-auto-activate nil)
 '(ecb-auto-update-methods-after-save nil)
 '(ecb-compilation-buffer-names (quote (("*Calculator*") ("*vc*") ("*vc-diff*") ("*Backtrace*") ("*shell*") ("*compilation*") ("*bsh*") ("*grep*") ("*Compile-Log*") ("*slime-repl sbcl*"))))
 '(ecb-compile-window-height 10)
 '(ecb-compile-window-temporally-enlarge nil)
 '(ecb-directories-menu-user-extension-function (quote ignore))
 '(ecb-enlarged-compilation-window-max-height 10)
 '(ecb-eshell-auto-activate t)
 '(ecb-eshell-enlarge-when-eshell nil)
 '(ecb-eshell-enlarge-when-selecting nil)
 '(ecb-eshell-fit-window-to-command-output nil)
 '(ecb-eshell-synchronize nil)
 '(ecb-history-menu-user-extension-function (quote ignore))
 '(ecb-key-map (quote ("<f10>" (t "fh" ecb-history-filter) (t "fs" ecb-sources-filter) (t "fm" ecb-methods-filter) (t "fr" ecb-methods-filter-regexp) (t "ft" ecb-methods-filter-tagclass) (t "fc" ecb-methods-filter-current-type) (t "fp" ecb-methods-filter-protection) (t "fn" ecb-methods-filter-nofilter) (t "fl" ecb-methods-filter-delete-last) (t "ff" ecb-methods-filter-function) (t "p" ecb-nav-goto-previous) (t "n" ecb-nav-goto-next) (t "lc" ecb-change-layout) (t "lr" ecb-redraw-layout) (t "lw" ecb-toggle-ecb-windows) (t "lt" ecb-toggle-layout) (t "s" ecb-window-sync) (t "r" ecb-rebuild-methods-buffer) (t "a" ecb-toggle-auto-expand-tag-tree) (t "x" ecb-expand-methods-nodes) (t "h" ecb-show-help) (t "gl" ecb-goto-window-edit-last) (t "g1" ecb-goto-window-edit1) (t "g2" ecb-goto-window-edit2) (t "gc" ecb-goto-window-compilation) (t "gd" ecb-goto-window-directories) (t "gs" ecb-goto-window-sources) (t "gm" ecb-goto-window-methods) (t "gh" ecb-goto-window-history) (t "ga" ecb-goto-window-analyse) (t "gb" ecb-goto-window-speedbar) (t "md" ecb-maximize-window-directories) (t "ms" ecb-maximize-window-sources) (t "mm" ecb-maximize-window-methods) (t "mh" ecb-maximize-window-history) (t "ma" ecb-maximize-window-analyse) (t "mb" ecb-maximize-window-speedbar) (t "e" eshell) (t "o" ecb-toggle-scroll-other-window-scrolls-compile) (t "\\" ecb-toggle-compile-window) (t "/" ecb-toggle-compile-window-height) (t "," ecb-cycle-maximized-ecb-buffers) (t "." ecb-cycle-through-compilation-buffers))))
 '(ecb-layout-name "sigma")
 '(ecb-layout-window-sizes (quote (("sigma" (0.16666666666666666 . 0.987012987012987) (0.14855072463768115 . 0.4935064935064935) (0.14855072463768115 . 0.4935064935064935)))))
 '(ecb-major-modes-deactivate (quote (hide-all-except-activated . "\\(Info\\|custom\\)-mode")))
 '(ecb-methods-menu-user-extension-function (quote ignore))
 '(ecb-options-version "2.32")
 '(ecb-other-window-behavior (quote only-edit))
 '(ecb-sources-menu-user-extension-function (quote ignore))
 '(ecb-tip-of-the-day nil)
 '(ecb-vc-supported-backends (quote ((ecb-vc-dir-managed-by-CVS . vc-state) (ecb-vc-dir-managed-by-RCS . vc-state) (ecb-vc-dir-managed-by-SCCS . vc-state) (ecb-vc-dir-managed-by-SVN . vc-state))))
 '(enable-multibyte-characters t)
 '(enable-recursive-minibuffers t)
 '(erc-bbdb-auto-create-on-whois-p t)
 '(erc-echo-timestamps t)
 '(erc-input-line-position -2)
 '(erc-modules (quote (autojoin bbdb fill irccontrols netsplit noncommands pcomplete completion ring scrolltobottom services stamp track)))
 '(erc-track-exclude-types (quote ("JOIN" "KICK" "NICK" "PART" "QUIT" "MODE")))
 '(erc-track-shorten-start 2)
 '(erc-track-showcount t)
 '(eshell-ask-to-save-history (quote always))
 '(eshell-cmpl-cycle-completions nil)
 '(eshell-prefer-to-shell t nil (eshell))
 '(eshell-save-history-on-exit t)
 '(fill-column 79)
 '(fill-nobreak-predicate (quote (fill-french-nobreak-p fill-single-word-nobreak-p)))
 '(flyspell-default-dictionary "francais")
 '(flyspell-issue-welcome-flag nil)
 '(gc-cons-threshold 4000000)
 '(gdb-many-windows t)
 '(gdb-use-separate-io-buffer t)
 '(glasses-face (quote bold))
 '(glasses-original-separator "")
 '(glasses-separate-parentheses-p nil)
 '(glasses-separator "")
 '(global-font-lock-mode t nil (font-lock))
 '(global-hl-line-hack-mode nil)
 '(global-visible-mark-mode-exclude-alist (quote ("^\\*")))
 '(gnus-activate-level 5)
 '(gnus-cacheable-groups ".*")
 '(gnus-decay-scores "\\.ADAPT\\'")
 '(gnus-score-thread-simplify t)
 '(gnus-summary-dummy-line-format "   %(:                                                   :%) %S
")
 '(gnus-summary-gather-subject-limit (quote fuzzy))
 '(gnus-summary-ignore-duplicates t)
 '(gnus-summary-make-false-root (quote dummy))
 '(gnus-summary-mark-below -10000)
 '(gnus-uncacheable-groups nil)
 '(gnus-use-adaptive-scoring nil)
 '(graphviz-dot-preview-extension "ps")
 '(gud-chdir-before-run nil)
 '(hl-line-hack-exceptions (quote ("*eshell*" "*Calendar*")))
 '(hl-line-hack-face (quote highlight))
 '(htmlize-head-tags "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">")
 '(htmlize-html-major-mode (quote html-mode))
 '(icicle-inhibit-reminder-prompt-flag t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(indent-region-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(log-edit-common-indent -7)
 '(lui-fill-column 100)
 '(mark-diary-entries-in-calendar t)
 '(max-lisp-eval-depth 500)
 '(max-specpdl-size 1000)
 '(minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))
 '(mouse-1-click-follows-link nil)
 '(mouse-1-click-in-non-selected-windows nil)
 '(mouse-avoidance-threshold 15)
 '(mouse-drag-copy-region nil)
 '(mouse-yank-at-point t)
 '(mumamo-global-mode t)
 '(next-line-add-newlines nil)
 '(nxhtml-global-minor-mode t)
 '(nxhtml-global-validation-header-mode t)
 '(org-CUA-compatible t)
 '(org-agenda-custom-commands (quote (("x" tags-todo #("URGENT|NORMAL/NEXTACTION|WAITING" 0 32 (face org-warning)) nil) ("X" tags-todo #("URGENT/NEXTACTION|WAITING" 0 25 (face org-warning)) nil))))
 '(org-agenda-skip-archived-trees nil)
 '(org-disputed-keys (quote (([(shift up)] . [(meta p)]) ([(shift down)] . [(meta n)]) ([(shift left)] . [(meta -)]) ([(shift right)] . [(meta +)]) ([(control shift right)] . [(control meta +)]) ([(control shift left)] . [(control meta -)]))))
 '(org-export-language-setup (quote (("en" "Author" "Date" "Table of Contents") ("cs" "Autor" "Datum" "Obsah") ("da" "Ophavsmand" "Dato" "Indhold") ("de" "Autor" "Datum" "Inhaltsverzeichnis") ("es" "Autor" "Fecha" "\314ndice") ("fr" "Auteur" "Date" "Table des Matières") ("it" "Autore" "Data" "Indice") ("nl" "Auteur" "Datum" "Inhoudsopgave") ("nn" "Forfattar" "Dato" "Innhold") ("sv" "F\366rfattarens" "Datum" "Inneh\345ll"))))
 '(org-replace-disputed-keys t)
 '(org-stuck-projects (quote ("+LEVEL=2/-DONE" ("TODO" "NEXT" "NEXTACTION") ("quotes"))))
 '(osd-args (quote ("--delay=3" "--age=3" "--pos=bottom" "--offset=70" "--outline=5" "--outlinecolour=grey" "--font=-microsoft-verdana-medium-r-normal--10-*-*-*-*-*-*")))
 '(paren-dont-load-timer nil)
 '(parens-require-spaces t)
 '(partial-completion-mode t)
 '(pcomplete-autolist t)
 '(pcomplete-cycle-completions nil)
 '(planner-backend (quote muse))
 '(planner-default-page "TaskPool")
 '(planner-multi-copy-tasks-to-page "TaskPool")
 '(planner-tasks-file-behavior (quote (quote close)))
 '(planner-use-other-window nil)
 '(planner-xtla-log-edit-include-files-flag nil)
 '(planner-xtla-log-edit-notice-commit-function t)
 '(pop-up-windows t)
 '(pp^L-^L-string "          ------------------------------------------------------------          ")
 '(pp^L-^L-string-post "
")
 '(pp^L-^L-string-pre "
")
 '(pretty-control-l-mode t)
 '(preview-default-option-list (quote ("displaymath" "floats" "graphics" "textmath" "footnotes")))
 '(prolog-system (quote swi))
 '(proof-assistants (quote (isar coq acl2)))
 '(ps-lpr-command "kprinter")
 '(rcirc-fill-column 120)
 '(read-quoted-char-radix 16)
 '(recentf-exclude (quote (":\\|#")))
 '(recentf-mode t)
 '(recentf-save-file "~/.emacs-recentf")
 '(reftex-auto-recenter-toc t)
 '(reftex-revisit-to-follow t)
 '(reftex-toc-split-windows-horizontally nil)
 '(safe-local-variable-values (quote ((folded-file . t) (TeX-master . main\.tex) (Package . Memoization) (Base . 10) (Syntax . Common-Lisp) (unibyte . t) (auto-recompile . t) (TeX-master . "main") (TeX-master . t) (auto-compile-lisp))))
 '(save-abbrevs (quote silently))
 '(save-place-limit 100)
 '(sawfish-extra-keyword-list (quote ("add-frame-style" "call-after-load" "call-after-property-changed" "call-after-state-changed" "custom-set-property" "define" "define-structure" "export" "open")))
 '(sawfish-warning-keyword-list (quote ("fixme" "FIXME" "Fixme" "fix me" "Fix me" "!!!" "Grrr" "Bummer" "todo" "TODO" "Todo")))
 '(scroll-bar-mode nil)
 '(search-whitespace-regexp "[ 	
]+")
 '(set-mark-command-repeat-pop t)
 '(sh-shell-file "/bin/bash")
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(slime-complete-symbol*-fancy t)
 '(slime-display-compilation-output nil)
 '(slime-header-line-p nil)
 '(slime-kill-without-query-p t)
 '(speedbar-frame-parameters (quote ((width . 20) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t))))
 '(speedbar-use-images nil)
 '(tabbar-inhibit-functions (quote (tabbar-default-inhibit-function yh/tabbar-inhibit-function)))
 '(tc-make-attribution (quote kai-tc-simple-attribution))
 '(tc-mouse-overlays t)
 '(temp-buffer-resize-mode t)
 '(tempo-insert-region nil)
 '(tempo-interactive t)
 '(tla-arch-branch (quote baz))
 '(tool-bar-mode nil nil (tool-bar))
 '(tooltip-frame-parameters (quote ((name . "tooltip") (internal-border-width . 1) (border-width . 0))))
 '(tooltip-gud-tips-p t)
 '(tramp-default-method-alist (quote (("%" "" "smb") ("" "\\`\\(anonymous\\|ftp\\)\\'" "ftp") ("\\`ftp" "" "ftp") ("\\`localhost\\'" "\\`root\\'" "su"))))
 '(truncate-partial-width-windows nil)
 '(type-break-good-rest-interval 300)
 '(type-break-interval 5400)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(uniquify-strip-common-suffix t)
 '(vc-follow-symlinks t)
 '(vc-handled-backends nil)
 '(vc-make-backup-files t)
 '(view-diary-entries-initially t)
 '(visible-bell t)
 '(w3m-icon-directory "~/.emacs.d/emacs-w3m/icons")
 '(wdired-allow-to-change-permissions (quote advanced))
 '(which-function-mode nil)
 '(winring-show-names t)
 '(x-select-enable-clipboard nil))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(bold ((t (:foreground "lightcoral" :weight bold))))
 '(bold-italic ((t (:foreground "orange" :slant italic :weight bold))))
 '(circe-my-message-face ((t (:background "slateblue"))))
 '(circe-originator-face ((t (:weight bold))))
 '(cparen-around-andor-face ((t (:foreground "red" :weight bold))))
 '(cparen-around-begin-face ((t (:foreground "red"))))
 '(cparen-around-define-face ((t (:foreground "lightblue" :weight bold))))
 '(cparen-around-quote-face ((t (:foreground "brown"))))
 '(cursor ((t (:background "yellow"))))
 '(dircolors-face-objet ((t (:foreground "Gray"))) t)
 '(ecb-default-highlight-face ((((class color) (background dark)) (:inherit ecb-default-general-face :background "slateblue"))))
 '(ecb-directory-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face))))
 '(ecb-history-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face))))
 '(ecb-method-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face))))
 '(ecb-source-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face))))
 '(ecb-token-header-face ((((class color) (background dark)) (:background "SeaGreen4"))))
 '(erc-direct-msg-face ((t (:foreground "cyan"))))
 '(erc-input-face ((t (:foreground "red" :weight bold))))
 '(erc-keyword-face ((t (:foreground "green" :weight bold))))
 '(font-latex-bold-face ((t (:inherit bold))))
 '(font-latex-italic-face ((t (:inherit italic))))
 '(font-latex-math-face ((((class color) (background dark)) (:inherit font-lock-number-face))))
 '(font-latex-string-face ((((class color) (background dark)) (:inherit font-lock-string-face))))
 '(font-latex-verbatim-face ((((class color) (background dark)) (:foreground "burlywood"))))
 '(font-lock-builtin-face ((((class color) (background dark)) (:foreground "lightsteelblue"))))
 '(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face)) (((class color) (min-colors 16)) (:foreground "red"))))
 '(font-lock-comment-face ((t (:foreground "gray"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-floatnumber-face ((((class color) (background dark)) (:foreground "yellow4"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "lightblue2"))))
 '(font-lock-hexnumber-face ((((class color) (background dark)) (:foreground "cyan"))))
 '(font-lock-keys-face ((((class color) (background dark)) (:foreground "yellow" :weight bold))))
 '(font-lock-number-face ((t (:foreground "yellow3"))))
 '(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face :weight bold))))
 '(font-lock-pvs-function-type-face ((t (:foreground "blue"))) t)
 '(font-lock-pvs-parens-face ((t (:foreground "yellow"))) t)
 '(font-lock-pvs-record-parens-face ((t (:foreground "red"))) t)
 '(font-lock-pvs-set-brace-face ((t (:foreground "darkred"))) t)
 '(font-lock-pvs-table-face ((t (:foreground "black"))) t)
 '(font-lock-qt-face ((((class color) (background dark)) (:foreground "green2" :weight bold))))
 '(font-lock-string-face ((((class color) (background dark)) (:foreground "green3"))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background dark)) (:foreground "PaleGreen" :weight bold))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "LightSkyBlue"))))
 '(gnus-group-mail-low-empty-face ((((class color) (background dark)) (:foreground "aquamarine3"))) t)
 '(gnus-group-mail-low-face ((t (:foreground "aquamarine3" :weight bold))) t)
 '(gnus-header-content-face ((t (:foreground "green" :slant italic))) t)
 '(gnus-header-name ((((class color) (background dark)) (:inherit message-header-name))))
 '(gnus-header-name-face ((((class color) (background dark)) (:foreground "LightGreen"))) t)
 '(highlight ((((class color) (background dark) (type x)) (:background "#223939"))))
 '(hl-sexp-face ((((class color) (background dark)) (:inherit highlight))))
 '(icicle-Completions-instruction-1 ((t (:foreground "lightblue"))))
 '(icicle-prompt-suffix ((((type x w32 mac) (class color)) (:foreground "dark blue"))))
 '(italic ((t (:foreground "Orchid" :slant italic))))
 '(lui-irc-colors-fg-1-face ((t (:foreground "darkgray"))))
 '(lui-irc-colors-fg-10-face ((((class color)) (:foreground "cyan3"))))
 '(lui-irc-colors-fg-12-face ((((class color)) (:foreground "lightblue"))))
 '(lui-irc-colors-fg-14-face ((((class color)) (:foreground "gray"))))
 '(lui-irc-colors-fg-2-face ((((class color)) (:foreground "cyan3"))))
 '(lui-irc-colors-fg-3-face ((t (:foreground "green2"))))
 '(lui-irc-colors-fg-4-face ((((class color)) (:foreground "orange"))))
 '(lui-irc-colors-fg-6-face ((((class color)) (:foreground "magenta"))))
 '(menu ((((type x-toolkit)) (:background "lightgrey" :foreground "black" :box (:line-width 1 :style released-button)))))
 '(message-header-name ((((class color) (background dark)) (:inherit highlight :foreground "LightGreen"))))
 '(message-header-name-face ((((class color) (background dark)) (:foreground "green3"))) t)
 '(message-header-other ((((class color) (background dark)) (:foreground "#ffaf00"))))
 '(message-header-other-face ((((class color) (background dark)) (:foreground "#dd0000"))) t)
 '(message-separator ((((class color) (background dark)) (:inherit highlight :foreground "lightblue"))))
 '(mmm-code-submode-face ((t (:background "darkgreen"))))
 '(mmm-default-submode-face ((t (:background "black"))))
 '(mode-line ((t (:background "lightgrey" :foreground "black" :box (:line-width 1 :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey30" :foreground "grey80" :box (:line-width -1 :color "grey40") :weight light))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) (:background "gray28"))))
 '(muse-header-1 ((t (:foreground "green" :weight bold))))
 '(muse-header-2 ((t (:foreground "lightblue" :weight bold))))
 '(muse-header-3 ((t (:foreground "grey" :weight bold))))
 '(muse-header-4 ((t (:weight bold))))
 '(org-done ((t (:background "green4" :foreground "yellow" :weight bold))))
 '(org-hide ((((background dark)) (:foreground "gray23"))))
 '(org-todo ((t (:background "red" :foreground "yellow" :weight bold))))
 '(planner-note-headline-face ((t (:foreground "turquoise" :weight bold))))
 '(pp^L-highlight ((((type x w32 mac graphic) (class color)) (:foreground "red" :box (:line-width 3 :style pressed-button) :weight bold))))
 '(region ((t (:background "#3b6363"))))
 '(show-paren-match ((t (:background "black" :foreground "red" :weight bold))))
 '(show-paren-mismatch ((t (:background "magenta" :foreground "white" :weight bold))))
 '(tabbar-selected-face ((t (:inherit tabbar-default-face :foreground "blue" :box (:line-width 2 :color "white" :style pressed-button)))))
 '(tabbar-unselected-face ((t (:inherit tabbar-default-face :box (:line-width 2 :color "white" :style released-button)))))
 '(underline ((t (:foreground "seagreen3" :underline t))))
 '(variable-pitch ((t (:family "nimbus"))))
 '(w3-style-face-00001 ((t (:underline nil :weight normal :height 150))))
 '(w3-style-face-00002 ((t (:underline nil))))
 '(w3-style-face-00003 ((t (:underline nil :weight normal :height 150))))
 '(w3-style-face-00004 ((t (:underline nil :weight normal :height 150))))
 '(w3-style-face-00005 ((t (:underline nil :height 150))))
 '(w3-style-face-00007 ((t (:underline nil :height 150))))
 '(w3-style-face-00008 ((t (:underline nil :weight normal :height 150)))))
