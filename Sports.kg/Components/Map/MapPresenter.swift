//
//  MapPresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol MapPresenterProtocol: AnyObject {
    func getAllLocations()
    
    var locations: [Map] { get }
}

class MapPresenter {
    
    var locations = [Map]()
    
    weak var view: MapViewProtocol!
    var interactor: MapInteractorProtocol!
    var router: MapRouterProtocol!

    required init(view: MapViewProtocol!) {
        self.view = view
    }
}

// MARK: - MapPresenterProtocol
extension MapPresenter: MapPresenterProtocol {
    func getAllLocations() {
        interactor.fetchAllLocations()
    }
}

// MARK: - MapInteractorOutputProtocol
extension MapPresenter: MapInteractorOutputProtocol {
    func didReceiveLocations(_ locations: [Map]) {
        self.locations = locations
        view.reloadData()
    }
}
