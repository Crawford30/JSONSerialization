//
//  ViewController.swift
//  JSONSERELIZATION
//
//  Created by JOEL CRAWFORD on 16/01/2020.
//  Copyright © 2020 RTS. All rights reserved.
//

import UIKit
//=====model object that reflects what the json object is======
struct RegisterServiceProvider {
    let name: String
    let email: String
    let password: String
    let phone: String
    let confirm_password: String
    
    //===creating constructor using init=====
    init(json: [String: Any]) {
        name = json["name"] as? String ?? ""
        email = json["email"] as? String ?? ""
        password = json["password"] as? String ?? ""
        phone = json["phone"] as? String ?? ""
        confirm_password = json["confirm_password"] as? String ?? ""
        
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //====json url=======
        let jsonURLString = "https://ichuzz2work.com/api/auth/register-public"
        //======url===
        guard let url = URL(string: jsonURLString) else {return}
        //====urlsession to fetch data====
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //====check error =======
            //=====chck status if its 200 , OK====
            
            //=====what is done with the data object returned from the urlsession====
            //=====optional binding for data===
            guard let data =  data else { return }
//            //===converting it to string====
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            //====json serialisation===
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else { return }
                //print(json)
                let ServiceProvider = RegisterServiceProvider(json: json)
                print(ServiceProvider.name)
                
            } catch let jsonErr {
                
                print("error", jsonErr)
            }
            
            
        }.resume()
        
//        let myRegisterServiceProvider =  RegisterServiceProvider(name: "joel Crawford", email: "joel@gmail.com", password: "123456", phone: "077778902922", confirm_password: "123456")
//        print(myRegisterServiceProvider)
    }


}

