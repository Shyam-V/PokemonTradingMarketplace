//
//  RegisterView.swift
//  PokemonMarketplaceApp
//
//  Created by Muhammad Osama Naeem on 1/21/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct RegisterView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var errorMessage: String = ""
    @State var isTyping: Bool = false
    @State var showUserDataCreationView: Bool = false
    
    var validation = ValidationServices()
    
    
    var body: some View {
     
        NavigationLink(destination: UserDataCreationView(), isActive: $showUserDataCreationView) {
            EmptyView()
        }
        VStack(alignment: .center) {
            Form {
                Section(header: Text("EMAIL ADDRESS")) {
                    TextField("Email Address", text: $email)
                    
                }
                
                Section(header: Text("Password"), footer: Text(errorMessage).foregroundColor(.red).fixedSize(horizontal: false, vertical: true)) {
                    SecureField("Password", text: $password)
                        .textContentType(.newPassword)
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textContentType(.newPassword)
                }

            }
            Button(action: handleRegisteration) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 45)
                    .overlay(
                        Text("Sign Up")
                            .foregroundColor(.white)
                    )
                    
            }
            .disabled(email.isEmpty)
            .disabled(password.isEmpty)
            .disabled(confirmPassword.isEmpty)
            .padding()
            
            
        }.background(Color(UIColor.secondarySystemBackground))
        .navigationTitle("Register")
        
    }
    
    func handleRegisteration() {
        do {
            let username = try validation.validateEmail(email: email)
            let password = try validation.validatePassword(password: password, confirmPassword: confirmPassword)
            errorMessage = ""
            
            registerNewUserOnFirebase(email: username, password: password)
        }catch {
            print(error.localizedDescription)
            //update the error view
            self.errorMessage = error.localizedDescription
        }
        
    }
    
    func registerNewUserOnFirebase(email: String, password: String) {
        print(email)
        print(password)
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                self.errorMessage = error?.localizedDescription ?? ""
                
            }else {
                let id = result?.user.uid
                self.showUserDataCreationView = true
            }
            
        }
        
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
