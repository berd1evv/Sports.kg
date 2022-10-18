//
//  ProfileViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {
    
}

class ProfileViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        return imageView
    }()

    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Kudaiberdiev Eldiiar"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private lazy var cityLabel : UILabel = {
        let label = UILabel()
        label.text = "Bishkek"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        return tableView
    }()

    
    private lazy var themeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapThemeButton), for: .touchUpInside)
        return button
    }()

    
    var presenter: ProfilePresenterProtocol!
    private let configurator: ProfileConfiguratorProtocol = ProfileConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Профиль"
        
        view.addSubviews(
            imageView,
            nameLabel,
            cityLabel,
            tableView
        )
        
        configurator.configure(with: self)
        
        setUpConstraints()
    }
    
    @objc func didTapThemeButton() {        
        AppDelegate.shared.overrideApplicationThemeStyle()
    }
    
    func setUpConstraints() {
//        themeButton.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(118)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(116)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-15)
            make.left.right.equalToSuperview().inset(30)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(-2)
            make.left.right.equalToSuperview().inset(156)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).inset(-60)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
}

// MARK: - ProfileViewController
extension ProfileViewController: ProfileViewProtocol {
    
}
