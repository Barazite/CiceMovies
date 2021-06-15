//
//  MoviesView.swift
//  CiceMovies
//
//  Created by cice on 11/06/2021.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel = MoviesPresenterImpl()
    
    var body: some View {
        List{
            Group{
                if self.viewModel.arrayMovies.isEmpty{
                    Text("Cargando")
                }else{
                    CarrouselPostArtView(modelData: self.viewModel.arrayMovies, title: "Carrusel")
                }
            }
            Group{
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)){
                    ForEach(self.viewModel.arrayMovies){ item in
                        PosterCardArtworkView(model: item)
                    }
                }.padding()
            }
        }
        .onAppear(perform: {
            self.viewModel.fetchDataMovies()
        })
        .navigationTitle("Titulo de navegacion")
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
