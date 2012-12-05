//
// Copyright (c) 2012, Brian Frank
// Licensed under the Academic Free License version 3.0
//
// History:
//   22 Apr 12  Brian Frank  Creation
//

using gfx
using fwt
using syntax
using concurrent

class Main
{
  static Void main()
  {
    pluginManager := PluginManager()
    pluginManager.start // will call plugins init

    sys := Sys{options = Options.load}
    sys.install
    Frame(sys).open

    pluginManager.stop // will call plugins shutdown
  }
}

