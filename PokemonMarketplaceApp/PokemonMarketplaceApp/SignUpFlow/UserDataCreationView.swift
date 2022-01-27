//
//  UserDataCreationView.swift
//  PokemonMarketplaceApp
//
//  Created by Muhammad Osama Naeem on 1/23/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct UserDataCreationView: View {
    @State var fullName: String = ""
    @State var phoneNumber: String = ""
    @AppStorage("loginState") var loginStatus = false
    
    var db = Firestore.firestore()
    var body: some View {
        VStack {
            Form {
                HStack {
                    Spacer()
                    Image("dummy-person-image")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(lineWidth: 5).foregroundColor(.gray))
                    .clipShape(Circle())
                    Spacer()
                }.padding()
                
                    
                TextField("Full Name", text: $fullName)
                Text(Auth.auth().currentUser?.email ?? "example@example.com").foregroundColor(.gray)
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                
            }
            
            Button(action:
                    createUserProfile
            
            ) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 45)
                    .overlay(
                        Text("Continue")
                            .foregroundColor(.white)
                    )
                    
            }.padding()
        }.navigationTitle("Create your Profile")
    }
    
    func createUserProfile() {
        do {
            let userid = Auth.auth().currentUser?.uid
            let user = UserDataModel(id: userid, fullName: fullName, email: Auth.auth().currentUser?.email, phoneNumber: phoneNumber)
            let _ = try db.collection("Users").addDocument(from: user)
            
            self.loginStatus = true
        }catch {
            print(error)
        }
    }
}

struct UserDataCreationView_Previews: PreviewProvider {
    static var previews: some View {
        UserDataCreationView()
    }
}
