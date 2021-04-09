//
//  Bundle+Extension.swift
//  GalleryModule
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import Foundation

extension Bundle {
    
    static func getBundleFor(_ module: AnyClass) -> Bundle? {
        let podBundle = Bundle(for: module.self)
        guard let bundleURL = podBundle.url(forResource: String(describing: module), withExtension: "bundle") else {return nil}
        return Bundle(url: bundleURL)
    }
    
    @available(iOS 13.0, *)
    static func galleryBundle() -> Bundle? {
        let podBundle = Bundle(for: GalleryModule.self)
        guard let bundleURL = podBundle.url(forResource: "GalleryModule", withExtension: "bundle") else {return nil}
        return Bundle(url: bundleURL)
    }

    var appVersion: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}
