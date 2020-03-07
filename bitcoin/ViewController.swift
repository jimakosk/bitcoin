//
//  ViewController.swift
//  bitcoin
//
//  Created by dimitris kontos on 5/3/20.
//  Copyright © 2020 dimitris kontos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jpnLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getPrice()
        
    }
    func getPrice(){
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR"){
            URLSession.shared.dataTask(with: url) { (data, response, error ) in
                if let data = data {
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Double] {
                        let jsonDictionary = json
                        DispatchQueue.main.async {
                            
                        
                        if let usdPrice = jsonDictionary["USD"] {
                            self.usdLabel.text = "$\(usdPrice)"
                        
                            }
                            if let eurPrice = jsonDictionary["EUR"] {
                                self.eurLabel.text = "E\(eurPrice)"
                            
                                }
                            if let jpyPrice = jsonDictionary["JPY"] {
                                self.jpnLabel.text = "J\(jpyPrice)"
                            
                                }
                        }
                        
                        
                    }
                }else{
                    print("something goes wor")
                }
                
            }.resume()
        }
    }

    @IBAction func refresh(_ sender: Any) {
        
        getPrice()
    }
    
}

