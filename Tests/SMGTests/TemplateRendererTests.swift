//
// Created by Alex Faizullov on 2/19/18.
//

import XCTest
import Foundation
import Stencil
@testable import SMGCore

class TemplateRendererTests: XCTestCase {

  func test_render_rendersNameFromContext() throws {
    let templates = ["test.stencil": "Name is {{ name }}"]

    let result = try makeSut(name: "test_name",
                             templates: templates).render("test.stencil")

    XCTAssertEqual(result, "Name is test_name")
  }

  func test_render_noTemplate_throws() {
    XCTAssertThrowsError(try makeSut(name: "some_name").render("test.stencil"))
  }

  func makeSut(name: String, templates: [String: String] = [:]) -> TemplateRenderer {
    let loader = DictionaryLoader(templates: templates)
    let environment = Environment(loader: loader)
    return TemplateRenderer(name: name, environment: environment)
  }
}