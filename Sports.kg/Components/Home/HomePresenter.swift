//
//  HomePresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 4/10/22.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func getSportAreas()
    func showDetails(id: Int)
    
    var sportAreas: [HomeResults] { get }
}

class HomePresenter {
    
    var sportAreas = [HomeResults]()
    weak var view: HomeViewProtocol!
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol!

    required init(view: HomeViewProtocol!) {
        self.view = view
    }
}

// MARK: - HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    func showDetails(id: Int) {
        router.showDetails(id: id)
    }
    
    func getSportAreas() {
        interactor.fetchSportAreas()
    }
}

// MARK: - HomeInteractorOutputProtocol
extension HomePresenter: HomeInteractorOutputProtocol {
    func didReceiveSportAreas(_ model: [HomeResults]) {
        sportAreas = model
        view.reloadData()
    }
}
