//
// Created by Alex Faizullov on 2/18/18.
//

import Foundation

public struct TemplateFile: Codable {
  let name: String
  let path: String
}

public struct TemplateConfig: Codable {
  let sourceFiles: [TemplateFile]
  let testFiles: [TemplateFile]
}
