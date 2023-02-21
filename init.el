;; 
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

;; HTTP 系のリポジトリ
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)
(load-theme 'wombat)

(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-h" 'backward-delete-char)
(global-linum-mode t)

(setq rosdistro (getenv "ROS_DISTRO"))
(add-to-list 'load-path (format "/opt/ros/%s/share/emacs/site-lisp" (or rosdistro "melodic")))
(require 'rosemacs)
(invoke-rosemacs)
(global-set-key "\C-x\C-r" ros-keymap)
(setq default-tab-width 4)

;; Color
(if window-system (progn
    (set-background-color "Black")
    (set-foreground-color "LightGray")
    (set-cursor-color "Gray")
    (set-frame-parameter nil 'alpha 85) ;透明度
    ))

;; 透明度を変更するコマンド M-x set-alpha
;; http://qiita.com/marcy@github/items/ba0d018a03381a964f24
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))

;; パスを通す
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/elpa/yasnippet-20200405.47/"))

;; 自分用・追加用テンプレート -> mysnippetに作成したテンプレートが格納される
;; (require 'yasnippet)
;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/mysnippets/snippets"
;;         "~/.emacs.d/yasnippets"
;;         ))

;; ;; 既存スニペットを挿入する
;; (define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; ;; 新規スニペットを作成するバッファを用意する
;; (define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; ;; 既存スニペットを閲覧・編集する
;; (define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;; (yas-global-mode 1)

;; (add-to-list 'load-path "/home/mech-user/.emacs.d/emacs-trr/")
;; (setq trr-japanese t) ;; uncomment this to play with Japanese mode
;; (require 'trr)

;;警告音もフラッシュも全て無効(警告音が完全にならなくなる)
(setq ring-bell-function 'ignore)

;;背景色を変更
(set-face-background 'default "#000000")

;;テキスト色を変更
(set-face-foreground 'default "#ffffff")

;; 警告音もフラッシュも全て無効(警告音が完全に鳴らなくなるので注意)
(setq ring-bell-function 'ignore)

;; INABA MODE
(define-minor-mode inaba-mode
  "Toggle font size"
  :lighter " inaba"
  (if inaba-mode
      (set-face-attribute 'default nil :font "UbuntuMono-26")
    (set-face-attribute 'default nil :font "UbuntuMono-14")))

(add-to-list 'load-path "~/guiga_ws/src/euslime")
(setq euslime-compile-path "~/.euslime_source")
(setq-default tab-width 4 indent-tabs-mode nil)

(require 'euslime-config)
(setq inferior-euslisp-program "roseus")
(slime-setup '(slime-fancy slime-banner slime-repl-ansi-color))

(setq package-check-signature nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company-irony irony company lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'python-mode-hook 'company-mode)

(require 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony)) ; backend追加

(require 'py-autopep8)
(define-key python-mode-map (kbd "C-c F") 'py-autopep8) ; バッファ全体のコード整形
(define-key python-mode-map (kbd "C-c f") 'py-autopep8-region) ; 選択リジョン内のコード整形

;; 保存時にバッファ全体を自動整形する
;;(add-hook 'before-save-hook 'py-autopep8-before-save)
