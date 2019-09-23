import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var userStore = UserStore()
    
    class func appdelegate()->AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey:Any]?)-> Bool{

        window = UIWindow(frame: UIScreen.main.bounds)
        
        let initialView:UIViewController
        if !AppDelegate.appdelegate().userStore.isUserSignedIn(){
            initialView = RegisterViewController.instantiate()
        }else{
            initialView = EcomViewController.instantiate()
        }
        self.window?.rootViewController = initialView
        self.window?.makeKeyAndVisible()
        
        window?.backgroundColor = .orange
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }


}

