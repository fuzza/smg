//
// Created by Alex Faizullov on 2/19/18.
//

import Foundation
import Stencil

public class TemplateRenderer {
  private let environment: Environment
  private let context: [String: Any]

  public init(name: String, environment: Environment) {
    self.environment = environment
    self.context = ["name" : name]
  }

  public func render(_ template: String) throws -> String {
    return try environment.renderTemplate(name: template, context: context)
  }
}
