//
//  LoginView.swift
//  PokemonMarketplaceApp
//
//  Created by Muhammad Osama Naeem on 1/21/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var errorMessage: String = ""
    @State var isTyping: Bool = false
    @AppStorage("loginState") var loginStatus = false
    
    var validation = ValidationServices()
    
    var body: some View {
     
        VStack(alignment: .center) {
            Form {
                Section(header: Text("Please log in"), footer: Text(errorMessage).foregroundColor(.red).fixedSize(horizontal: false, vertical: true)) {
                    TextField("Email Address", text: $email)
                    SecureField("Password", text: $password)
                        .textContentType(.newPassword)
                    
                }
                
                NavigationLink(destination: RegisterView()) {
                    Text("Don't have an account yet? Register here")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }

            }
            Button(action: handleLogInTapped) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 45)
                    .overlay(
                        Text("Log In")
                            .foregroundColor(.white)
                    )
                    
            }
            .disabled(email.isEmpty)
            .disabled(password.isEmpty)
            .padding()
            
            
        }.background(Color(UIColor.secondarySystemBackground))
        .navigationTitle("Log In")
        
    }
    
    func handleLogInTapped() {
        Auth.auth().signIn(withEmail: self.email, password: self.password) { authResult, error in
            if error == nil {
                print("Welcome, \(Auth.auth().currentUser?.uid ?? "")")
                self.loginStatus = true
               // fetchDocuments(id: authResult?.user.uid ?? "")
            }else {
                self.errorMessage = error?.localizedDescription ?? ""
            }
        
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
