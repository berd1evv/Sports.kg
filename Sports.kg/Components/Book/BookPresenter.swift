//
//  BookPresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import Foundation

protocol BookPresenterProtocol: AnyObject {
    
}

class BookPresenter {
    
    weak var view: BookViewProtocol!
    var interactor: BookInteractorProtocol!
    var router: BookRouterProtocol!

    required init(view: BookViewProtocol!) {
        self.view = view
    }
}

// MARK: - BookPresenterProtocol
extension BookPresenter: BookPresenterProtocol {
    
}

// MARK: - BookInteractorOutputProtocol
extension BookPresenter: BookInteractorOutputProtocol {
    
}
