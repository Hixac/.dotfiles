
;;;###autoload
(defun hixac/tag-gen (dir)
  (interactive (list (read-directory-name "What directory? " default-directory)))
  (if (file-directory-p (concat dir ".git/"))
      (let ((default-directory dir))
        (shell-command "ctags -e -R" nil nil))
    (message "There`s not '.git' or something other"))
  )
