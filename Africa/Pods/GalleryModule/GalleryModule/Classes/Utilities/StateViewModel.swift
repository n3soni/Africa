//
//  StateViewModel.swift
//  GalleryModule
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import Foundation

/// Protocol all viewmodels should implement
public protocol StateViewModel: StateObservable {
    func set(applicationStore: ApplicationStore)
}

public extension StateViewModel {
    func set(applicationStore: ApplicationStore) {
        self.applicationStore = applicationStore
        setupSubscribers()
    }
}

/// Protocol Which all viewcontrollers implement that bind to view model
public protocol Bindable: class {
    associatedtype ViewModel: StateViewModel
    var viewModel: ViewModel! { get set }
    func set(viewModel: ViewModel)
    func bindingViewModel()
}

public extension Bindable {
    func set(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}
