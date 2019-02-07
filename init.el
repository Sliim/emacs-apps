;;; init.el --- Emacs apps init.
;;
;; Author: Sliim <sliim@mailoo.org>
;; Version: 1.0.0
;; Keywords: emacs-apps

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Emacs apps init.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING. If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(defvar emacsd-dir (concat (getenv "HOME") "/.emacs.d/")
  "The root directory of Emacs.")
(defvar emacsd-modules-dir (expand-file-name "modules" emacsd-dir)
  "The modules directory of Emacs.")
(defvar emacsd-modes-dir (file-name-directory load-file-name)
  "The root directory of Emacs modes.")
(defvar emacsd-var-dir (expand-file-name "var" emacsd-dir)
  "Var/ root directory.")
(defvar emacsd-vendor-dir (expand-file-name "vendor" emacsd-modes-dir)
  "Vendor root directory.")
(defvar emacsd-elpa-dir (expand-file-name
                         (concat ".cask/" (number-to-string emacs-major-version) "."
                                 (number-to-string emacs-minor-version) "/elpa")
                         emacsd-modes-dir)
  "Elpa packages root directory.")

(add-to-list 'load-path emacsd-vendor-dir)
(add-to-list 'load-path emacsd-modules-dir)
(let ((default-directory emacsd-elpa-dir))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" emacsd-dir))

(require 'alert)
(require 'helm)
(require 'helm-command)
(require 'helm-buffers)

(require 'emacsd-tls-hardening-module)
(require 'emacsd-term-module)

(load-theme 'S70wN-blue t)
(custom-theme-set-faces
 'S70wN-blue
 `(default ((t ( :foreground "#F6F3E8" :height 85 :width normal)))))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(delete-selection-mode t)
(global-auto-revert-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq alert-default-style 'libnotify)

;; Keybindings
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

;;; init.el ends here
