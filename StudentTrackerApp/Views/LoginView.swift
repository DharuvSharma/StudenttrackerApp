//
//  LoginView.swift
//  StudentTrackerApp
//
//  Created by Dharuv Sharma on 09/07/25.
//
import SwiftUI

struct UserCredential: Codable {
    let email: String
    let password: String
}

struct LoginView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @AppStorage("currentUserEmail") private var currentUserEmail = ""

    @State private var username = ""
    @State private var password = ""
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var isSignUpMode = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: isSignUpMode ? "person.crop.circle.badge.plus" : "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.purple)

                Text(isSignUpMode ? "Create your account" : "Welcome back")
                    .font(.title2)
                    .fontWeight(.semibold)

                VStack(spacing: 12) {
                    TextField("Username (Gmail)", text: $username)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .textContentType(.username)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)

                    SecureField("Password", text: $password)
                        .textContentType(.password)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                }

                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                }

                Button(action: handleAuthAction) {
                    Text(isSignUpMode ? "Sign Up" : "Login")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                Button(action: {
                    withAnimation {
                        isSignUpMode.toggle()
                        showError = false
                        errorMessage = ""
                    }
                }) {
                    Text(isSignUpMode ? "Already have an account? Log in" : "Don’t have an account? Sign up")
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding(.top, 6)
                }
            }
            .padding()
            .navigationTitle(isSignUpMode ? "Sign Up" : "Login")
        }
    }

    private func handleAuthAction() {
        let email = username.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard email.hasSuffix("@gmail.com") else {
            showError = true
            errorMessage = "Email must end with @gmail.com"
            return
        }

        guard !email.isEmpty, !password.isEmpty else {
            showError = true
            errorMessage = "Please fill in both fields."
            return
        }

        let userDefaultsKey = "users_\(email)"

        if isSignUpMode {
            if UserDefaults.standard.data(forKey: userDefaultsKey) != nil {
                showError = true
                errorMessage = "User already exists. Please log in."
                return
            }
            let newUser = UserCredential(email: email, password: password)
            if let encoded = try? JSONEncoder().encode(newUser) {
                UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
                currentUserEmail = email
                isLoggedIn = true
            } else {
                showError = true
                errorMessage = "Sign up failed."
            }
        } else {
            guard let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
                  let savedUser = try? JSONDecoder().decode(UserCredential.self, from: savedData) else {
                showError = true
                errorMessage = "User not found. Please sign up."
                return
            }
            if savedUser.password == password {
                currentUserEmail = email
                isLoggedIn = true
            } else {
                showError = true
                errorMessage = "Incorrect password."
            }
        }
    }
}
