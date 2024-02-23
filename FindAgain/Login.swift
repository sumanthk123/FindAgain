import Foundation
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("FindAgain")
                        .font(.system(size: 40, weight: .heavy, design: .serif).italic())
                        .padding(.bottom, 70)
                        .padding(.top, 150)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .frame(width: 370, height: 40)
                        .cornerRadius(5.0)
                        .padding(.bottom, 5)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .frame(width: 370, height: 40)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    
                    Button(action: loginAction) {
                        Text("Log In")
                            .foregroundColor(.white)
                            .frame(width: 370, height: 40)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .padding(.bottom, 350)
                    }
                    
                    Divider()
                        .background(Color.black)
                    
                    
                    
                    
                    HStack {
                        Text("Don't have an account?").fontWeight(.heavy)
                        Text("Sign Up").foregroundColor(.blue)
                            .fontWeight(.heavy)
                            .onTapGesture {
                            signupAction() // Make sure to add this action to your Sign Up text.
                        }
                    }
                }
            }
            .background(
                Image("lol") // Use the image as a background
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func loginAction() {
        // Handle the login logic here
        print("Login attempt...")
    }
    
    func signupAction() {
        // Handle the signup logic here
        print("Signup attempt...")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
