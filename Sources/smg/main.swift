import Foundation
import Commander
import SMGCore
import PathKit

let workDir = WorkingDirectoryProvider.basePath

Group {
  $0.command("shoot",
             Argument<String>("name", description: "Name of module to generate"),
             Argument<String>("template", description: "Template name"),
             Option<String>("templates_path", default: "Templates", description: "Path to folder with templates")
  ) { name, template, templatesPath in

    let path = Path(workDir) + Path(templatesPath)

    try TemplateLoader(templatesDir: path.string).load(template)
  }
}.run()
