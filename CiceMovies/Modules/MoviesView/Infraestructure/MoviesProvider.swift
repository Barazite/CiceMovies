//
//  MoviesProvider.swift
//  CiceMovies
//
//  Created by cice on 11/06/2021.
//

import Foundation
import Combine

protocol MoviesProviderProtocol {
    func fetchMovies(top: String, all: String, number: String, completionHandler: @escaping (Result <AppleMoviesServerModel, NetworkingError>) -> ())
    func fetchPodcasts(top: String, all: String, number: String, completionHandler: @escaping (Result <ApplePodcastsServerModel, NetworkingError>) -> ())
}



class MoviesProviderImpl: MoviesProviderProtocol{
    let provider: RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchMovies(top: String, all: String, number: String, completionHandler: @escaping (Result <AppleMoviesServerModel, NetworkingError>) -> ()) {
        
        let aux: [CVarArg] = [top, all, number]
        let endpointComplete = String(format: URLEndpoint.endpointMovies, arguments: aux)
        
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEndpoint.baseUrl+endpointComplete )
        
        self.provider.requestGeneric(requestDto: request, entityClass: AppleMoviesServerModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }receiveValue: {  [weak self] responseMovies in
                guard self != nil else { return }
                completionHandler(.success(responseMovies))
            }.store(in: &cancellable)
    }
    
    internal func fetchPodcasts(top: String, all: String, number: String, completionHandler: @escaping (Result <ApplePodcastsServerModel, NetworkingError>) -> ()){
        let aux: [CVarArg] = [top, all, number]
        let endpointComplete = String(format: URLEndpoint.endpointPoscast, arguments: aux)
        
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEndpoint.baseUrl+endpointComplete )
        
        self.provider.requestGeneric(requestDto: request, entityClass: ApplePodcastsServerModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }receiveValue: {  [weak self] responsePodcasts in
                guard self != nil else { return }
                completionHandler(.success(responsePodcasts))
            }.store(in: &cancellable)
    }
}


