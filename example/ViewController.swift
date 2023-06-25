import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        
        // Add an action for the button
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    
        view.addSubview(button)
    }
    
    @objc func buttonTapped() {
        
        let jsonData: [String: Any] = [
            "username": "+923xxxxxxx",
            "name":"xxxxx",
        ]

        if let data = try? JSONSerialization.data(withJSONObject: jsonData, options: []) {
            let base64String = data.base64EncodedString()

            if let url = URL(string: "chikoo://") {
                if UIApplication.shared.canOpenURL(url) {
                    var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                    components?.queryItems = [
                        URLQueryItem(name: "data", value: base64String)
                    ]
                    
                    if let modifiedURL = components?.url {
                        UIApplication.shared.open(modifiedURL, options: [:], completionHandler: nil)
                    }
                } else {
                    if let websiteURL = URL(string: "https://apps.apple.com/pk/app/chikoo-shop/id1553673042") {
                        let safariViewController = SFSafariViewController(url: websiteURL)
                        present(safariViewController, animated: true, completion: nil)
                    }
                }
            }
        }
        
        
//        if let url = URL(string: "chikoo://") {
//            print(UIApplication.shared.canOpenURL(url))
//            if UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            } else {
//
//                if let websiteURL = URL(string: "https://www.example.com") {
//                    let safariViewController = SFSafariViewController(url: websiteURL)
//                    present(safariViewController, animated: true, completion: nil)
//                }
//            }
//        }
        
//        guard let chikooURLScheme = URL(string: "com.brandverse.chikoo://") else {
//                // Handle error when the Chikoo app is not installed
//                return
//            }
//
//            if UIApplication.shared.canOpenURL(chikooURLScheme) {
//                let encodedData = jsonData.data(using: .utf8)
//
//                if let encodedData = encodedData {
//                    let chikooAppDataKey = "data"
//                    UserDefaults.standard.setValue(encodedData, forKey: chikooAppDataKey)
//                    UserDefaults.standard.synchronize()
//                }
//
//                UIApplication.shared.open(chikooURLScheme)
//            } else {
//                // Handle error when the Chikoo app is not installed
//            }

    }
}



