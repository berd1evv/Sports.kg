//
//  MapDetailsViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 24/10/22.
//

import UIKit

protocol MapDetailsViewProtocol: AnyObject {
    func setData()
}

class MapDetailsViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.fill")
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Dordoi"
        return label
    }()
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.text = "1000"
        return label
    }()
    
    private lazy var addressLabel : UILabel = {
        let label = UILabel()
        label.text = "Dordoi"
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подробнее", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(didTapMoreButton), for: .touchUpInside)
        return button
    }()


    var presenter: MapDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        presenter.locationInfo()
        
        view.addSubviews(
            imageView,
            titleLabel,
            priceLabel,
            addressLabel,
            moreButton
        )
        
        setUpConstraints()
    }
    
    @objc func didTapMoreButton() {
        presenter.showDetails(id: presenter.location?.id ?? 0)
    }
    
    func setUpConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(155)
            make.height.equalTo(151)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.right.equalToSuperview().inset(10)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.right.equalToSuperview().inset(10)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.right.equalToSuperview().inset(10)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(100)
            make.height.equalTo(25)
        }
    }
}

// MARK: - MapDetailsViewController
extension MapDetailsViewController: MapDetailsViewProtocol {
    func setData() {
        titleLabel.text = presenter.location?.title
        priceLabel.text = "\(presenter.location?.price ?? 0) сом/час"
        addressLabel.text = presenter.location?.address
        guard let imageURL = URL(string: presenter.location?.image ?? "") else { return }
        imageView.sd_setImage(with: imageURL)
    }
}
