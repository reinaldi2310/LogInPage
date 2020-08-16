//
//  LoginViewModel.swift
//  LoginPage
//
//  Created by kuh on 16/08/20.
//  Copyright © 2020 kuhCompany. All rights reserved.
//

import Foundation

struct User {
    static let userName = "user"
    static let password = "123"
}

class LoginViewModel {
    var userName: String = ""
    var password: String = ""
    
    func login(successHandler: @escaping ()->Void, errorHandler: @escaping (String)->Void) {
        if userName != User.userName {
            errorHandler("error username")
            return
        }
        if password != User.password {
            errorHandler("error password")
            return
        }
        successHandler()
    }
}
