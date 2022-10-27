//
//  MapDetailsInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 24/10/22.
//

import Foundation

protocol MapDetailsInteractorProtocol: AnyObject {
    func getLocation()
}

protocol MapDetailsInteractorOutputProtocol: AnyObject {
    func didReceiveLocation(_ model: Map)
}

class MapDetailsInteractor {
    
    var location: Map
    weak var presenter: MapDetailsInteractorOutputProtocol!
    
    required init(presenter: MapDetailsInteractorOutputProtocol!, with model: Map) {
        self.presenter = presenter
        self.location = model
    }
    
}

extension MapDetailsInteractor: MapDetailsInteractorProtocol {
    func getLocation() {
        print(location)
        presenter.didReceiveLocation(location)
    }
}

