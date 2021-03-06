// History:
//   11 8 12 Creation

using gfx
using syntax

**
** Camembert Plugin mixin
**
mixin Plugin
{

  ** Called as soon as camembert starts up (before doing anything)
  virtual Void onInit(File configDir) {}

  ** Called once Camembert is ready to use (frame built)
  ** Good place to add menu items if any
  ** It can be called again (with initail=false) after a complete "Reload config" event
  virtual Void onFrameReady(Frame f, Bool initial:=true) {}

  ** Called when a file is saved
  virtual Void onFileSaved(File f) {}

  ** Called whenever new/updated projects are found (to be reindexed)
  ** ClearAll can be set to tel the plugin to clear the index fully first
  virtual Void onChangedProjects(Project[] projects, Bool clearall := false) {}

  ** Called at the end of shutdown for cleanup purposes
  ** Might be called twice, once a "Soft" shutdown  (isKill = false) and then a gain a hard kill (isKill = true)
  virtual Void onShutdown(Bool isKill := false) {}

  ** Return a space for the project
  abstract Space createSpace(Project project)

  ** If this plugin provides a custom space, return the priority of this space
  ** for a given project. Zero otherwise
  virtual Int spacePriority(Project project) {return 0}

  ** Return an Item if the this plugin has an icon for the file
  ** null otherwise
  virtual Image? iconForFile(File dir) {return null}

  ** Function that return a project item if the given folder
  ** is deemed a project by the plugin
  ** This function will be called a lot, so keep efficient
  abstract |Uri -> Project?| projectFinder()

  ** Returns the setting object for the given plugin
  ** Called any time config is (re)loaded
  virtual PluginConfig? readConfig(Sys newSys) {null}

  ** Documentation provider for this plugin or null if none
  virtual PluginDocs? docProvider() {null}

  ** Plugin execution commands implemntation
  abstract PluginCommands? commands()

  ** Returns a unique name for this plugin
  virtual Str name() {Pod.of(this).name}

  ** Returns true if the project supports indexing and is currently indexing.
  virtual Bool isIndexing() {false}

  ** Env impl for the plugin
  abstract Type? envType()

  ** Check if the given folder is a "forced" project of a given type
  virtual Bool isCustomPrj(File dir, Str type)
  {
    props := prjProps(dir)
    if(props == null) return false
    return props["prj.type"]?.lower ==  type.lower
  }

  virtual [Str:Str]? prjProps(File dir)
  {
    if( ! dir.isDir) return null
    if((dir + `cam.props`).exists)
    {
       try
         return (dir + `cam.props`).readProps
       catch(Err e) {e.trace}
    }
    return null
  }

  ** Add an extra synatx support (fogFile) for given extensions
  ** Will only do anyhting if the fogFile doesn't exist yet in
  **  etc/syntax/syntax-${ruleName}.fog
  Void addSyntaxRule(Str name, File fogFile, Str[] exts)
  {
    file := Env.cur.findFile(`etc/syntax/syntax-${name}.fog`, false)
    if (file != null) return

    // Update ext.props with new extensions
    propFile := Env.cur.findFile(`etc/syntax/ext.props`, false)
    props := propFile.readProps
    exts.each{props[it]=name}
    propFile.writeProps(props)

    // create the new syntax file
    fogFile.copyTo(Env.cur.workDir + `etc/syntax/syntax-${name}.fog`)
  }
}

**
** PluginConfig
** Container for a given plugin configuration
**
const mixin PluginConfig
{
}


