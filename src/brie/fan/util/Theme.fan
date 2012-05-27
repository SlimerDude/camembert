//
// Copyright (c) 2012, Brian Frank
// Licensed under the Academic Free License version 3.0
//
// History:
//   26 Apr 12  Brian Frank  Creation
//

using gfx

**
** Theme constants
**
const class Theme
{
  static const Image iconHome      := Image(`fan://brie/res/home.png`)
  static const Image iconFile      := Image(`fan://icons/x16/file.png`)
  static const Image iconDir       := Image(`fan://icons/x16/folder.png`)
  static const Image iconFan       := Image(`fan://icons/x16/fileFan.png`)
  static const Image iconErr       := Image(`fan://icons/x16/err.png`)
  static const Image iconOk        := Image(`fan://brie/res/ok.png`)
  static const Image iconIndexing  := Image(`fan://icons/x16/sync.png`)
  static const Image iconSlideUp   := Image(`fan://brie/res/slideUp.png`)
  static const Image iconSlideDown := Image(`fan://brie/res/slideDown.png`)
  static const Image iconDirty     := Image(`fan://brie/res/dirty.png`)
  static const Image iconNotDirty  := Image(`fan://brie/res/notDirty.png`)
  static const Image iconPod       := Image(`fan://icons/x16/database.png`)
  static const Image iconType      := Image(`fan://brie/res/type.png`)
  static const Image iconField     := Image(`fan://brie/res/field.png`)
  static const Image iconMethod    := Image(`fan://brie/res/method.png`)

  static Image fileToIcon(File f)
  {
    if (f.isDir) return iconDir
    if (f.ext == "fan") return iconFan
    return iconFile
  }

  static const Color bg := Color(0xff_ff_ff)
  static const Color itemHeadingBg := Color(0xcc_cc_cc)
}