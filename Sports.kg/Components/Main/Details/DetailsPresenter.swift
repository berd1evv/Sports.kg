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
    var detail: [Detail] { get }
}

class DetailsPresenter {
    
    var details: Details?
    var detail = [Detail]()
    
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
        detail.append(Detail(title: "Владелец", description: model.admin?.username ?? ""))
        detail.append(Detail(title: "Адрес", description: model.address ?? ""))
        detail.append(Detail(title: "Контакты", description: "\(model.phone_1 ?? "")\n\(model.phone_2 ?? "")"))
    
        view.reloadData()
    }
}
