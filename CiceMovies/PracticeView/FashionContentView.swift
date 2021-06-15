//
//  FashionContentView.swift
//  CiceMovies
//
//  Created by cice on 10/06/2021.
//

import SwiftUI

struct CustomNavigation: View{
    var body: some View{
        ZStack{
            HStack(spacing: 15){
                Button(action: {
                    
                }, label: {
                    Image("Menu")
                        //.renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                })
                
                Spacer()
                Text("Seasons")
                    .font(.title)
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "alarm")
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "cart")
                })
            }
            .font(.callout)
            .foregroundColor(.black)
        }
        .background(Color.white)
        .padding([.leading, .trailing], 5)
    }
}

struct DetailScroll: View{
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(datas) { item in
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    ForEach(item.myRows){ itemX in
                        NavigationLink(
                            destination: DetalleFashionContentView(modelData: itemX),
                            label: {
                                CardCarrousel(modelData: itemX)
                            }).buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct CardCarrousel: View{
    var modelData: Row
    
    var body: some View{
        VStack(spacing: 20){
            Image(modelData.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 200)
                .border(Color.black, width: 1)
            HStack{
                VStack(alignment: .leading, spacing: 10, content: {
                    Text(modelData.name).font(.headline).padding(.leading, 8).lineLimit(1)
                    Text(modelData.price).fontWeight(.heavy).padding(.leading, 8)
                })
                Spacer()
                Button(action: {}, label: {
                    Image("Options")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                })
                .padding(.trailing, 8)
                .contextMenu(ContextMenu(menuItems: {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                }))
            }
        }
    }
}

struct CustomMainView: View{
    @State private var selected = "Dress"
    @State private var showDropDown = false
    
    var body: some View{
        VStack(spacing: 20){
            HStack{
                Button(action: {
                    self.showDropDown.toggle()
                }, label: {
                    HStack{
                        Text("Casual Dress")
                            .font(.headline)
                        Spacer()
                        Image(systemName: self.showDropDown ? "chevron.up" : "chevron.down")
                            .font(.title3)
                    }
                    .padding()
                })
                .foregroundColor(.black)
                .overlay(
                    VStack{
                        if self.showDropDown{
                            Spacer(minLength: 40)
                            //DropDown()
                        }
                    }
                )
                
                Button(action: {}, label: {
                    Image(systemName: "slider.horizontal.3")
                        .padding()
                })
                .foregroundColor(.black)
                .contextMenu(ContextMenu(menuItems: {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                }))
            }
            .frame(height: 30)
            
            HStack{
                ForEach(types, id: \.self){ item in
                    HStack{
                        Button(action: {
                            self.selected = item
                        }, label: {
                            Text(item)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                                .padding()
                        })
                        .foregroundColor(self.selected == item ? .white : .black)
                        .background(self.selected == item ? Color.black : Color.clear)
                        .cornerRadius(10)
                    }
                }
            }
            DetailScroll()
        }
        .padding([.leading, .trailing], 8)
        .background(Color.white)
    }
}

struct DropDown: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 0) {
            ForEach(types, id: \.self){ option in
                Text(option)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
            .stroke(Color.black, lineWidth: 1)
        )
    }
}

struct FashionContentView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                CustomNavigation()
                CustomMainView()
            }.onAppear(perform: {
                //viewDidLoad
            })
            .navigationBarHidden(true)
        }
    }
}

struct FashionContentView_Previews: PreviewProvider {
    static var previews: some View {
        FashionContentView()
        //DetailScroll()
    }
}

//MARK: - Model Data

struct type: Identifiable {
    var id: Int
    var myRows: [Row]
}

struct Row: Identifiable{
    var id: Int
    var name: String
    var image: String
    var price: String
}

var sizes = ["S", "M", "L", "XL"]
var types = ["Dress", "Pants", "Blazers", "Jackets"]
var datas = [type(id: 0, myRows: [Row(id: 0, name: "Fit And Flare", image: "p1", price: "€199"),
                                 Row(id: 1, name: "Fit And Summer", image: "p2", price: "€399"),
                                 Row(id: 2, name: "Empire And Flare", image: "p3", price: "€299"),
                                 Row(id: 3, name: "Fit And Vibes", image: "p4", price: "€99"),
                                 Row(id: 4, name: "Empire And Vibes", image: "p5", price: "€599"),
                                 Row(id: 5, name: "Fit And Empire", image: "p1", price: "€199")])]

