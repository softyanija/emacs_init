(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-e" 'replace-string)
(global-linum-mode t)

(setq rosdistro (getenv "ROS_DISTRO"))
;; (setq default-tab-width 4)

;; ;; Color
;; (if window-system (progn
;;     (set-background-color "Black")
;;     (set-foreground-color "LightGray")
;;     (set-cursor-color "Gray")
;;     (set-frame-parameter nil 'alpha 85) ;透明度
;;     ))

;; 透明度を変更するコマンド M-x set-alpha
;; http://qiita.com/marcy@github/items/ba0d018a03381a964f24
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))

;;警告音もフラッシュも全て無効(警告音が完全にならなくなる)
(setq ring-bell-function 'ignore)

;;背景色を変更
(set-face-background 'default "#000000")

;;テキスト色を変更
(set-face-foreground 'default "#ffffff")

;; 警告音もフラッシュも全て無効(警告音が完全に鳴らなくなるので注意)
(setq ring-bell-function 'ignore)
