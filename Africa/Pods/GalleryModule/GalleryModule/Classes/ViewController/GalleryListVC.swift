//
//  GalleryListVC.swift
//  GalleryModule
//
//  Created by Ravi Kumar Yaganti on 09/04/21.
//

import UIKit

class GalleryListVC: UIViewController, Bindable {

    @IBOutlet weak var tableView: UITableView!
    weak var galleryCoordinator: GalleryCoordinator?
    var viewModel: GalleryVieModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reloadData()
        print("Able to launch Gallery list vc")
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - bindables
    func bindingViewModel() {
        
    }

}

extension GalleryListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if( !(cell != nil))
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        cell!.textLabel?.text = "Hello"
        cell?.imageView?.image = UIImage(systemName: "paperplane.fill")

        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
