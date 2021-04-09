//
//  StateObservable.swift
//  GalleryModule
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import Foundation
import Combine

public protocol StateObservable: class {
    var applicationStore: ApplicationStore? { get set}
    /// Create subscribers for any state data that is needed for updating this view controller.
    @available(iOS 13.0, *)
    var subscribers: Set<AnyCancellable> { get set }
    func setupSubscribers()
    /// This tears down the combine relationship. To be used when the view controller is dismissed.
    func cancelSubscribers()
}

public extension StateObservable {
    func cancelSubscribers() {
        if #available(iOS 13.0, *) {
            subscribers.forEach { $0.cancel() }
        } else {
            // Fallback on earlier versions
        }
    }
}
