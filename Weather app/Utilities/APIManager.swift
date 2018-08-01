//
//  APIManager.swift
//  Weather app
//
//  Created by Izakk Carrillo on 8/1/18.
//  Copyright © 2018 Izakk Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    let apiKeys = APIKeys()
    
    let googleBaseURL = "https://maps.googleapis.com/maps/api/geocode/json?address="
    
    enum APIError: Error {
        case noData
        case noResponse
        case invalidData
    }
    
    func geocode(address: String, onSuccess: @escaping (GeocodingData) -> Void, onError: @escaping (Error) -> Void) {
        
        let url = "\(googleBaseURL)\(address)\(apiKeys.googlekey)"
        
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                guard let geocodingData = GeocodingData(json: json) else {
                    onError(APIError.invalidData)
                    return
                }
                
                onSuccess(geocodingData)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
