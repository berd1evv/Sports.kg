//
//  FilterPresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 19/10/22.
//

import Foundation

protocol FilterPresenterProtocol: AnyObject {
    
}

class FilterPresenter {
    
    weak var view: FilterViewProtocol!
    var interactor: FilterInteractorProtocol!
    var router: FilterRouterProtocol!

    required init(view: FilterViewProtocol!) {
        self.view = view
    }
}

// MARK: - FilterPresenterProtocol
extension FilterPresenter: FilterPresenterProtocol {
    
}

// MARK: - FilterInteractorOutputProtocol
extension FilterPresenter: FilterInteractorOutputProtocol {
    
}
