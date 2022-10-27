//
//  MapInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol MapInteractorProtocol: AnyObject {
    func fetchAllLocations()
}

protocol MapInteractorOutputProtocol: AnyObject {
    func didReceiveLocations(_ locations: [Map])
}

class MapInteractor {
    
    weak var presenter: MapInteractorOutputProtocol!
    let networkService = NetworkService.shared
    
    required init(presenter: MapInteractorOutputProtocol!) {
        self.presenter = presenter
    }
    
}

extension MapInteractor: MapInteractorProtocol {
    func fetchAllLocations() {
        networkService.sendRequest(urlRequest: MapNetworkRouter.getAllLocations.createURLRequest(), successModel: [Map].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.presenter.didReceiveLocations(model)
            case .badRequest(let error):
                debugPrint(#function, error)
            case .failure(let error):
                debugPrint(#function, error)
            case .unauthorized(let error):
                debugPrint(#function, error)
            case .notFound(let error):
                debugPrint(#function, error)
            }
        }
    }
}

