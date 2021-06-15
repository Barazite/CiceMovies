//
//  ControlViews.swift
//  CiceMovies
//
//  Created by cice on 09/06/2021.
//

import SwiftUI

struct ControlViews: View {
    
    @State private var showAlert = false
    @State private var showActionSheet = false
    @State private var showCustomAlert = false
    
    @State private var titleButton = "Hola"
    
    var body: some View {
        ZStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20){
                    HeaderComponent()
                    Divider()
                    
                    
                    CustomButton(showAlertUno: self.$showAlert)//Le pasamos la direccion de memoria
                        .alert(isPresented: self.$showAlert, content: {
                            Alert(title: Text("Holaa"),
                                  message: Text("Aqui los chicos de CICE"),
                                  primaryButton: .default(Text("OK")),
                                  secondaryButton: .cancel())
                        })
                    
                    Button(action: {
                        self.showActionSheet.toggle()//Invierte el valor de la variable booleana
                    }, label: {
                        HStack{
                            Image(systemName: "play")
                            Text(self.showActionSheet ? titleButton : "Show Action Sheet")
                        }
                        .font(.title)
                        .foregroundColor(.black)
                        .actionSheet(isPresented: self.$showActionSheet, content: {
                            ActionSheet(title: Text("Action Sheet"),
                                        message: Text("Esta es una hoja de acciones"),
                                        buttons: [.default(Text("Boton1"), action:{
                                            self.titleButton = "Otro texto"
                                        }), .default(Text("Boton 2"), action: {
                                            //
                                        }), .cancel()])
                        })
                    })
                    
                    Button(action: {
                        self.showCustomAlert.toggle()
                    }, label: {
                        HStack{
                            Image(systemName: "folder")
                            Text("Custom popup")
                        }
                        .font(.title)
                        .foregroundColor(.black)
                    })
                }
            }
            .blur(radius: self.showCustomAlert ? 10 : 0) //Difumina el Scroll en caso de que showCustomAlert sea true
            
            if self.showCustomAlert{
                CustomPopupView(showingCustomPopup: self.$showCustomAlert)
            }
            /*Text(self.showActionSheet ? "Hola": "Adios")
            if self.showActionSheet{
                Text("Hola")
            }else{
                Text("Adios")
            }*/
            
        }
    }
}

struct CustomButton: View {
    @Binding var showAlertUno: Bool //Puntero
    
    var body: some View{
        Button(action: {
            self.showAlertUno.toggle()
        }, label: {
            HStack{
                Image(systemName: "play.fill")
                Text("Alert View")
            }
            .font(.title)
            .foregroundColor(.black)
        })
    }
}

struct CustomPopupView: View{
    
    @Binding var showingCustomPopup: Bool
        
    var body: some View{
        ZStack{
            Color.black.opacity(0.7)
                .ignoresSafeArea()
            VStack(spacing: 20){
                Text("Custom Popup")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    self.showingCustomPopup = false
                }, label: {
                    Text("Cerrar")
                })
                .padding()
            }
            .frame(width: 300, height: 300)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
}

struct HeaderCustomView: View{
    
    var nombre: String
    var imagen: String
    
    var body: some View{
        HStack{
            Image(systemName: imagen)
                .padding(.trailing)
            Text(nombre)
        }
        .padding()
        .font(.title)
        .foregroundColor(.red)
    }
}

struct FormView: View{
    
    @State private var toggle = false
    @State private var myTextField = ""
    @State private var myDatePicker = Date()
    
    var body: some View{
        Form{
            Section{
                HeaderComponent()
            }
            
            Section(header: Text("Cabecera de la seccion")) {
                Text("Como veis se puede añadir un texto a la cabecera")
            }
            
            Section(header: HeaderCustomView(nombre: "Contactos", imagen: "person.2.square.stack.fill")) {
                Text("Aqui un ejemplo de cabecera de imagen con texto")
            }
            
            Section{
                Button(action: {
                    
                }, label: {
                    Text("Button")
                })
                Toggle(isOn: self.$toggle, label: {
                    Text("Toggle")
                })
                
                Stepper(
                    onIncrement: { },
                    onDecrement: {  },
                    label: {
                        Text("Stepper")
                    })
                TextField("Este es un textfield", text: self.$myTextField)
                Text(self.myTextField)
                Image(systemName: "leaf.arrow.circlepath")
                Circle()
                DatePicker("Datepicker", selection: self.$myDatePicker, displayedComponents: [.date, .hourAndMinute])
            }
            
            
        }
    }
}

struct ControlViews_Previews: PreviewProvider {
    static var previews: some View {
        //ControlViews()
        //CustomButton(showAlertUno: .constant(true))
        //CustomPopupView(showingCustomPopup: .constant(true))
        FormView()
    }
}
