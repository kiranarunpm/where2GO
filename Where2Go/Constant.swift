//
//  Constant.swift
//  Where2Go
//
//  Created by Kiran on 03/09/23.
//

import Foundation

enum SaveData: String{
    case accessToken
    case fullname
    case email
    case mobile
    case walkthough
}

class User{
    
    static var shared: User = User()
    var tokenKey : String = "accessToken"
    var doneWalkthough : String = "doneWalkthough"

    
    private let defaults = UserDefaults.standard
    
    // ********* Get Data **********
    
    var hasToken: Bool{
        return token == "3" ? false : true
    }

    var token: String {
        print("token: ",defaults.string(forKey: SaveData.accessToken.rawValue) ?? "")
        return defaults.string(forKey: tokenKey) ?? ""
    }
    
    var walkThought: Bool {
        return defaults.bool(forKey: SaveData.walkthough.rawValue)
    }
    
    // ********* Save Data **********
    
    func saveData(with key: SaveData, value: String){
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    func saveWalkthrough(with key: SaveData, value: Bool){
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
}
