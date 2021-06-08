//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    @IBOutlet weak var txtEmail: TextFieldPadding!
    @IBOutlet weak var txtPassword: TextFieldPadding!

    // MARK: - Properties
    private var client: LoginClient?
    private var isCalled: Bool = false
    private var timeSent: TimeInterval = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        let email = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""

        if email.isEmpty {
            showAlert(title: "Warning", message: "Please fill in email", handlerOk: nil)
            return
        }
        if password.isEmpty {
            showAlert(title: "Warning", message: "Please fill in password", handlerOk: nil)
            return
        }
        if isCalled { return }

        /// Save Sending Time
        timeSent = Date().timeIntervalSince1970

        let stReqLogin = StReqLogin()
        stReqLogin.email = email
        stReqLogin.password = password

        let loginClient = LoginClient()
        loginClient.login(withEmail: stReqLogin, completion: { (stRspLogin) in
            self.isCalled = false
            if stRspLogin == nil {
                self.showAlert(title: "Warning", message: "Login is failed", handlerOk: nil)
                return
            }
            var gap = Date().timeIntervalSince1970 - self.timeSent
            gap = round(gap * 1000)
            self.showAlert(
                title: "Success",
                message: "It took \(gap)ms",
                handlerOk: { action in
                    self.backAction(action)
                }
            )
        },
        withError: { error in
            self.isCalled = false
            self.showAlert(title: "Warning", message: "An error happened while login", handlerOk: nil)
        })

    }


    func showAlert(title: String, message: String, handlerOk: ((UIAlertAction) -> Void)?) {
        DispatchQueue.main.async {
            let alertController: UIAlertController = UIAlertController(
                title  : title,
                message: message,
                preferredStyle: UIAlertController.Style.alert
            )
            let alertAction: UIAlertAction = UIAlertAction(
                title  : "OK",
                style  : UIAlertAction.Style.default,
                handler: handlerOk
            )
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
