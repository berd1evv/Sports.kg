//
//  DetailsViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import UIKit
import MapKit

protocol DetailsViewProtocol: AnyObject {
    func reloadData()
}

class DetailsViewController: UIViewController {
    
    var currentPage = 0 {
        didSet {
            pageController.currentPage = currentPage
        }
    }
    
    private lazy var pageController: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()
    
    lazy var contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 550)
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentSize
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentSize
        return view
    }()
    
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
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = false
        return tableView
    }()
    
    private lazy var socialSitesView: SocialSites = {
        let view = SocialSites()
        return view
    }()
    
    private lazy var infraLabel : UILabel = {
        let label = UILabel()
        label.text = "Инфраструктура"
        return label
    }()
    
    private lazy var infraTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InfraTableViewCell.self, forCellReuseIdentifier: "infraCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = false
        return tableView
    }()
    
    private let applemapView: MKMapView = {
        let map = MKMapView()
        map.isUserInteractionEnabled = false
        return map
    }()

    var presenter: DetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Арена"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubviews(
            collectionView,
            pageController,
            priceLabel,
            descLabel,
            writeButton,
            bookButton,
            mainTableView,
            socialSitesView,
            infraLabel,
            infraTableView,
            applemapView
        )
        
        applemapView.delegate = self
        presenter.getDetails()
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(260)
        }
        
        pageController.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.bottom).inset(16)
            make.width.equalTo(240)
            make.centerX.equalToSuperview()
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
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(bookButton.snp.bottom).offset(6)
            make.left.right.equalToSuperview()
            make.height.equalTo(180)
        }
        
        socialSitesView.snp.makeConstraints { make in
            make.top.equalTo(mainTableView.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.height.equalTo(65)
        }
        
        infraLabel.snp.makeConstraints { make in
            make.top.equalTo(socialSitesView.snp.bottom).offset(15)
            make.left.equalToSuperview().inset(16)
        }
        
        infraTableView.snp.makeConstraints { make in
            make.top.equalTo(infraLabel.snp.bottom).offset(3)
            make.left.right.equalToSuperview()
            make.height.equalTo(250)
        }
        
        applemapView.snp.makeConstraints { make in
            make.top.equalTo(infraTableView.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.height.equalTo(280)
        }
    }
}


extension DetailsViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Check for type here, not for the Title!!!
        if annotation is MKUserLocation {
            // we do not want to return a custom View for the User Location
            return nil
        }
        let identifier = "custom"
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        
        annotationView.annotation = annotation
        annotationView.canShowCallout = true

        annotationView.image = UIImage(named: "pin")
        
        return annotationView
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
        return CGSize(width: view.frame.size.width , height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.size.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case mainTableView:
            return presenter.detail.count
        case infraTableView:
            return presenter.details?.infrastructure?.count ?? 0
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case mainTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailsTableViewCell
            cell.setUpData(model: presenter.detail[indexPath.row])
            return cell
        case infraTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infraCell", for: indexPath) as! InfraTableViewCell
            cell.setUpData(model: (presenter.details?.infrastructure![indexPath.row])!)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case mainTableView:
            return 60
        case infraTableView:
            return 40
        default:
            return 0
        }
        
    }
    
}

// MARK: - DetailsViewController
extension DetailsViewController: DetailsViewProtocol {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
            self.mainTableView.reloadData()
            self.infraTableView.reloadData()

            self.priceLabel.text = "\(self.presenter.details?.price ?? 0) сом"
            self.descLabel.text = self.presenter.details?.text
            self.pageController.numberOfPages = self.presenter.details?.galleries?.count ?? 0
            //Pin
            guard let latitude = self.presenter.details?.latitude, let longitude = self.presenter.details?.longitude else { return }
            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            
            let region = MKCoordinateRegion(center: coordinates, span: span)
            
            self.applemapView.setRegion(region, animated: true)
            
            let myPin = MKPointAnnotation()
            myPin.coordinate = coordinates
            
            myPin.title = self.presenter.details?.title
            myPin.subtitle = self.presenter.details?.address
            
            self.applemapView.addAnnotation(myPin)
        }
    }
}
