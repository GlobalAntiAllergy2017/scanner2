//
//  DataApi.swift
//  Global Anti-Allergy
//
//  Created by uics15 on 11/11/17.
//  Copyright © 2017 Sarah Pisini. All rights reserved.
//

import Foundation

struct webdescription: Decodable{
    let code : String
    let product : ProductScanned
}
struct ProductScanned: Decodable{
    
    let product_name:String?
    let image_front_small_url:String?
    let ingredients_text_with_allergens: String?
    let image_url:String?
    let additives:String?
    let countries:String?
    let allergens:String?
    let brands:String?
}

func searchinApi(codescanned: String){
    let jsonUrlString = "https://world.openfoodfacts.org/api/v0/product/3396411224584.json"
    guard let url = URL(string:jsonUrlString) else
    {return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        //let dataasString = String(data: data, encoding:.utf8)
        //print (dataasString)
        do {
            let webDescription = try JSONDecoder().decode(webdescription.self, from: data)
            let json = try JSONSerialization.jsonObject(with:data, options:.mutableContainers)
            //print(json)
            print (webDescription.product.product_name!)
            print(webDescription.product.countries!)
            print(webDescription.product.image_front_small_url!)
            print(webDescription.product.ingredients_text_with_allergens)
            //print(webDescription.product.additives)
        } catch let jsonErr {
            print ("error serializinf json:", jsonErr)
        }
        }.resume()
    
    
}
