//
// Created by Alex Faizullov on 2/18/18.
//

import Foundation

public struct WorkingDirectoryProvider {

#if DEBUG
  static public let basePath = URL(fileURLWithPath: #file)
    .deletingLastPathComponent() // WorkingDirectoryProvider.swift
    .deletingLastPathComponent() // SMGCore
    .deletingLastPathComponent() // Sources
    .path
#else
  static public let basePath = FileManager.default.currentDirectoryPath
#endif

}
