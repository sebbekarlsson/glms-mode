(setq glms-font-lock-keywords
      (let* (
            (x-keywords '("typedef" "break" "while" "for" "return" "for" "if" "else" "switch"))
            (x-types '("bool" "enum" "struct" "function" "number" "object" "string" "array" "image" "vec2" "vec3" "vec4"))
            (x-constants '("PI" "TAU" "true" "false"))
            (x-functions 
              '(
                "print"
                "cos"
                "sin"
                "tan"
                "atan"
                "fract"
                "cross"
                "dot"
                "lerp"
                "clamp"
                "max"
                "min"
                "abs"
                "distance"
                "length"
                ))

            (x-keywords-regexp (regexp-opt x-keywords 'words))
            (x-types-regexp (regexp-opt x-types 'words))
            (x-constants-regexp (regexp-opt x-constants 'words))
            (x-functions-regexp (regexp-opt x-functions 'words)))

        `(
          (,x-types-regexp . 'font-lock-type-face)
          (,x-constants-regexp . 'font-lock-constant-face)
          (,x-functions-regexp . 'font-lock-function-name-face)
          (,x-keywords-regexp . 'font-lock-keyword-face)
          )))

;;;###autoload
(define-derived-mode glms-mode c-mode "glms mode"
  "Major mode for editing GLMS"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((glms-font-lock-keywords))))

(add-to-list 'auto-mode-alist '("\\.gs\\'" . glms-mode))

(provide 'glms-mode)
