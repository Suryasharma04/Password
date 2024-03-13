//
//  ContentView.swift
//  Password
//
//  Created by Surya Sharma on 9/12/23.

import SwiftUI

struct ContentView: View {
    @State var name : String = ""
    @State var password : String = ""
    @State var wrongname = 0
    @State var wrongPassword = 0
    @State var isAuthenticated = false
   // @State var colorChange = false
    
    let allowedNames = ["Victoria", "Paul", "April", "Elizabeth", "Arabella", "Jackson", "Griffin", "Nardos", "Kieran", "Ishmeet", "Vanessa", "Luke", "Warren", "Cassandra", "Amirzhan", "Kaitlyn", "Surya", "Doug"]
    
    var body: some View {
        NavigationView{
            ZStack{
             
                Image("image")
                    .opacity(0.2)
                    .scaledToFill()
                
                VStack{
                    TextField("Username", text: $name)
                        .foregroundColor(.black)
                        .padding(.all)
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.red, lineWidth:CGFloat(wrongname))
                        )
                    
                    SecureFieldVisible(text: $password)
                        .foregroundColor(.black)
                        .padding(.all)
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.red, lineWidth: CGFloat(wrongPassword))
                        )
                    
                    
                    Button {
                        autheticateUser(username: name, password: password)
                        
                    } label: {
                        Text("Log In")
                            .padding(.all)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(password.isEmpty || name.isEmpty ? Color.gray : Color.blue)
                            .cornerRadius(8)
                            .disabled(password.isEmpty && name.isEmpty)
                    }
                    
                    NavigationLink(destination: SuccessView(), isActive: $isAuthenticated) {
                        EmptyView()
                    }
                    
                    if(wrongname != 0) {
                        Text("Incorrect Username")
                            .padding(.all, 10)
                            .foregroundColor(.red)
                            .font(.system(size: 12))
                    }
                    
                    else if(wrongPassword != 0){
                        Text("Incorrect Password")
                            .padding(.all, 10)
                            .foregroundColor(.red)
                            .font(.system(size: 12))
                    }
                    
                }
            }
            .navigationBarHidden(false)
        }
    }
    
    //checks whether the username and password entered are valid
    func autheticateUser(username: String, password: String){
        let trimUsername = username.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        let allowedNames = allowedNames.map { $0.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() }
        
        if allowedNames.contains(trimUsername) {
            wrongname = 0
//            colorChange = true
            if password.lowercased() == "12345678"{
                wrongPassword = 0
                isAuthenticated = true
                
                
            } else{
                wrongPassword = 2
                wrongname = 0
                //colorChange = false
            }
        }
        else{
            wrongname = 2
           // colorChange = false
        }
    }
}

//Makes the password visible and secure when eye symbol is clicked.
struct SecureFieldVisible: View {
    @State private var isTrue: Bool = true
    @Binding var text: String
    
    var body: some View{
        HStack{
            if isTrue{
                SecureField("Password", text: $text)
            }
            else{
                TextField("Password", text: $text)
            }
        }
        .overlay(alignment: .trailing){
            Image(systemName: isTrue ? "eye.slash" : "eye")
                .onTapGesture {
                    isTrue.toggle()
            }
        }
    }
}

//Make previews available for test
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
