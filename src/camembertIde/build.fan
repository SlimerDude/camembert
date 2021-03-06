// History:
//  Feb 01 13 tcolar Creation
//

using build
using netColarJar

**
** build
**
class build : BuildPod
{
  new make()
  {
    podName = "camembertIde"
    summary = "Metapackage for Camembert and all plugins."
    depends = [
               "camembert 1.1.12+",

               "camFantomPlugin 1.1.11+",
               "camNodePlugin 1.1.12+",
               "camMavenPlugin 1.1.12+",
               "camPythonPlugin 1.1.12+",
               "camRubyPlugin 1.1.12+",
               "camGradlePlugin 1.1.12+",
               "camPhpPlugin 1.1.12+",

               "camGoPlugin 1.2.3+",
               "camAxonPlugin 1.1.9+",

               "sys 1.0.64+"
               ]
    version = Version("1.1.12")
    srcDirs = [`fan/`]
    meta    = ["license.name" : "MIT",
                "vcs.uri"   : "https://bitbucket.org/tcolar/camembert"]
  }

  @Target { help = "Build platform specific standalone jars." }
  Void jars()
  {
    File(`../../swt/`).normalize.listDirs.each |dir| {
      platform := dir.name
      BuildJar(this){
        destFile = `../../dist/camembert-${version}-${platform}.jar`.toFile.normalize
        this.log.info(destFile.osPath)
        appMain = "camembertIde::Main"
        pods = ["camembertIde", "icons"]
        extraFiles = [dir.uri + `swt.jar` : `lib/java/ext/${dir.name}/swt.jar`]
      }.run
    }
  }
}


