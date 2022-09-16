//
//  LoginController.swift
//  E-Leave
//
//  Created by USER-MAC-GLIT-007 on 15/09/22.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var secondWelcomeLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField! {
        didSet {
            usernameTextField.placeholder = "Username [NIK]"
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.placeholder = "password"
        }
    }
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        }
    }
    @IBOutlet weak var revealPasswordImageView: UIImageView! {
        didSet {
            revealPasswordImageView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(revealPasswordImageViewAction))
            revealPasswordImageView.addGestureRecognizer(tapGesture)
        }
    }
    
    
    var flagRevealPassword: Bool = false
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @objc func signInButtonAction(_ sender: UIButton) {
        let tabbarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarController") as! TabbarController
        self.view.window?.rootViewController = tabbarController
        self.view.window?.makeKeyAndVisible()
    }
    
    @objc func revealPasswordImageViewAction(_ sender: UITapGestureRecognizer) {
        flagRevealPassword = !flagRevealPassword
        
        if flagRevealPassword {
            self.passwordTextField.isSecureTextEntry = false
            self.revealPasswordImageView.image = UIImage(systemName: "eye.slash.fill")
        } else {
            self.passwordTextField.isSecureTextEntry = true
            self.revealPasswordImageView.image = UIImage(systemName: "eye.fill")
        }
    }
}
