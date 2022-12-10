//
//  ViewController.swift
//  Homework 4
//
//  Created by MacBook Pro on 07.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = Bundle.main.url(forResource: "RawData", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: filePath)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Company.self, from: data)
                print(jsonData.companyDescription)
                
                if let modelNumber = jsonData.listOfData.first?.modelNumber {
                    print("Модель \(modelNumber)")
                }
                
                if let countries = jsonData.listOfData.first?.countries.last {
                    print("Страна \(countries)")
                }
                
                if let name = jsonData.listOfData.last?.price.regions.first?.name {
                    print("Регион \(name)")
                }
                
                if let price = jsonData.listOfData.last?.price.regions.last?.price {
                    print("Цена \(price)$")
                }
            } catch {
                print(error)
            }
        }
    }
}

