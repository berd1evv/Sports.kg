//
//  DetailsPresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol DetailsPresenterProtocol: AnyObject {
    func getDetails()
    
    var details: Details? { get }
}

class DetailsPresenter {
    
    var details: Details?
    
    weak var view: DetailsViewProtocol!
    var interactor: DetailsInteractorProtocol!
    var router: DetailsRouterProtocol!

    required init(view: DetailsViewProtocol!) {
        self.view = view
    }
}

// MARK: - DetailsPresenterProtocol
extension DetailsPresenter: DetailsPresenterProtocol {
    func getDetails() {
        interactor.fetchDetails()
    }
    
}

// MARK: - DetailsInteractorOutputProtocol
extension DetailsPresenter: DetailsInteractorOutputProtocol {
    func didReceiveDetails(_ model: Details) {
        details = model
        view.reloadData()
    }
}
