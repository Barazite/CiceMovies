//
//  PosterCardArtworkView.swift
//  CiceMovies
//
//  Created by cice on 14/06/2021.
//

import SwiftUI

struct PosterCardArtworkView: View {
    
    var modelData: AppleMoviesViewModel //ResultMovies
    @ObservedObject var urlDownloadImage = MoviesPresenterImpl()
    
    init(model: AppleMoviesViewModel){ //ResultMovies){ Para maquetar
        self.modelData = model
        self.urlDownloadImage.getImageFromUrl(imageUrl: model.artworkUrl100 ?? "")
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Image(uiImage: ((self.urlDownloadImage.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.urlDownloadImage.data))!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 270)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
            
            /*.onAppear(perform: {
             self.urlDownloadImage.getImageFromUrl(imageUrl: modelData.artworkUrl100 ?? "") //O pongo el init o pongo el onAppear con esta linea, mas recomendable el init
             })*/
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top))
                .frame(width: 180, height: 270)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4))
            
            Text(modelData.name ?? "")
                .padding()
                .font(.callout)
                .foregroundColor(.white)
        }
    }
}

/*struct PosterCardArtworkView_Previews: PreviewProvider {
    static var previews: some View {
        PosterCardArtworkView(model: AppleMoviesServerModel.stubbedResultMovie)
    }
}*/
