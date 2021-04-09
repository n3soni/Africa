//
//  AfricaModuleProtocol.swift
//  GalleryModule
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import Foundation
import Foundation
import UIKit

// TODO: Rename this to NseModuleProtocol
public protocol AfricaModuleProtocol: AfricaModuleDelegate {
    /** User friendly name of module. Can be displayed on the UI */
    var friendlyName: String { get }
    /** Module Icon Image */
    var icon: UIImage? { get }
    /** Application Identifier. Internal use and loading the config plist file */
    var applicationId: String { get }

    /** Get the root view controller of the module. */
    func rootViewController() -> UIViewController?
    func rootViewController(handOffDict: [String: Any]) -> UIViewController?
    /** Module version */
    var version: String { get }
    /** Hosting application is terminating module */
    func moduleTerminate()
}

public extension AfricaModuleProtocol {
    /** Get the root view controller passing in a hand-off dictionary */
    func rootViewController(handOffDict: [String: Any]) -> UIViewController? {
        return rootViewController()
    }
}

// TODO Rename this class to NseModule as it encompases more than just delegates
open class AfricaModuleDelegate {
    /** Module Delegate. Methods to callback to host application */
    public weak var moduleDelegate: ModuleDelegateProtocol?
    public var nseInteractionID: String?
    /**
    Flag for host app to know if this module can be displayed on the homescreen.
     true = This module has been designed to be directly launched from the home screen. false = internal module, only callable as part of an internal flow. */
    public var displayOnHomeScreen = true
    public init() {}
}
