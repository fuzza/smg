//
// Created by Alex Faizullov on 2/18/18.
//

import Foundation
import XCTest
import PathKit

@testable import SMGCore

class TemplateLoaderTests: XCTestCase {
  var sut: TemplateLoader!

  func test_load_templateDirectoryNotExist_throws() {
    XCTAssertThrowsError(try makeSut().load("unexisting"))
  }

  func test_load_loadsConfig() throws {
    let config = try makeSut().load("module")
  }

  func test_load_ymlNotExists_throws() {
    XCTAssertThrowsError(try makeSut().load("module_no_smg"))
  }

  // MARK: Helper functions

  func makeSut(_ templatesDir: String = templatesPath()) -> TemplateLoader {
    return TemplateLoader(templatesDir: templatesDir)
  }
}

func fixturesPath() -> Path {
  return Path(WorkingDirectoryProvider.basePath)
}

func templatesPath() -> String {
  return (fixturesPath() + "Templates").string
}