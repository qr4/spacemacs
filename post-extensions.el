(defvar syl:post-extensions
  '(
    auto-close-parens
    auto-highlight-symbol-mode
    centered-cursor
    dos
    edts
    elixir
    evil-plugins
    mu4e
    nose
    o-blog
    pylookup
    revive
    solarized-theme
    ))

;; load extensions
(dolist (ext syl:post-extensions)
  (add-to-list 'load-path (format "%s%s/" user-extensions-directory ext)))

;; initialize extensions
(setq syl:extension-init-dir (concat user-emacs-directory "init-extension/"))
(message (format "initializing extensions out of %s" syl:extension-init-dir))
(dolist (ext syl:post-extensions)
    (let* ((initfile (concat syl:extension-init-dir (format "init-%s.el" ext))))
      (if (file-exists-p initfile)
          (progn (load initfile)
                 (message (format "loaded %s" initfile))))))

(provide 'post-extensions)
