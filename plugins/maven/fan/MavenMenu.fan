// History:
//  Jan 30 13 tcolar Creation
//

using fwt
using camembert

**
** MavenMenu
**
class MavenMenu : Menu
{
  Menu envs

  new make(Frame frame)
  {
    text = "Maven"

    envs = Menu
    {
      it.text = "Switch config"
    }

    first := true
    MavenPlugin.config.envs.each |env|
    {
      envs.add(MenuItem{
        it.command = SwitchConfigCmd(env.name).asCommand;
        it.mode = MenuItemMode.radio
        it.selected = first
      })
      first = false
    }

    add(envs)
  }
}
