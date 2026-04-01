;;; abyssal-terra-theme.el --- Abyssal Terra color theme -*- lexical-binding: t -*-

;; Author: Rakis
;; Version: 1.0.0
;; Keywords: faces, theme
;; URL: https://github.com/rakis/abyssal-terra-theme

;;; Commentary:
;; A dark theme inspired by deep ocean floors and scorched earth.
;; Palette derived from #060C14 #7992BE #613415 #B39089 #EEEFE1

;;; Code:

(deftheme abyssal-terra "Abyssal Terra — deep ocean meets scorched earth.")

(let ((mainbg       "#060C14")
      (mainbg2      "#0C1620")
      (mainbg3      "#0F1E2E")
      (mainfg       "#EEEFE1")
      (builtin      "#A8C4E8")
      (keyword      "#B39089")
      (string       "#C8A882")
      (functionname "#7992BE")
      (variable     "#C8C9B8")
      (type         "#8FB3D4")
      (constant     "#D4B896")
      (comment      "#3D556E")
      (selection    "#1A3A5C")
      (warning      "#C8956A")
      (warning2     "#A04030")
      (linehl       "#0D1A28")
      (border       "#162030")
      (gutter       "#1A2B3C"))

  (custom-theme-set-faces
   'abyssal-terra

   ;; ─── Core ──────────────────────────────────────────────────────────────────
   `(default                        ((t (:background ,mainbg :foreground ,mainfg))))
   `(cursor                         ((t (:background ,keyword))))
   `(fringe                         ((t (:background ,mainbg2 :foreground ,comment))))
   `(vertical-border                ((t (:foreground ,border))))
   `(window-divider                 ((t (:foreground ,border))))
   `(hl-line                        ((t (:background ,linehl))))
   `(region                         ((t (:background ,selection))))
   `(secondary-selection            ((t (:background ,mainbg3))))
   `(highlight                      ((t (:background ,mainbg3))))
   `(match                          ((t (:background ,selection :foreground ,mainfg :weight bold))))
   `(trailing-whitespace            ((t (:background ,warning2))))
   `(show-paren-match               ((t (:background ,selection :foreground ,builtin :weight bold))))
   `(show-paren-mismatch            ((t (:background ,warning2 :foreground ,mainfg :weight bold))))

   ;; ─── Line numbers ──────────────────────────────────────────────────────────
   `(line-number                    ((t (:background ,mainbg2 :foreground ,comment))))
   `(line-number-current-line       ((t (:background ,mainbg2 :foreground ,functionname :weight bold))))

   ;; ─── Minibuffer / echo ─────────────────────────────────────────────────────
   `(minibuffer-prompt              ((t (:foreground ,functionname :weight bold))))

   ;; ─── Font lock ─────────────────────────────────────────────────────────────
   `(font-lock-builtin-face         ((t (:foreground ,builtin))))
   `(font-lock-comment-face         ((t (:foreground ,comment :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comment :slant italic))))
   `(font-lock-constant-face        ((t (:foreground ,constant))))
   `(font-lock-doc-face             ((t (:foreground ,comment :slant italic))))
   `(font-lock-function-name-face   ((t (:foreground ,functionname))))
   `(font-lock-keyword-face         ((t (:foreground ,keyword))))
   `(font-lock-negation-char-face   ((t (:foreground ,warning))))
   `(font-lock-preprocessor-face    ((t (:foreground ,builtin))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,string))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,string))))
   `(font-lock-string-face          ((t (:foreground ,string))))
   `(font-lock-type-face            ((t (:foreground ,type))))
   `(font-lock-variable-name-face   ((t (:foreground ,variable))))
   `(font-lock-warning-face         ((t (:foreground ,warning :underline (:style wave)))))

   ;; ─── Mode line ─────────────────────────────────────────────────────────────
   `(mode-line                      ((t (:background ,functionname :foreground ,mainbg :box nil))))
   `(mode-line-inactive             ((t (:background ,mainbg2 :foreground ,comment :box nil))))
   `(mode-line-buffer-id            ((t (:foreground ,mainbg :weight bold))))
   `(mode-line-emphasis             ((t (:foreground ,mainbg :weight bold))))
   `(mode-line-highlight            ((t (:foreground ,constant))))

   ;; ─── Search / isearch ──────────────────────────────────────────────────────
   `(isearch                        ((t (:background ,functionname :foreground ,mainbg :weight bold))))
   `(isearch-fail                   ((t (:background ,warning2 :foreground ,mainfg))))
   `(lazy-highlight                 ((t (:background ,selection :foreground ,mainfg))))
   `(query-replace                  ((t (:background ,warning :foreground ,mainbg))))

   ;; ─── Errors & warnings ─────────────────────────────────────────────────────
   `(error                          ((t (:foreground ,warning2 :weight bold))))
   `(warning                        ((t (:foreground ,warning))))
   `(success                        ((t (:foreground ,builtin))))
   `(compilation-error              ((t (:foreground ,warning2))))
   `(compilation-warning            ((t (:foreground ,warning))))
   `(compilation-info               ((t (:foreground ,builtin))))

   ;; ─── Flymake / Flycheck ────────────────────────────────────────────────────
   `(flymake-error                  ((t (:underline (:style wave :color ,warning2)))))
   `(flymake-warning                ((t (:underline (:style wave :color ,warning)))))
   `(flymake-note                   ((t (:underline (:style wave :color ,comment)))))
   `(flycheck-error                 ((t (:underline (:style wave :color ,warning2)))))
   `(flycheck-warning               ((t (:underline (:style wave :color ,warning)))))
   `(flycheck-info                  ((t (:underline (:style wave :color ,comment)))))

   ;; ─── LSP / Eglot ───────────────────────────────────────────────────────────
   `(eglot-highlight-symbol-face    ((t (:background ,selection))))
   `(eglot-diagnostic-tag-unnecessary-face ((t (:foreground ,comment :slant italic))))

   ;; ─── Tree-sitter ───────────────────────────────────────────────────────────
   `(tree-sitter-hl-face:function           ((t (:foreground ,functionname))))
   `(tree-sitter-hl-face:function.call      ((t (:foreground ,functionname))))
   `(tree-sitter-hl-face:method             ((t (:foreground ,functionname))))
   `(tree-sitter-hl-face:method.call        ((t (:foreground ,functionname))))
   `(tree-sitter-hl-face:variable           ((t (:foreground ,variable))))
   `(tree-sitter-hl-face:variable.parameter ((t (:foreground ,variable :slant italic))))
   `(tree-sitter-hl-face:type               ((t (:foreground ,type))))
   `(tree-sitter-hl-face:keyword            ((t (:foreground ,keyword))))
   `(tree-sitter-hl-face:string             ((t (:foreground ,string))))
   `(tree-sitter-hl-face:number             ((t (:foreground ,constant))))
   `(tree-sitter-hl-face:constant           ((t (:foreground ,constant))))
   `(tree-sitter-hl-face:comment            ((t (:foreground ,comment :slant italic))))
   `(tree-sitter-hl-face:operator           ((t (:foreground ,keyword))))
   `(tree-sitter-hl-face:punctuation        ((t (:foreground ,mainfg))))

   ;; ─── Org mode ──────────────────────────────────────────────────────────────
   `(org-level-1                    ((t (:foreground ,functionname :weight bold :height 1.2))))
   `(org-level-2                    ((t (:foreground ,type :weight bold :height 1.1))))
   `(org-level-3                    ((t (:foreground ,builtin :weight bold))))
   `(org-level-4                    ((t (:foreground ,keyword))))
   `(org-level-5                    ((t (:foreground ,variable))))
   `(org-level-6                    ((t (:foreground ,constant))))
   `(org-level-7                    ((t (:foreground ,string))))
   `(org-level-8                    ((t (:foreground ,comment))))
   `(org-block                      ((t (:background ,mainbg2 :extend t))))
   `(org-block-begin-line           ((t (:background ,mainbg2 :foreground ,comment :slant italic :extend t))))
   `(org-block-end-line             ((t (:background ,mainbg2 :foreground ,comment :slant italic :extend t))))
   `(org-code                       ((t (:foreground ,string :background ,mainbg2))))
   `(org-verbatim                   ((t (:foreground ,builtin))))
   `(org-link                       ((t (:foreground ,functionname :underline t))))
   `(org-date                       ((t (:foreground ,type))))
   `(org-todo                       ((t (:foreground ,warning :weight bold))))
   `(org-done                       ((t (:foreground ,comment :weight bold :strike-through t))))
   `(org-headline-done              ((t (:foreground ,comment :strike-through t))))
   `(org-tag                        ((t (:foreground ,comment :slant italic))))
   `(org-special-keyword            ((t (:foreground ,keyword))))
   `(org-drawer                     ((t (:foreground ,comment))))
   `(org-table                      ((t (:foreground ,variable))))

   ;; ─── Markdown ──────────────────────────────────────────────────────────────
   `(markdown-header-face-1         ((t (:foreground ,functionname :weight bold :height 1.2))))
   `(markdown-header-face-2         ((t (:foreground ,type :weight bold :height 1.1))))
   `(markdown-header-face-3         ((t (:foreground ,builtin :weight bold))))
   `(markdown-code-face             ((t (:background ,mainbg2 :extend t))))
   `(markdown-inline-code-face      ((t (:foreground ,string :background ,mainbg2))))
   `(markdown-link-face             ((t (:foreground ,functionname))))
   `(markdown-url-face              ((t (:foreground ,type :underline t))))
   `(markdown-bold-face             ((t (:weight bold))))
   `(markdown-italic-face           ((t (:slant italic))))

   ;; ─── Completion (corfu / vertico / company) ────────────────────────────────
   `(corfu-default                  ((t (:background ,mainbg2 :foreground ,mainfg))))
   `(corfu-current                  ((t (:background ,selection :foreground ,mainfg))))
   `(corfu-border                   ((t (:background ,border))))
   `(corfu-bar                      ((t (:background ,functionname))))
   `(company-tooltip                ((t (:background ,mainbg2 :foreground ,mainfg))))
   `(company-tooltip-selection      ((t (:background ,selection))))
   `(company-tooltip-common         ((t (:foreground ,functionname :weight bold))))
   `(company-tooltip-annotation     ((t (:foreground ,comment))))
   `(company-scrollbar-bg           ((t (:background ,mainbg3))))
   `(company-scrollbar-fg           ((t (:background ,functionname))))
   `(vertico-current                ((t (:background ,selection))))

   ;; ─── Ivy / Counsel / Helm ──────────────────────────────────────────────────
   `(ivy-current-match              ((t (:background ,selection :foreground ,mainfg))))
   `(ivy-minibuffer-match-face-1    ((t (:foreground ,functionname :weight bold))))
   `(ivy-minibuffer-match-face-2    ((t (:foreground ,type))))
   `(ivy-minibuffer-match-face-3    ((t (:foreground ,builtin))))
   `(ivy-minibuffer-match-face-4    ((t (:foreground ,string))))
   `(helm-selection                 ((t (:background ,selection))))
   `(helm-match                     ((t (:foreground ,functionname :weight bold))))

   ;; ─── Dired ─────────────────────────────────────────────────────────────────
   `(dired-directory                ((t (:foreground ,functionname :weight bold))))
   `(dired-symlink                  ((t (:foreground ,builtin))))
   `(dired-marked                   ((t (:foreground ,warning :weight bold))))
   `(dired-flagged                  ((t (:foreground ,warning2 :weight bold))))
   `(dired-header                   ((t (:foreground ,type :weight bold))))

   ;; ─── Magit ─────────────────────────────────────────────────────────────────
   `(magit-section-heading          ((t (:foreground ,functionname :weight bold))))
   `(magit-section-highlight        ((t (:background ,mainbg2))))
   `(magit-diff-added               ((t (:background "#0A2010" :foreground "#7AAB7A"))))
   `(magit-diff-removed             ((t (:background "#200A0A" :foreground ,warning2))))
   `(magit-diff-added-highlight     ((t (:background "#0D2A15" :foreground "#8FC48F"))))
   `(magit-diff-removed-highlight   ((t (:background "#2A0D0D" :foreground ,warning))))
   `(magit-diff-context-highlight   ((t (:background ,mainbg2 :foreground ,mainfg))))
   `(magit-diff-hunk-heading        ((t (:background ,mainbg3 :foreground ,comment))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,mainbg3 :foreground ,type))))
   `(magit-branch-local             ((t (:foreground ,builtin))))
   `(magit-branch-remote            ((t (:foreground ,string))))
   `(magit-tag                      ((t (:foreground ,constant))))
   `(magit-hash                     ((t (:foreground ,comment))))
   `(magit-log-author               ((t (:foreground ,keyword))))
   `(magit-log-date                 ((t (:foreground ,comment))))

   ;; ─── Evil ──────────────────────────────────────────────────────────────────
   `(evil-ex-lazy-highlight         ((t (:background ,selection))))
   `(evil-ex-search                 ((t (:background ,functionname :foreground ,mainbg))))

   ;; ─── Whitespace ────────────────────────────────────────────────────────────
   `(whitespace-space               ((t (:foreground ,border))))
   `(whitespace-tab                 ((t (:foreground ,border))))
   `(whitespace-newline             ((t (:foreground ,border))))
   `(whitespace-trailing            ((t (:background ,warning2))))

   ;; ─── Treemacs / neotree ────────────────────────────────────────────────────
   `(treemacs-directory-face        ((t (:foreground ,functionname))))
   `(treemacs-file-face             ((t (:foreground ,mainfg))))
   `(treemacs-root-face             ((t (:foreground ,type :weight bold :height 1.1))))
   `(treemacs-git-modified-face     ((t (:foreground ,warning))))
   `(treemacs-git-added-face        ((t (:foreground ,builtin))))
   `(treemacs-git-conflict-face     ((t (:foreground ,warning2))))
   `(neo-dir-link-face              ((t (:foreground ,functionname))))
   `(neo-file-link-face             ((t (:foreground ,mainfg))))
   `(neo-root-dir-face              ((t (:foreground ,type :weight bold))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'abyssal-terra)

;;; abyssal-terra-theme.el ends here
