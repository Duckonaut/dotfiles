;; -*- coding: utf-8; lexical-binding: t -*-
(setq inhibit-startup-message t)
(setq gc-cons-threshold 100000000)

;; Package management setup

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(ignore-errors (set-frame-font "Hack Nerd Font-11"))

(defconst duck:configpath "~/.config/emacs/")

(defun duck:load-config-file (file)
  (load (expand-file-name (concat duck:configpath file))))

(defun duck:load-config-files (filelist)
  (dolist (file filelist) (duck:load-config-file file)))

(duck:load-config-files '("ux" "packages" "mappings"))

(add-to-list 'load-path "/home/duckonaut/studia/INZ/jiroscope/target/release")
(require 'jiroscope)

(defun benchmark-request-el-jiroscope (url)
  (dotimes (i 100)
    (request-response-data
     (request url
       :parser 'json-read
       :sync t))))
