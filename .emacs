;; Emacs customizations

;;------------------------------------------------------------------------------
;; Customization done via Emacs' customization UI

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;
 ;; Display
 '(inhibit-startup-screen t)
 '(column-number-mode t)
 '(blink-cursor-mode nil)
 ;;
 ;; Editing
 '(indent-tabs-mode nil)
 '(mouse-drag-copy-region t)
 ;;
 ;; Navigating
 '(scroll-conservatively 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;------------------------------------------------------------------------------
;; Useful functions

; function that prepends a given path to load-path
(defun prepend-path ( my-path )
(setq load-path (cons (expand-file-name my-path) load-path)))

; function that appends a given path to load-path
(defun append-path ( my-path )
(setq load-path (append load-path (list (expand-file-name my-path)))))


;;------------------------------------------------------------------------------
;; Extra modes

; Add my directory of extra modes and packages to the load path
(prepend-path "~/.emacs.extras")



;;------------------------------------------------------------------------------
;; Hand-written customizations

(setq visible-bell t)



;;------------------------------------------------------------------------------
;; Key bindings

(global-set-key (kbd "C-f") 'query-replace)
(global-set-key (kbd "C-S-f") 'query-replace-regexp)

; eTags
; f3 : find tag [M-.]
; f4 : find tag next [C-u M-.] 
; f2 : pop tag mark [M-*]

(defun my-find-tag-next ()
  (interactive)
  (find-tag nil t)
  )
(global-set-key [f3] 'find-tag)
(global-set-key [f4] 'my-find-tag-next)
(global-set-key [f2] 'pop-tag-mark)


; f5, f6 : go back and forth across parenthesized block
(global-set-key [f5] 'backward-sexp)
(global-set-key [f6] 'forward-sexp)

; f7 : revert buffer i.e. reload it from the file
(global-set-key [f7] 'revert-buffer)

; f8 : go to line given its number
(global-set-key [f8] 'goto-line)

; f9 : compile
(global-set-key [f9] 'compile)

; f10 : jump to next error
(global-set-key [f10] 'next-error)
