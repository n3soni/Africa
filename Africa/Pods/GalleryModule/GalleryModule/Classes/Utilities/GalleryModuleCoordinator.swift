//
//  GalleryModuleCoordinator.swift
//  GalleryModule
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import Foundation
/**
 All navigation for Gallery Module should go through this class
 */
class GalleryCoordinator: NSObject, Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    weak var galleryModule: GalleryModule?
    var galleryListVC: GalleryListVC?
    var flowDeciderVC: FlowDeciderVC?
    var launchedProductCart: Bool = false
    var application: String = "Gallery"
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
        super.init()
        self.navigationController.delegate = self
    }
    
    func start() {
    }
    
    func transactionTypeDecider() {
        let storyBoard = UIStoryboard(name: "gallery", bundle: Bundle.galleryBundle())
        flowDeciderVC = storyBoard.instantiateViewController(withIdentifier: "FlowDeciderVC") as? FlowDeciderVC
        if let transactionDeciderViewController = self.flowDeciderVC {
            transactionDeciderViewController.galleryCoordinator = self
            if let module = galleryModule {
                self.flowDeciderVC?.set(viewModel: module.galleryViewModel)
            }
            DispatchQueue.main.async {
                self.navigationController.pushViewController(transactionDeciderViewController, animated: true)
            }
        } else {
            print("Not a flow decider VC is nil")
        }
    }
    
    func showGallery() {
        let storyBoard = UIStoryboard(name: "gallery", bundle: Bundle.galleryBundle())
        galleryListVC = storyBoard.instantiateViewController(withIdentifier: "GalleryListVC") as? GalleryListVC
        if let gallaryVC = self.galleryListVC {
            galleryListVC?.galleryCoordinator = self
            if let module = galleryModule {
                galleryListVC?.set(viewModel: module.galleryViewModel)
            }
            DispatchQueue.main.async {
                self.navigationController.pushViewController(gallaryVC, animated: true)
            }
        }
    }
    
    func back() {
        self.exitGallery()
    }
    
    func exitGallery() {
        navigationController.presentingViewController?.dismiss(animated: false)
        galleryModule?.moduleTerminate()
    }
    
}

extension GalleryCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        _  = navigationController.transitionCoordinator
        // Read the view controller we’re moving from.
        let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from)
        // Read the view controller we’re moving to.
        _ = navigationController.transitionCoordinator?.viewController(forKey: .to)
        
        print("Gallery Coordinator: \(String(describing: fromViewController))->\(String(describing: viewController))")
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return nil
    }
    
}
