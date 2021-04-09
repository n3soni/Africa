//
//  GalleryVieModel.swift
//  GalleryModule
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import Foundation
import Combine
@available(iOS 13.0, *)
public class GalleryVieModel: StateViewModel {
    public var subscribers: Set<AnyCancellable> = Set<AnyCancellable>()
    public var applicationStore: ApplicationStore?

    init(applicationStore: ApplicationStore) {
        set(applicationStore: applicationStore)
    }
}

// MARK: - Subscribers
@available(iOS 13.0, *)
extension GalleryVieModel {
    
    public func setupSubscribers() {
        // TODO: -
    }
}
