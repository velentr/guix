;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2014 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2015 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2019 Tobias Geerinckx-Rice <me@tobias.gr>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu packages libunwind)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses))

(define-public libunwind
  (package
    (name "libunwind")
    (version "1.5.0")
    (source (origin
             (method url-fetch)
             (uri (string-append "mirror://savannah/libunwind/libunwind-"
                                 version ".tar.gz"))
             (sha256
              (base32
               "05qhzcg1xag3l5m3c805np6k342gc0f3g087b7g16jidv59pccwh"))))
    (build-system gnu-build-system)
    (arguments
     ;; FIXME: As of glibc 2.25, we get 1 out of 34 test failures (2 are
     ;; expected to fail).
     ;; Report them upstream.
     '(#:tests? #f))
    (home-page "https://www.nongnu.org/libunwind")
    (synopsis "Determining the call chain of a program")
    (description
     "The primary goal of this project is to define a portable and efficient C
programming interface (API) to determine the call-chain of a program.  The API
additionally provides the means to manipulate the preserved (callee-saved)
state of each call-frame and to resume execution at any point in the
call-chain (non-local goto).  The API supports both local (same-process) and
remote (across-process) operation.  As such, the API is useful in a number of
applications.")
    ;; Do not believe <https://savannah.nongnu.org/projects/libunwind/>:
    ;; see <https://github.com/libunwind/libunwind/issues/372>.
    (license expat)))
