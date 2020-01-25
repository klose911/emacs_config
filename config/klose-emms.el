(require 'emms-setup)
(require 'emms-info-libtag)
(emms-standard)

;; (if *win* 
;;     (progn 
;;       (add-to-list 'exec-path "d:/utils/mplayer/") 
;;       (emms-default-players))  
;;   (setq emms-player-mpg321-command-name "mpg123" 
;; 	emms-player-list '(emms-player-mpg321 
;; 			   emms-player-mplayer 
;; 			   emms-player-mplayer-playlist)))

(setq emms-player-mpg321-command-name "mpg123" 
	emms-player-list '(emms-player-mpg321 
			   emms-player-mplayer 
			   emms-player-mplayer-playlist))

(setq emms-source-file-default-directory
      (if *win* "d:/My Documents/My Music" "~/Music"))

(require 'emms-score)
(emms-score 1)
;;autodetect musci files id3 tags encodeing
(require 'emms-i18n)
;; auto-save and import last playlist
(require 'emms-history)
;;set default play directory 
;;(setq emms-source-file-default-directory "~/Music")

;; global key-map
;; all global keys prefix is C-c e
;; compatible with emms-playlist mode keybindings
;; you can view emms-playlist-mode.el to get details about 
;; emms-playlist mode keys map
(global-set-key (kbd "C-c e s") 'emms-stop)
(global-set-key (kbd "C-c e P") 'emms-pause)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e f") 'emms-show)
(global-set-key (kbd "C-c e >") 'emms-seek-forward)
(global-set-key (kbd "C-c e <") 'emms-seek-backward)
;; these keys maps were derivations of above keybindings
(global-set-key (kbd "C-c e S") 'emms-start)
(global-set-key (kbd "C-c e g") 'emms-playlist-mode-go)
(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e h") 'emms-shuffle)
(global-set-key (kbd "C-c e e") 'emms-play-file)
(global-set-key (kbd "C-c e l") 'emms-play-playlist)
(global-set-key (kbd "C-c e r") 'emms-toggle-repeat-track)
(global-set-key (kbd "C-c e R") 'emms-toggle-repeat-playlist)
(global-set-key (kbd "C-c e u") 'emms-score-up-playing)
(global-set-key (kbd "C-c e d") 'emms-score-down-playing)
(global-set-key (kbd "C-c e o") 'emms-score-show-playing)

;; coding settings

(setq emms-info-mp3info-coding-system locale-code
      emms-cache-file-coding-system locale-code
      emms-i18n-default-coding-system default-process-coding-system)

