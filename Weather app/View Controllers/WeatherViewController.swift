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
    
    var weatherData: WeatherData! {
        didSet {
            iconLabel.text = weatherData.condition.icon
            currentTempLabel.text = "\(weatherData.temperature)°"
            highTempLabel.text = "\(weatherData.high)°"
            lowTempLabel.text = "\(weatherData.low)°"
        }
    }
    
    var geocodingData: GeocodingData! {
        didSet {
            locationLabel.text = geocodingData.formattedAddress
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUIWithoutData()
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

    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue) {
    }
}
