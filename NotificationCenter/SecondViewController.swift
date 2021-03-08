
import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.post(name: .sendNameNotification, object: self, userInfo: ["name" : "Hello World"])
    }
}
