//
//  SocialSites.swift
//  Sports.kg
//
//  Created by Eldiiar on 26/10/22.
//

import UIKit

class SocialSites: UIView {
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Соцсети"
        return label
    }()

    private lazy var instagramButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "insta"), for: .normal)
        button.addTarget(self, action: #selector(didTapInstagramm), for: .touchUpInside)
        return button
    }()

    private lazy var whatsappButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whats"), for: .normal)
        button.addTarget(self, action: #selector(didTapWhatsApp), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(
            titleLabel,
            instagramButton,
            whatsappButton
        )
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapInstagramm() {
        let username =  "berd1evv"
        let appURL = URL(string: "instagram://user?username=\(username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            let webURL = URL(string: "https://instagram.com/\(username)")!
            application.open(webURL)
        }
    }
    
    @objc func didTapWhatsApp() {
        let phoneNumber = "0777063806"
        let appURL  = URL(string:
                "https://api.whatsapp.com/send?phone=\(phoneNumber)")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL)
            }
        }
    }
    
    func setUpConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(15)
            make.width.equalTo(90)
        }
        
        instagramButton.snp.makeConstraints { make in
            make.right.equalTo(whatsappButton).offset(-48)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(37)
        }
        
        whatsappButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(37)
        }
    }
}
