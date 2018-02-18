//
// Created by Alex Faizullov on 2/18/18.
//

import Foundation
import PathKit
import Yams

public class TemplateLoader {

  private enum Errors: Error {
    case templateNotFound(String)
    case templateSpecNotFound(String)
    case configNotValid(Error)
  }

  private let templatesDir: String

  public init(templatesDir: String) {
    self.templatesDir = templatesDir
  }

  @discardableResult
  public func load(_ name: String) throws -> TemplateConfig {
    let templatePath = Path(templatesDir) + Path(name)

    guard templatePath.isDirectory else { throw Errors.templateNotFound(templatePath.string) }

    let smgSpecPath = templatePath + "\(name).yml"
    guard smgSpecPath.isFile else { throw Errors.templateSpecNotFound(smgSpecPath.string)}

    do {
      let content: String = try smgSpecPath.read()
      let config = try YAMLDecoder().decode(TemplateConfig.self, from: content)
      return config
    } catch {
      throw Errors.configNotValid(error)
    }
  }
}
