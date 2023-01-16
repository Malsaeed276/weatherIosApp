//
//  WeatherViewModel.swift
//  WetherApp
//
//  Created by Mohamed Elsaeed on 1/12/23.
//

import Foundation

class WeatherViewModel {
    var apiServices = APIServices()
    var weatherData :WeatherModel? = nil
    
    
    // get weather
    func getWeatherData( complate: @escaping (WeatherModel)->()){
        apiServices.getWeatherData() { data in
           complate(data)
        }
    
    }
    //update weather (string)
    //update automaticly
}
