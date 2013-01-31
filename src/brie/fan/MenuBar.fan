// History:
//   11 8 12 Creation
using fwt

**
** MenuBar
**
class MenuBar : Menu
{
  Menu file
  Menu nav
  Menu process
  Menu panels
  Menu options
  Menu help
  Menu plugins

  new make()
  {
      file = Menu {
        it.text = "File"
        MenuItem{ it.command = Sys.cur.commands.save.asCommand},
        MenuItem{ it.command = Sys.cur.commands.newFile.asCommand},
        MenuItem{ it.command = Sys.cur.commands.openFolder.asCommand},
        MenuItem{ it.command = Sys.cur.commands.reload.asCommand},
        MenuItem{ it.command = Sys.cur.commands.exit.asCommand},
      }

      nav = Menu {
        it.text = "Navigation"
        MenuItem{ it.command = Sys.cur.commands.searchDocs.asCommand},
        MenuItem{ it.command = Sys.cur.commands.mostRecent.asCommand},
        MenuItem{ it.command = Sys.cur.commands.find.asCommand},
        MenuItem{ it.command = Sys.cur.commands.findInSpace.asCommand},
        MenuItem{ it.command = Sys.cur.commands.goto.asCommand},
        MenuItem{ it.command = Sys.cur.commands.prevMark.asCommand},
        MenuItem{ it.command = Sys.cur.commands.nextMark.asCommand},
      }

      process = Menu {
        it.text = "Process"
        MenuItem{ it.command = Sys.cur.commands.build.asCommand},
        MenuItem{ it.command = Sys.cur.commands.buildGroup.asCommand},
        MenuItem{ it.command = Sys.cur.commands.run.asCommand},
        MenuItem{ it.command = Sys.cur.commands.runSingle.asCommand},
        MenuItem{ it.command = Sys.cur.commands.buildAndRun.asCommand},
        MenuItem{ it.command = Sys.cur.commands.test.asCommand},
        MenuItem{ it.command = Sys.cur.commands.testSingle.asCommand},
      }

      panels = Menu {
        it.text = "Panels"
        MenuItem{ it.command = Sys.cur.commands.consoleToggle.asCommand},
        MenuItem{ it.command = Sys.cur.commands.docsToggle.asCommand},
        MenuItem{ it.command = Sys.cur.commands.recentToggle.asCommand},
      }

      options = Menu {
        it.text = "Options"
        MenuItem{ it.command = Sys.cur.commands.editConfig.asCommand},
        MenuItem{ it.command = Sys.cur.commands.reloadConfig.asCommand},
      }

      help = Menu {
        it.text = "Help"
        MenuItem{ it.command = Sys.cur.commands.about.asCommand},
      }

      plugins = Menu{it.text="Plugins"}

      add(file)
      add(nav)
      add(process)
      add(panels)
      add(options)
      add(plugins)
      add(help)
    }
}