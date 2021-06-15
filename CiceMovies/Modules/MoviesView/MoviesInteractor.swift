//
//  MoviesInteractor.swift
//  CiceMovies
//
//  Created by cice on 11/06/2021.
//

import Foundation

protocol MoviesInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataMoviesInteractor(top: String, all: String, number: String)
}

class MoviesInteractorImpl: BaseInteractor{
    weak var presenter: MoviesInteractorOutputProtocol? { return super.basePresenter as? MoviesInteractorOutputProtocol}
    var provider: MoviesProviderProtocol = MoviesProviderImpl()
}

extension MoviesInteractorImpl: MoviesInteractorInputProtocol{
    func fetchDataMoviesInteractor(top: String, all: String, number: String){
        self.provider.fetchMenu(top: top, all: all, number: number){ [weak self] (resultData) in
            guard self != nil else {return}
            switch resultData{
            case .success(let response):
                self?.presenter?.dataFromInteractor(data: response.feed?.results ?? [])
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
