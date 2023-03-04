
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var hasOnboarded = false
    
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self // send us any signals we get
        onboardingViewController.delegate = self
        dummyViewController.logoutDelegate = self
//        window?.rootViewController = onboardingViewController
                window?.rootViewController = loginViewController
        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate, OnboardingContainerViewControllerDelegate, LogoutDelegate{
    func didLogin() {
        setRootViewController(hasOnboarded ? dummyViewController : onboardingViewController)
    }
  
    func didFinishOnboarding() {
        hasOnboarded = true
        setRootViewController(dummyViewController)
    }
  
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

/// Setting the rootview controller with animations
extension AppDelegate{
    func setRootViewController(_ vc: UIViewController, animated: Bool = true){
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
