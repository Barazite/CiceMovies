//
//  MenuResources.swift
//  CiceMovies
//
//  Created by cice on 13/06/2021.
//

import SwiftUI


struct MenuResources_Previews: PreviewProvider {
    static var previews: some View {
        PruebaMenu()
        //SlideMenu()
    }
}

struct PruebaMenu: View{
    @State private var selection = 1
    @State private var showDropDown = false
    @State private var showSlide = false
        
    var body: some View{
        
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                VStack{
                    Picker(selection: $selection, label: Text("Picker")) { //Un picker
                        Text("Opcion 1").tag(1)
                        Text("Opcion 2").tag(2)
                    }
                    
                    Menu {//Como contextMenu pero sin difuminar
                        Button {
                            
                        } label: {
                            Text("Linear")
                            Image(systemName: "arrow.down.right.circle")
                        }
                        Button {
                            
                        } label: {
                            Text("Radial")
                            Image(systemName: "arrow.up.and.down.circle")
                        }
                    } label: {
                        Text("Style")
                        Image(systemName: "tag.circle")
                    }.padding()
                    
                    
                    GroupBox { //DropDown sin overlay, alterando la vista
                        DisclosureGroup("Menu 1") {
                            Text("Item 1")
                            Text("Item 2")
                            Text("Item 3")
                        }
                    }.padding()
                    
                    Button(action: { //Dropdown con overlay
                        self.showDropDown.toggle()
                    }, label: {
                        Text("Button")
                        Spacer().frame(width: 50)
                        Image(systemName: self.showDropDown ? "chevron.up" : "chevron.down")
                    })
                    .padding(.horizontal)
                    .frame(height: 30)
                    .overlay(
                        VStack{
                            if showDropDown{
                                Spacer(minLength: 35)
                                ShowingDropDown()
                            }
                        }, alignment: .topLeading
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                    
                    Spacer()
                }
                
                SlideMenu()
                    .frame(width: geometry.size.width/2)
                    .background(Color(red: 32/255, green: 32/255, blue: 32/255))
                    .offset(x: self.showSlide ? 0 : -geometry.size.width)
                    .animation(.default)
                    .edgesIgnoringSafeArea(.all)
            }
            .animation(Animation.easeIn.delay(0.25))
            .gesture(DragGesture().onEnded({ (drag) in
                if drag.translation.width < -100{
                    self.showSlide = false
                }else{
                    self.showSlide = true
                }
            }))
        }
    }
}

struct ShowingDropDown: View{
       
    var body: some View{
        VStack(alignment: .leading, spacing: 4){
            ForEach(options, id: \.self){ item in
                Button(action: {
                    
                }, label: {
                    HStack(alignment: .center, spacing: 8){
                        Image(systemName: "bell")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .clipShape(Circle())
                            .padding(.leading, 5)
                        
                        Text(item)
                        .frame(maxWidth: .infinity)
                        .font(.title)
                        .padding(.all , 5)
                    }
                })
                Divider().background(Color.black)
            }
        }.overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 1)
        )
            
        
    }
}

struct SlideMenu: View{
    
    var body: some View{
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
                Spacer()
            }
            .padding(.top, 100)
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Messages")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            Spacer()
        }.padding(.horizontal)
    }
}
    

var options =  ["1aaaa", "2bbbb", "3cccc", "4dddd", "5eeee", "6ffff"]


