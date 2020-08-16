//
//  ViewController.swift
//  LoginPage
//
//  Created by kuh on 17/07/20.
//  Copyright © 2020 kuhCompany. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    var homeController: HomeController?
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewLogo.layer.cornerRadius = imageViewLogo.frame.height / 2
        imageViewLogo.contentMode = .scaleAspectFill
        imageViewLogo.clipsToBounds = true
        imageViewLogo.image = UIImage(named: "img-roy")
        labelTitle.text = "Login Page"
        textFieldUserName.placeholder = "username"
        textFieldPassword.placeholder = "password"
        textFieldPassword.isSecureTextEntry = true
        buttonLogin.setTitle("LOGIN", for: .normal)
        buttonLogin.backgroundColor = .blue
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.layer.cornerRadius = 8
        view.backgroundColor = .red
    }
    
    @IBAction func actionButtonLogin(_ sender: Any) {
        viewModel.userName = textFieldUserName.text ?? ""
        viewModel.password = textFieldPassword.text ?? ""
        viewModel.login(successHandler: {
            self.pushToHome()
        }, errorHandler: { error in
            print(error)
        })
        view.endEditing(true)
    }
    
    func pushToHome() {
        homeController = HomeController()
        guard let homeController = homeController else { return }
        navigationController?.pushViewController(homeController, animated: true)
    }
    
}

