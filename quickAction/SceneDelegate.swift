//
//  SceneDelegate.swift
//  quickAction
//
//  Created by Roy on 2023/04/09.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //Action 타입
    enum ActionType: String {
        case kouziAction = "KouziAction"
    }
    var savedShortCutItem: UIApplicationShortcutItem?
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let shortcutItem = connectionOptions.shortcutItem {
            // Save it off for later when we become active.
            savedShortCutItem = shortcutItem
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
        guard let item = savedShortCutItem else { return }
        _ = handleShortCutItem(shortcutItem: item)
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
    }


}

extension SceneDelegate {
    // 퀵액션 클릭시 처리
    func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
        let alert = UIAlertController(title: "Quick Actions Test", message: "Short Cut Item Type : \(shortcutItem.type)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        if let actionTypeValue = ActionType(rawValue: shortcutItem.type) {
            switch actionTypeValue {
            case .kouziAction:
                DispatchQueue.main.async {
                    self.window?.rootViewController?.present(alert, animated: true)
                }
            }
        }
        
        return true
    }
    
    // 앱이 이미 실행중일때 quick action 클릭시 처리
    func windowScene(_ windowScene: UIWindowScene,
                     performActionFor shortcutItem: UIApplicationShortcutItem,
                     completionHandler: @escaping (Bool) -> Void) {
        let handled = handleShortCutItem(shortcutItem: shortcutItem)
        completionHandler(handled)
    }
}
