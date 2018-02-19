//
// Created by Alex Faizullov on 2/18/18.
//

import Foundation

public struct TemplateFile: Codable {
  public let name: String
  public let path: String
}

public struct TemplateConfig: Codable {
  public let sourceFiles: [TemplateFile]
  public let testFiles: [TemplateFile]
}
