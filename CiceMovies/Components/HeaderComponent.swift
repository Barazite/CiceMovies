//
//  HeaderComponent.swift
//  CiceMovies
//
//  Created by cice on 08/06/2021.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(spacing: 10){//Separacion entre los objetos del Stack
            CustomTitle(title: "Vistas y modificadores")
            CustomSubtitle(subtitle: "Conceptos basicos")
            CustomDescription(customDescription: "Construir una vista en SwiftUI es muy facil y lo que hace es basicamente contener subvistas")
        }//.padding(.vertical, 20)//Padding de todo el objeto VStack
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
    }
}

struct CustomTitle: View{
    var title: String
    var body: some View{
        Text(title)
            .font(.largeTitle)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color.blue)
            .foregroundColor(.black)
            .cornerRadius(25)
            .clipped()
    }
}

struct CustomSubtitle: View{
    var subtitle: String
    var body: some View{
        Text(subtitle)
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}

struct CustomDescription: View {
    var customDescription: String
    var body: some View{
        Text(customDescription)
            .frame(maxWidth: .infinity)
            .font(.body)
            .padding()
            .background(Color.orange)
            .foregroundColor(.black)
    }
}
