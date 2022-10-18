//
//  BookViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import UIKit

protocol BookViewProtocol: AnyObject {
    
}

class BookViewController: UIViewController {
    
    var presenter: BookPresenterProtocol!
    private let configurator: BookConfiguratorProtocol = BookConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
    }
}

// MARK: - BookViewController
extension BookViewController: BookViewProtocol {
    
}
