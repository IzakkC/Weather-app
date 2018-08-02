//
//  WeatherViewController.swift
//  Weather app
//
//  Created by Izakk Carrillo on 8/1/18.
//  Copyright © 2018 Izakk Carrillo. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUIWithoutData()
        
        let apiManager = APIManager()
        apiManager.getWeather(latitude: 38.2527, longitude: -85.7585, onSuccess: { (WeatherData) in
            
        }) { (error) in
            
        }
    }

    func setupUIWithoutData() {
        locationLabel.text = ""
        iconLabel.text = "☂️"
        currentTempLabel.text = "Enter a location!"
        highTempLabel.text = "-"
        lowTempLabel.text = "-"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
