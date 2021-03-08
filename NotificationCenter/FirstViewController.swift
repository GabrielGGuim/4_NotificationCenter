

import UIKit

class FirstViewController: UIViewController {
    
    //MARK: - Atributtes
    let btnSend: UIButton = {
        let btn = UIButton()
        btn.setTitle("Send", for: .normal)
        btn.backgroundColor = .gray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        btn.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let lbName: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Click in Button"
        lb.textAlignment = .center
        return lb
    }()
    
    //MARK: - Instance Methods
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(btnSend)
        self.view.addSubview(lbName)
        
        self.constraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(sendName), name: .sendNameNotification, object: nil)
        
    }
    
    //MARK: - Methods
    
    func constraints() {
        
        NSLayoutConstraint.activate([
            
            lbName.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant:30),
            lbName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            lbName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            btnSend.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            btnSend.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            btnSend.heightAnchor.constraint(equalToConstant: 60),
            btnSend.widthAnchor.constraint(equalToConstant: 120)
        ])
        
    }
    
    @objc func changeView(){
        let vc = SecondViewController()
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func sendName(_ notification: NSNotification){
        
        guard let name = notification.userInfo!["name"] else {return}
        
        self.lbName.text = "\(name)"
        
        let vc = notification.object
        
        let secondViewControler = vc as! SecondViewController
        
        secondViewControler.view.backgroundColor = .blue
    }
    
}

extension Notification.Name{
    static var sendNameNotification:Notification.Name{
        return Notification.Name(rawValue: "sendNameNotification")
    }
}

