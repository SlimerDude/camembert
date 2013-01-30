// History:
//  Jan 25 13 tcolar Creation
//

using gfx

**
** Project
**
@Serializable
const class Project
{
  // TODO: subprojects allowed / what kind ?

  const Str dis

  const File dir

  const Image? icon := null

  ** Plugin responsible for this project
  const Type plugin

  const Str:Str params := [:]

  new make(|This|? f) {if(f!=null) f(this)}
}