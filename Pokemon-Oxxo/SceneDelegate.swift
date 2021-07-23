//
//  SceneDelegate.swift
//  Pokemon-Oxxo
//
//  Created by Omar Trujillo on 23/07/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let defaults = UserDefaults.standard
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        isAppAlreadyLaunchedOnce()
        let firstTime = defaults.string(forKey: "isAppAlreadyLaunchedOnce")
        if firstTime == "1" {
            let contentView = PokemonList()
            goWindowScene(scenery: scene, root: contentView)
        } else {
            let contentView = LaunchScreenVC()
            goWindowScene(scenery: scene, root: contentView)
        }
    }
    
    func goWindowScene(scenery: UIScene, root: UIViewController) {
        let navigationController = UINavigationController(rootViewController: root)
        if let windowScene = scenery as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = navigationController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func isAppAlreadyLaunchedOnce() {
        if defaults.string(forKey: "isAppAlreadyLaunchedOnce") != nil {
            defaults.setValue("1", forKey: "isAppAlreadyLaunchedOnce")
        } else {
            defaults.setValue("0", forKey: "isAppAlreadyLaunchedOnce")
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
