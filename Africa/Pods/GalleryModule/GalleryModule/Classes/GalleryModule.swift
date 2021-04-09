
protocol NseUpgradeModuleProtocol: class {
    /** This should be used for the handoff between the modules */
    func handOffModuleWithData(_module: AfricaModules, handsOffData: [String: Any])
}

@available(iOS 13.0, *)
public class GalleryModule: AfricaModuleDelegate, AfricaModuleProtocol {
    
    public static let applicationNameForLogging = "sellingexperience_upgrade"
    public var applicationId: String = String(describing: GalleryModule.self)
    public let friendlyName: String = "Gallery"
    public var icon: UIImage?
    public let version = Bundle.getBundleFor(GalleryModule.self)?.appVersion ?? "Unknown"
    //    private var upgradeViewController: UpgradeViewController?
    private(set) var globalState: ApplicationStore
    var galleryViewModel: GalleryVieModel
    
    lazy var coordinator: GalleryCoordinator = {
        var coordinator = GalleryCoordinator(navigationController: UINavigationController())
        coordinator.galleryModule = self
        return coordinator
    }()
    
    public init(globalState: ApplicationStore = ApplicationStore()) {
        self.globalState = globalState
        self.galleryViewModel = GalleryVieModel(applicationStore: globalState)
        //        self.upgradeSummaryViewModel = UpgradeSummaryViewModel(applicationStore: globalState)
        //        self.headerViewModel = ExpandableHeaderViewModel(applicationStore: globalState)
        super.init()
        
        //        GalleryModule.loadFonts()
        
        /** This module isn't designed to be launched directly from the homescreen */
        displayOnHomeScreen = false
    }
    
    public func rootViewController() -> UIViewController? {
        print("\(friendlyName) cannot be called without handoff data")
        return nil
    }
    
    public func rootViewController(handOffDict: [String: Any]) -> UIViewController? {
        print("Component is \(#file.shortFileName() + "." + #function)")
        coordinator.transactionTypeDecider()
        return coordinator.navigationController
    }
    
    /** Hosting application is terminating module */
    public func moduleTerminate() {
        moduleDelegate?.moduleWillTerminate(forModule: self)
    }
    
    //    public static func loadFonts() {
    //        guard let moduleBundle = Bundle.getBundle(GalleryModule)?.bundleURL else { return }
    //        do {
    //            try UIFont.register(from: moduleBundle, fontExtension: "otf")
    //            try UIFont.register(from: moduleBundle, fontExtension: "ttf")
    //        } catch {
    //            print(error)
    //        }
    //    }
}

@available(iOS 13.0, *)
extension GalleryModule {
    
    func handOffModuleWithData(_module: AfricaModules, handsOffData: [String: Any]) {
        print("Component is \(#file.shortFileName() + "." + #function)")
        moduleDelegate?.handoff(self, to: _module, with: handsOffData)
        coordinator.transactionTypeDecider()
    }
}
