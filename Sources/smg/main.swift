import Foundation
import Commander
import SMGCore
import PathKit
import Stencil

let workDir = WorkingDirectoryProvider.basePath

Group {
  $0.command("shoot",
             Argument<String>("name", description: "Name of module to generate"),
             Argument<String>("template", description: "Template name"),
             Option<String>("output", default: "Sample/Output", description: "Path to output folder"),
             Option<String>("templates_path", default: "Templates", description: "Path to folder with templates")
  ) { name, template, output, templatesPath in

    let path = Path(workDir) + Path(templatesPath)

    let config = try TemplateLoader(templatesDir: path.string).load(template)

    let loader = FileSystemLoader(paths: [path + template])
    let environment = Environment(loader: loader)
    let renderer = TemplateRenderer(name: name, environment: environment)

    let output = Path(workDir) + output
    try output.mkpath()

    try config.sourceFiles.forEach {
      let sourceContent = try renderer.render($0.path)

      let fileName = name + $0.name
      let filePath = output + fileName

      try filePath.write(sourceContent)
    }
  }
}.run()