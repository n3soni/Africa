//
//  FlowDeciderVC.swift
//  GalleryModule
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import Foundation
import Combine

class FlowDeciderVC: UIViewController, Bindable {
    var viewModel: GalleryVieModel!
    weak var galleryCoordinator: GalleryCoordinator?
    var subscribers = Set<AnyCancellable>()

    override func viewDidLoad() {
        self.galleryCoordinator?.showGallery()

    }
}

extension FlowDeciderVC {
    func bindingViewModel() {
        // TODO: add required bindables
    }
}
