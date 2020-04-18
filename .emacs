;;; .emacs --- Jon Ericson's .emacs

;; Because c is too close to x.
(global-set-key "\C-x\C-c" nil)

;;; Commentary:

;; Stolen from:
;; https://sites.google.com/site/steveyegge2/effective-emacs 

;; Item 1: http://www.manicai.net/comp/swap-caps-ctrl.html

;;; Code:

;; Item 2
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)


;; Item 3
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)


;; Item 4: Use C-r and C-s for navigation

;; Item 5: Use C-x b to create a temp buffer.
;;         Kill it with C-x k
;;         Write it with C-x C-w

;; Item 6: C-x 2   (split window)
;;         C-x 3   (horizontal split)
;;         C-x +   (balance windows)
;;         C-x o   (other window)
;;         C-x 1   (1 window)
;;         C-x C-b (buffer list)

;; Item 7
;;; I can't bring myself to lose the scroll bar.
;;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Item 8: M-x describe-bindings
;;         M-x describe-key
;;         M-x apropos-command 
;;         M-x info.

;; Item 9
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)

(defalias 'qrr 'query-replace-regexp)

;; Item 10: Ctrl-x (  (Start recording)
;;          Ctrl-x )  (Stop recording)
;;          Ctrl-x e  (call-last-kbd-macro)
(global-set-key [f5] 'call-last-kbd-macro)

;;          Alt-t     (transpose-words)
;;          Ctrl-t    (transpose-chars)
;;          C-x C-t   (transpose-lines)
;;          C-M-t     (transpose-sexps)

;; Thanks Steve Yegge!


;;; Libraries

(add-to-list 'load-path "~/elisp")


(setq-default indent-tabs-mode nil)


;;;

; http://emacs.stackexchange.com/a/642/2
(desktop-save-mode 1)
(savehist-mode 1)
(add-to-list 'savehist-additional-variables 'kill-ring) 

; http://www.emacswiki.org/emacs/AlignCommands
(defun align-repeat (start end regexp)
    "Repeat alignment with respect to 
     the given regular expression."
    (interactive "r\nsAlign regexp: ")
    (align-regexp start end 
        (concat "\\(\\s-*\\)" regexp) 1 1 t))

(defun align-right (start end)
    "Repeat alignment with respect to 
     the given regular expression."
    (interactive "r")
    (align-regexp start end 
        (concat "\\(\\s-*\\)\\([^ ]+\\)") -2 0 t))

(defun align-decimal (start end)
    "Align a table of numbers on (optional) decimal points."
    (interactive "r")
    (align-regexp start end "\\(\\s-*\\)\\$?\\(\\s-+[0-9]+\\)\\.?"
                  -2 0 t))

;;; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; http://melpa.org/#/getting-started
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Spelling.html
(add-hook 'text-mode-hook 'flyspell-mode)

(provide '.emacs)

;;; .emacs ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(align-indent-before-aligning t)
 '(align-to-tab-stop nil)
 '(ispell-program-name "/usr/local/bin/aspell")
 '(newsticker-url-list
   (quote
    (("Nate Silver" "http://fivethirtyeight.com/contributors/nate-silver/feed/" nil nil nil))))
 '(metar-units
   (quote
    ((length . ft)
     (pressure . hPa)
     (speed . mph)
     (temperature . degF))))
 ;; https://www.latlong.net/place/burbank-ca-usa-6404.html
 '(calendar-latitude 34.1808)
 '(calendar-longitude -118.3090)

 '(package-selected-packages (quote (metar markdown-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
