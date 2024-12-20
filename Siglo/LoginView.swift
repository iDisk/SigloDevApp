//
//  ContentView.swift
//  Siglo
//
//  Created by Héctor Reyes on 19/12/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isAuthenticated = false;

    var body: some View {
        VStack {
            Text("Iniciar Sesión")
                .font(.largeTitle)
                .padding()
            
            TextField("Correo electrónico", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .keyboardType(.emailAddress)
            
            SecureField("Contraseña", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Button(action: {
                // Llamada a la API para iniciar sesión
                authenticateUser(email: email, password: password)
            }) {
                Text("Iniciar Sesión")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            .alert(isPresented:$showAlert){
                Alert(title:Text("Error"),message:Text(alertMessage),dismissButton:.default(Text("Aceptar")))
            }
            NavigationLink(destination:HomeView(), isActive: $isAuthenticated){
                EmptyView()
            }
                      
                      
            Button(action: {
                // Acciones para recuperar contraseña
            }) {
                Text("¿Olvidaste tu contraseña?")
            }
        }
        .padding()
    }
    
    func authenticateUser(email: String, password: String) {
        // Lógica de la API para autenticar al usuario
        guard !email.isEmpty, !password.isEmpty else {
            alertMessage = "Por favor completa los campos"
            showAlert = true
            return
        }
        
        // Simulación de autenticación
        if email == "user@siglo.com.mx" && password == "password" {
            isAuthenticated = true;
          
        } else {
            alertMessage = "Correo o contraseña incorrectos"
            showAlert = true
        }
    }
}

#Preview {
    LoginView()
}
