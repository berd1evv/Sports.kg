//
//  LoginViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    
}

class LoginViewController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Пропустить", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
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
    
    private lazy var userNameField: TextField = {
        let field = TextField()
        field.setUpData(image: UIImage(systemName: "person.fill")!, placeholder: "Логин")
        return field
    }()

    private lazy var passwordField: TextField = {
        let field = TextField()
        field.setUpData(image: UIImage(systemName: "lock.fill")!, placeholder: "Пароль")
        field.isSecureTextEntry = true
        return field
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.957, green: 0.427, blue: 0.427, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        return button
    }()
    
    private lazy var forgetPassword: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        return button
    }()

    var presenter: LoginPresenterProtocol!
    private let configurator: LoginConfiguratorProtocol = LoginConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configurator.configure(with: self)
        
        view.addSubviews(
            backgroundImageView,
            skipButton,
            imageView,
            titleLabel,
            sloganLabel,
            userNameField,
            passwordField,
            loginButton,
            forgetPassword,
            registerButton
        )
        
        setUpConstraints()
    }
    
    @objc func didTapLoginButton() {
        guard let username = userNameField.text, let password = passwordField.text else { return }
        presenter.login(userName: username, password: password)
        
//        let vc = TabBarViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapRegisterButton() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpConstraints() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        skipButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.right.equalToSuperview().inset(16)
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
        
        userNameField.snp.makeConstraints { make in
            make.top.equalTo(sloganLabel.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(32)
            make.height.equalTo(44)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(userNameField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(32)
            make.height.equalTo(44)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(32)
            make.height.equalTo(48)
        }
        
        forgetPassword.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(148)
        }
        
        registerButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(60)
            make.left.right.equalToSuperview().inset(32)
            make.height.equalTo(48)
        }
        
    }
}

// MARK: - LoginViewController
extension LoginViewController: LoginViewProtocol {
    
}
