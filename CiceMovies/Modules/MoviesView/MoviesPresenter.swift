//
//  MoviesPresenter.swift
//  CiceMovies
//
//  Created by cice on 11/06/2021.
//

import Foundation

protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func dataFromInteractor(data: [ResultMovies])
    func podcastsFromInteractor(data: [ResultPodcast])
}


class MoviesPresenterImpl: BasePresenter, ObservableObject{
    
    @Published var arrayMovies: [AppleMoviesViewModel] = []
    @Published var arrayPodcasts: [ApplePodcastsViewModel] = []
    @Published var data = Data()
    
    var interactor: MoviesInteractorInputProtocol? { return super.baseInteractor as? MoviesInteractorInputProtocol}
    
    func fetchData(){
        self.interactor?.fetchDataMoviesInteractor(top: "top-movies", all: "all", number: "\(10)")
        self.interactor?.fetchDataPodcastsInteractor(top: "top-podcasts", all: "all", number: "\(10)")
    }
    
    func getImageFromUrl(imageUrl: String){
        guard let url = URL(string: imageUrl) else {return}
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

extension MoviesPresenterImpl: MoviesInteractorOutputProtocol{
    func dataFromInteractor(data: [ResultMovies]) {
        self.arrayMovies.removeAll()
        self.arrayMovies = data.map{ AppleMoviesViewModel(businessModel: $0)}
    }
    
    func podcastsFromInteractor(data: [ResultPodcast]){
        self.arrayPodcasts.removeAll()
        self.arrayPodcasts = data.map{ ApplePodcastsViewModel(businessModel: $0)}
    }
    
    
}
