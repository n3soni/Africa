//
//  ModuleDelegateProtocol.swift
//  GalleryModule
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import Foundation
/**
 Callback methods from Module to Hosting Application
 */
public enum AfricaModules: String {
    case Browse = "BrowseModule"
    case Watch = "WatchModule"
    case Gallery = "GalleryModule"
    case Locations = "LocationsPay"
}

public protocol ModuleDelegateProtocol: AnyObject {
//    /** This should be called before a given module is about to terminate and can be used to communicate with it's host application. */
//    var interactionId: String? { get set }
    func moduleWillTerminate(forModule module: AfricaModuleProtocol)
    /** This should be called when an initialization failure occured and the module is unable to start */
    func moduleFailedToStart(forModule module: AfricaModuleProtocol)
    /** This should be used for the handoff between the modules */
    func handOffModuleWithData(_module: AfricaModules, handsOffData: [String: Any])
    /** This should be used for using the same interaction Id between the modules */
//    func updateInteractionId(fromModule: AfricaModules, interactionId: String?)
    /** This should be used for handoff with modules' disability check, it first check for destination module enabled, then terminate source module, then handoff to destination module*/
    func handoff(_ sourceModule: AfricaModuleProtocol?, to destinationModule: AfricaModules, with handoffData: [String: Any])
}

public extension ModuleDelegateProtocol {
    func handOffModuleWithData(_module: AfricaModules, handsOffData: [String: Any]) {}
    func handoff(_ sourceModule: AfricaModuleProtocol?, to destinationModule: AfricaModules, with handoffData: [String: Any]) {}
}
