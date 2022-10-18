//
//  DetailsViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    func reloadData()
}

class DetailsViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DetailCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var descLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var writeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.957, green: 0.427, blue: 0.427, alpha: 1)
        button.setTitle("Написать", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        return button
    }()
    
    private lazy var bookButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.957, green: 0.427, blue: 0.427, alpha: 1)
        button.setTitle("Бронировать", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        return button
    }()
    
    var presenter: DetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Арена"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        view.addSubviews(
            collectionView,
            priceLabel,
            descLabel,
            writeButton,
            bookButton
        )
        
        presenter.getDetails()
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(260)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).inset(-10)
            make.right.equalToSuperview().inset(10)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).inset(-10)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(170)
        }
        
        writeButton.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).inset(-14)
            make.left.right.equalToSuperview().inset(31)
            make.height.equalTo(48)
        }
        
        bookButton.snp.makeConstraints { make in
            make.top.equalTo(writeButton.snp.bottom).inset(-14)
            make.left.right.equalToSuperview().inset(31)
            make.height.equalTo(48)
        }
    }
}

extension DetailsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.details?.galleries?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getReuseCell(DetailCollectionViewCell.self, indexPath: indexPath)
        cell.getData((presenter.details?.galleries?[indexPath.row].image))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width - 16, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

// MARK: - DetailsViewController
extension DetailsViewController: DetailsViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.priceLabel.text = "\(self.presenter.details?.price ?? 0) com"
            self.descLabel.text = self.presenter.details?.text
        }
    }
}
