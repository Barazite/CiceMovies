//
//  DetalleFashionContentView.swift
//  CiceMovies
//
//  Created by cice on 10/06/2021.
//

import SwiftUI

struct DetalleFashionContentView: View {
    
    var modelData: Row
    @State private var mySize = ""
    @SwiftUI.Environment(\.presentationMode) var presentMode
    
    var body: some View {
        ScrollView{
            VStack{
                ZStack(alignment: .topLeading) {
                    Image(modelData.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 500)
                        //.clipped()
                    
                    HStack{
                        GeometryReader{ proxy in
                            Button(action: {
                                self.presentMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                            }).offset(x: 20, y: 10)
                            
                            Button(action: {}, label: {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                            }).offset(x: proxy.size.width - 80, y: 10)
                            
                            Button(action: {}, label: {
                                Image(systemName: "cart")
                                    .foregroundColor(.black)
                            }).offset(x: proxy.size.width - 40, y: 10)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 20){
                    HStack{
                        VStack(alignment: .leading, spacing: 20) {
                            Text(modelData.name).font(.largeTitle)
                            Text(modelData.price).fontWeight(.heavy)
                        }
                        Spacer()
                        HStack(spacing: 10){
                            Circle().fill(Color.red).frame(width: 20, height: 20)
                            Circle().fill(Color.green).frame(width: 20, height: 20)
                            Circle().fill(Color.blue).frame(width: 20, height: 20)
                        }
                    }
                    
                    Text("Descripcion")
                        .font(.subheadline)
                    
                    Text("Select Size")
                    
                    HStack{
                        ForEach(sizes, id:\.self){ item in
                            Button(action: {
                                self.mySize = item
                            }, label: {
                                Text(item)
                                    .padding().border(Color.black, width: self.mySize == item ? 1.5 : 0)
                            })
                            .foregroundColor(.black)
                        }
                    }
                    
                    HStack{
                        Button(action: {
                            self.presentMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Add to Cart").padding().border(Color.black, width: 1.5)
                        })
                        .foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Buy now").padding()
                        })
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                    }
                    .padding(.bottom, 8)
                }
                .padding([.leading, .trailing], 15)
                .background(rounded().fill(Color.white).shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -10))
                .padding(.top, -10)
                //.shadow(radius: 20)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .padding(.top, 20)
        .edgesIgnoringSafeArea(.top)
    }
}

struct rounded: Shape{
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct DetalleFashionContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleFashionContentView(modelData: Row(id: 0, name: "asdad", image: "p2", price: "€199"))
    }
}
