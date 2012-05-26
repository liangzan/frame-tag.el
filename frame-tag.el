;; window-tag.el --- Minor mode that assigns a unique number to each window for easy switching

;; Copyright (C) 2012 Wong Liang Zan

;; Version: 0.1.0
;; Keywords: window, frame, movement
;; Author: Wong Liang Zan <zan@liangzan.net>
;; URL: http://github.com/liangzan/window-tag.el

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

(eval-when-compile (require 'cl))

(defun frame-tag-frame-left-position (frm)
  "returns the value of the left parameter of the frame"
  (frame-parameter frm 'left))

(defun frame-tag-frame-top-position (frm)
  "returns the value of the top parameter of the frame"
  (frame-parameter frm 'top))

(defun frame-tag-frame-relative-position (frm)
  "adds the left and top parameter of the frames"
  (+ (eval (frame-tag-frame-left-position frm))
     (eval (frame-tag-frame-top-position frm))))

(defun frame-tag-frames-sorted-position ()
  "returns the sorted relative positions of the frames"
  (sort
   (frame-tag-frames-relative-position)
   '<))

(defun frame-tag-frames-relative-position ()
  "returns the relative positions of the frames"
  (mapcar 'frame-tag-frame-relative-position (frame-list)))

(defun frame-tag-find-index-position (index)
  "given the index, returns the position from the sorted relative postions"
  (position (nth index (frame-tag-frames-sorted-position))
	    (frame-tag-frames-relative-position)))

(defun frame-tag-find-frame (index)
  "finds the frame given the index"
  (nth (frame-tag-find-index-position index) (frame-list)))

(defun frame-tag-select-frame-by-number (index)
  "selects the frame given a number."
  (select-frame-set-input-focus (frame-tag-find-frame index)))

(frame-tag-select-frame-by-number 0)