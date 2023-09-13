//
//  LoginModel.swift
//  Where2Go
//
//  Created by Kiran on 09/09/23.
//

import UIKit

struct LoginRequest: Codable{
    let username: String
    let password: String
}

struct LoginResponse: Codable{
    let status: Bool?
    let message: String?
    let accessToken: String?
    let refreshToken: String?
    let name: String?
    let email: String?
    let image: String?
    let profile_path: String?

}
