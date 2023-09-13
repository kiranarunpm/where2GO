//
//  RegisterModel.swift
//  Where2Go
//
//  Created by Kiran on 10/09/23.
//

import UIKit

struct RegisterModel: Codable{
   let username: String
   let first_name: String
   let last_name: String
   let email: String
   let password: String
   let cpassword: String
   let gender: String
   let nationality: String
   let bio: String
}
