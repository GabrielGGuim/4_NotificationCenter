//
//  UiLayout.swift
//  NotificationCenter
//
//  Created by Gabriel Gonçalves Guimarães on 06/03/21.
//

import UIKit

class UiLayout: UIView {

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        self.addSubview(btnSend)
        self.addSubview(lbName)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        NSLayoutConstraint.activate([
            
            lbName.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant:30),
            lbName.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lbName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            btnSend.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btnSend.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            btnSend.heightAnchor.constraint(equalToConstant: 60),
            btnSend.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

}
