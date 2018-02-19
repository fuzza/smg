//
// Created by Alex Faizullov on 2/18/18.
//

import Foundation
import XCTest
import Yams
@testable import SMGCore

class TemplateConfigTests: XCTestCase {

  let fixture: String = """
  sourceFiles:
      - name: Source.swift
        path: Source/Source.swift.stencil
  testFiles:
      - name: Test.swift
        path: Test/Test.swift.stencil
  """

  func test_decoding_returnsConifigFile() throws {
    let config = try YAMLDecoder().decode(TemplateConfig.self, from: fixture)

    XCTAssertTrue(config.sourceFiles.count == 1)
    XCTAssertEqual(config.sourceFiles[0].name, "Source.swift")
    XCTAssertEqual(config.sourceFiles[0].path, "Source/Source.swift.stencil")
    XCTAssertTrue(config.testFiles.count == 1)
    XCTAssertEqual(config.testFiles[0].name, "Test.swift")
    XCTAssertEqual(config.testFiles[0].path, "Test/Test.swift.stencil")
  }
}