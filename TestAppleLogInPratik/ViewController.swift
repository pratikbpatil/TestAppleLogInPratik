//
//  ViewController.swift
//  TestAppleLogInPratik
//
//  Created by Apple on 30/03/20.
//  Copyright © 2020 Pratik Patil. All rights reserved.
//

import UIKit
import AuthenticationServices

@available(iOS 13.0, *)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupSOAppleSignIn() // For Sign In With Apple Button
    }

    
    func setupSOAppleSignIn() {

            let btnAuthorization = ASAuthorizationAppleIDButton()

            btnAuthorization.frame = CGRect(x: 0, y: 0, width: 200, height: 40)

            btnAuthorization.center = self.view.center

            btnAuthorization.addTarget(self, action: #selector(actionHandleAppleSignin), for: .touchUpInside)

            self.view.addSubview(btnAuthorization)

        }

    @objc func actionHandleAppleSignin() {

            let appleIDProvider = ASAuthorizationAppleIDProvider()

            let request = appleIDProvider.createRequest()

            request.requestedScopes = [.fullName, .email]

            let authorizationController = ASAuthorizationController(authorizationRequests: [request])

            authorizationController.delegate = self

            authorizationController.presentationContextProvider = self

            authorizationController.performRequests()

        }

}



@available(iOS 13.0, *)
extension ViewController: ASAuthorizationControllerDelegate {

     // ASAuthorizationControllerDelegate function for authorization failed

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {

        print(error.localizedDescription)

    }

       // ASAuthorizationControllerDelegate function for successful authorization

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {

        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {

            // Create an account as per your requirement

            let appleId = appleIDCredential.user

            let appleUserFirstName = appleIDCredential.fullName?.givenName

            let appleUserLastName = appleIDCredential.fullName?.familyName

            let appleUserEmail = appleIDCredential.email

            //Write your code
//            DispatchQueue.main.sync {
                
                let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                let info = " Apple ID : \(appleId)\n First Name : \(appleUserFirstName!)\n Last Name : \(appleUserLastName!) \n Email ID : \(appleUserEmail!)"
                vc.detailsOfUser = info
                self.navigationController?.pushViewController(vc, animated: true)
            
//            self.present(vc, animated: true, completion: nil)
//            }
            

        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {

            let appleUsername = passwordCredential.user

            let applePassword = passwordCredential.password

            //Write your code

        }

    }

}

@available(iOS 13.0, *)
extension ViewController: ASAuthorizationControllerPresentationContextProviding {

    //For present window

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {

        return self.view.window!

    }

}
