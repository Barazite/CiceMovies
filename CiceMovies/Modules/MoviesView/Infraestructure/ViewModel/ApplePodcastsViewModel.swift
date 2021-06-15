//
//  ApplePodcastsViewModel.swift
//  CiceMovies
//
//  Created by cice on 15/06/2021.
//

import Foundation

struct ApplePodcastsViewModel: Identifiable {
    let id: String?
    let name: String?
    let artworkUrl100: String?
    
    init(businessModel: ResultPodcast){
        self.id = businessModel.id
        self.name = businessModel.name
        self.artworkUrl100 = businessModel.artworkUrl100
    }

}
