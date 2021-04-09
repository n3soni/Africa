//
//  String+Extension.swift
//  GalleryModule
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import Foundation

public extension String {
    /// Converts string to a file url and returns short version
    ///
    /// - Returns: last path component without extension e.g. AppDelegate
    @discardableResult func shortFileName() -> String {
        
        let url = URL(fileURLWithPath: self)
        let urlWithoutFileExtension: URL =  url.deletingPathExtension()
        let fileNameWithoutExtension: String = urlWithoutFileExtension.lastPathComponent
        let fileNameByTrimmingSlashes = fileNameWithoutExtension.trimmingCharacters(in: ["/"])
        let fileNameTrimmed = fileNameByTrimmingSlashes.trimmingCharacters(in: .whitespacesAndNewlines)
        return fileNameTrimmed
    }
}
