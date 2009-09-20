# Copyright (C) 2009  Volker Grabsch
#                     Giuseppe Scrivano
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject
# to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# CppUnit
PKG             := cppunit
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.12.1
$(PKG)_CHECKSUM := f1ab8986af7a1ffa6760f4bacf5622924639bf4a
$(PKG)_SUBDIR   := cppunit-$($(PKG)_VERSION)
$(PKG)_FILE     := cppunit-$($(PKG)_VERSION).tar.gz
$(PKG)_WEBSITE  := http://apps.sourceforge.net/mediawiki/cppunit/
$(PKG)_URL      := http://$(SOURCEFORGE_MIRROR)/project/cppunit/cppunit/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc

define $(PKG)_UPDATE
    $(call SOURCEFORGE_FILES,http://sourceforge.net/projects/cppunit/files/cppunit/) | \
    $(SED) -n 's,.*cppunit-\([0-9][^>]*\)\.tar.*,\1,p' | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        --host='$(TARGET)' \
        --disable-shared \
        --prefix='$(PREFIX)/$(TARGET)' \
        --disable-doxygen \
        --disable-dot \
        --disable-html-docs \
        --disable-latex-docs
    $(MAKE) -C '$(1)' install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= defexec_DATA=
endef
