//
//  HomeViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 4/10/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func reloadData()
}

class HomeViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    var presenter: HomePresenterProtocol!
    private let configurator: HomeConfiguratorProtocol = HomeConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Футбол"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        configurator.configure(with: self)
                
        presenter.getSportAreas()
        
        view.addSubviews(collectionView)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.sportAreas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getReuseCell(HomeCollectionViewCell.self, indexPath: indexPath)
        cell.getData(presenter.sportAreas[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = presenter.sportAreas[indexPath.row].id else { return }
        presenter.showDetails(id: id)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width - 16, height: 260)
    }
    
    
}

// MARK: - HomeViewController
extension HomeViewController: HomeViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
