// To change this License template, choose Tools / Templates
// and edit Licenses / FanDefaultLicense.txt
//
// History:
//   Oct 25, 2012 tcolar Creation
//
using fwt
using concurrent
using netColarUtils

**
** ProcessUtil
**
class ProcessUtil
{
  File file := Sys.cur.optionsFile.parent + `run.json`

  ** Args for a command
  private SavedCommands runCmd := SavedCommands()

  new make()
  {
    try
    {
      if(file.exists)
        runCmd = (SavedCommands) JsonUtils.load(file.in, SavedCommands#)
    }
    catch(Err e) {Sys.cur.log.err("Failed loading saved run commands", e)}
  }

  Void setCmd(File f, CmdArgs cmd, Bool persist)
  {
    runCmd.cmds[f] = cmd
    if(persist)
      JsonUtils.save(file.out, runCmd)
  }

  CmdArgs? getCmd(File f)
  {
    return runCmd.cmds[f]
  }

  Int waitForProcess(Console console, Duration timeout := 1min)
  {
    Actor(ActorPool(), |Obj? obj-> Obj? | {
        start := DateTime.now
        Console c := (obj as Unsafe).val
        while( c.isBusy )
        {
          Actor.sleep(100ms)
        }
        return c.lastResult
      }).send(Unsafe(console)).get(timeout)
  }
}

@Serializable
class SavedCommands
{
  File:CmdArgs cmds := [:]
}