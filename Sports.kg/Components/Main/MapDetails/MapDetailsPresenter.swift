//
//  MapDetailsPresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 24/10/22.
//

import Foundation

protocol MapDetailsPresenterProtocol: AnyObject {
    func locationInfo()
    func showDetails(id: Int)
    
    var location: Map? { get }
}

class MapDetailsPresenter {
    
    var location: Map?
    weak var view: MapDetailsViewProtocol!
    var interactor: MapDetailsInteractorProtocol!
    var router: MapDetailsRouterProtocol!

    required init(view: MapDetailsViewProtocol!) {
        self.view = view
    }
}

// MARK: - MapDetailsPresenterProtocol
extension MapDetailsPresenter: MapDetailsPresenterProtocol {
    func showDetails(id: Int) {
        router.showDetails(id: id)
    }
    
    func locationInfo() {
        interactor.getLocation()
    }
}

// MARK: - MapDetailsInteractorOutputProtocol
extension MapDetailsPresenter: MapDetailsInteractorOutputProtocol {
    func didReceiveLocation(_ model: Map) {
        location = model
        view.setData()
    }
}
