//
//  BrowseViewController.swift
//  Africa
//
//  Created by Nitin Soni on 08/04/21.
//

import UIKit
import GalleryModule
import BrowseModule

class BrowseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let logger = Logger()
        logger.sayHello(name: "Ravi")
        checkIfBrowserModuleAccessible()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blue
    }
    
    func checkIfBrowserModuleAccessible() {
        Validator.whereAreYou()
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
