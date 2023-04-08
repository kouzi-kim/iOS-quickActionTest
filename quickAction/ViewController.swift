//
//  ViewController.swift
//  quickAction
//
//  Created by Roy on 2023/04/09.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func addButtonAction(_ sender: Any) {
        let application = UIApplication.shared
        application.shortcutItems = [
            UIApplicationShortcutItem(type: "SearchAction",
                                      localizedTitle: "SearchAction Title",
                                      localizedSubtitle: "SearchAction Subtitle",
                                      icon: UIApplicationShortcutIcon(type: .search))
        ]
        
        let alert = UIAlertController(title: "Search Action Add", message: "성공적으로 추가되었습니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

