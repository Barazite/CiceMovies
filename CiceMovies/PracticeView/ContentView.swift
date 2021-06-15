//
//  ContentView.swift
//  CiceMovies
//
//  Created by cice on 08/06/2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack(spacing: 15){
            HeaderComponent()
            //CustomTitle(title: "Vistas y Modificadores")
            //Text("Hello, world!")
                //.padding(.top, 10)
            //Text("Hello, world!")
                //.padding()
            
            Button(action: {
                print("Pulse el boton")
            }, label: {
                Text("Boton con sombra")//Podemos añadirle parametros al texto como padding o font tambien, estos parametros pueden sobreescribir los del boton que entren en conflicto
            }).padding()//Estos parametros son para el boton
            .font(.title)
            .foregroundColor(.white)
            .background(Color.blue)
            .shadow(radius: 10)
            
        }
    }
}

struct RefactoringView: View{
    var body: some View{
        ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/){
            VStack(spacing: 20){
                ContentView()
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 100))
                    
                Image("Captura1")
                    .resizable()//MUY recomendable usar
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .overlay(
                        Text("SwiftUI")
                            .font(.title)
                            .foregroundColor(.red)
                    )
                
            }
        }
    }
}

struct Shapes: View {
    var body: some View{
        VStack(spacing: 20){
            HeaderComponent()
            Text("Se puede meter shapes para decorar vistas")
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.blue))
                .padding()
            Text("Se puede ajustar el fondo pero NO con un shape(poligono)")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }
}

struct Vertical: View{
    var body: some View{
        ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/){
            VStack(spacing: 20){
                HeaderComponent()
                
                VStack(alignment: .leading, spacing: 10){
                    Text("VStack dentro de otra VStack")
                    Divider()
                    Text("Esta puede tener subvistas")
                    Divider()
                    Text("Hasta un maximo de 10")
                    Divider()
                    Image(systemName: "arrow.left")
                }
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
                .padding()
                
                VStack(alignment: .trailing, spacing: 10){
                    Text("VStack dentro de otra VStack")
                    Divider()
                    Text("Esta puede tener subvistas")
                    Divider()
                    Text("Hasta un maximo de 10")
                    Divider()
                    Image(systemName: "arrow.left")
                }
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
                .padding()
            }
        }
    }
}

struct HorizontalStackView: View{
    var body: some View{
        ScrollView(.vertical, showsIndicators: true){
            VStack{
                HeaderComponent()
                HStack(spacing: 20){
                    Text("Leading")
                    Text("Middle")
                    Text("Trailing")
                }
                .padding()
                .border(Color.orange)
                
                HStack{
                    Image(systemName: "1.circle").foregroundColor(.blue)
                    Image(systemName: "2.circle").foregroundColor(.red)
                    Image(systemName: "3.circle").foregroundColor(.yellow)
                }
                .padding()
                .font(.title)
                
                HStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 100){
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "a.circle.fill").foregroundColor(.red)
                            })
                            Image(systemName: "b.circle.fill").foregroundColor(.blue)
                            Image(systemName: "c.circle.fill").foregroundColor(.gray)
                            Image(systemName: "d.circle.fill").foregroundColor(.green)
                            Image(systemName: "e.circle.fill").foregroundColor(.orange)
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .frame(maxWidth: .infinity)
                .font(.largeTitle)
                .padding([.top, .bottom], 20)
                .background(Color.yellow)
            }
        }
    }
}

struct AlignmentHStackView: View{
    var body: some View{
        VStack(spacing: 20){
            HeaderComponent()
            HStack{
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.red)
            
            HStack(alignment: .top){
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
                    .padding(.trailing, 50)
            }
            .border(Color.red)
            
            HStack(alignment: .bottom){
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.red)
        }
    }
}

struct HStackPriority: View{
    var body: some View{
        VStack(alignment: .center, spacing: 20){
            HeaderComponent()
            Text(".layoutPriority(1) asigna hacia donde va el equilibrio de la vista")
            
            HStack{
                Text("SwiftUI")
                    .font(.title)
                    .lineLimit(1)
                Image("user1")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title)
                    .layoutPriority(1)
            }
            .padding(.horizontal)
            
            HStack{
                Text("SwiftUI")
                    .font(.title)
                    .layoutPriority(1)
                Image("user1")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title)
                    .lineLimit(1)
            }
            .padding(.horizontal)
            
            HStack{
                Text("SwiftUI")
                    .font(.title)
                    .layoutPriority(1)
                Image("user1")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title)
                    .lineLimit(2)
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

struct ZStackView: View{
    var body: some View{
        ZStack{
            VStack(spacing: 20){
                Spacer()
                HeaderComponent()
                Spacer()
            }
        }
        .background(Color.gray)
        .ignoresSafeArea()
    }
}

struct ZStackAlignment: View{
    var body: some View{
        VStack(spacing: 20){
            HeaderComponent()
            
            ZStack(alignment: .bottomLeading) {
                Image("Captura1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 60)
                
                VStack(alignment: .leading){
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title)
                            .foregroundColor(.red)
                    })
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    
                    Text("Andres")
                        .font(.title)
                        .padding(8)
                }
                .padding(.leading, 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()//.preferredColorScheme(.dark)
        //RefactoringView()
        //Shapes()
        //Vertical()
        //HorizontalStackView().preferredColorScheme(.dark)
        //AlignmentHStackView()
        //HStackPriority()
        //ZStackView()
        ZStackAlignment()
    }
}
