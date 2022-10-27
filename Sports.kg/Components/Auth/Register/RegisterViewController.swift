//
//  RegisterViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

import UIKit

protocol RegisterViewProtocol: AnyObject {
    
}

class RegisterViewController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 39
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Stadion.kg"
        label.font = .systemFont(ofSize: 36)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var sloganLabel : UILabel = {
        let label = UILabel()
        label.text = "Какой-то слоган"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emailField: TextField = {
        let field = TextField()
        field.placeholder = "user@example.com"
        field.setUpData(image: UIImage(systemName: "envelope.fill")!, placeholder: "email")
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        return field
    }()
    
    private lazy var userNameField: TextField = {
        let field = TextField()
        field.setUpData(image: UIImage(systemName: "person.fill")!, placeholder: "Логин")
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        return field
    }()

    private lazy var passwordField: TextField = {
        let field = TextField()
        field.setUpData(image: UIImage(systemName: "lock.fill")!, placeholder: "Пароль")
        field.isSecureTextEntry = true
        return field
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.backgroundColor = UIColor(red: 0.957, green: 0.427, blue: 0.427, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        return button
    }()
    
    var presenter: RegisterPresenterProtocol!
    private let configurator: RegisterConfiguratorProtocol = RegisterConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configurator.configure(with: self)
        
        view.addSubviews(
            backgroundImageView,
            imageView,
            titleLabel,
            sloganLabel,
            emailField,
            userNameField,
            passwordField,
            registerButton
        )
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(194)
            make.width.height.equalTo(78)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(35)
        }
        
        sloganLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(35)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(sloganLabel.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(32)
            make.height.equalTo(44)
        }
        
        userNameField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(32)
            make.height.equalTo(44)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(userNameField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(32)
            make.height.equalTo(44)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(32)
            make.height.equalTo(48)
        }

    }
}

// MARK: - RegisterViewController
extension RegisterViewController: RegisterViewProtocol {
    
}
