//
//  GalleryViewController.swift
//  Africa
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import UIKit
import GalleryModule

class GalleryViewController: UIViewController {
    let galleryModule: AfricaModuleProtocol = GalleryModule()

    override func viewDidLoad() {
        super.viewDidLoad()
        presentUpgradeScreen()
        // Do any additional setup after loading the view.
    }
    

    func presentUpgradeScreen() {
        galleryModule.moduleDelegate = self
        guard let viewController = galleryModule.rootViewController(handOffDict: ["test": "sometest", "test2": "value2"]) else {
            assertionFailure("Not found gallery view controller")
            return
        }
        self.addChild(viewController)
        self.view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension GalleryViewController: ModuleDelegateProtocol {

    func moduleWillTerminate(forModule module: AfricaModuleProtocol) {
        print("Module Terminated")
    }

    func moduleFailedToStart(forModule module: AfricaModuleProtocol) {
        print("Module Failed to start")
    }

}
