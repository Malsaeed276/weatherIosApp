//
//  Services.swift
//  WetherApp
//
//  Created by Mohamed Elsaeed on 1/11/23.
//


import Foundation

class APIServices{
    let url = "https://api.weatherapi.com/v1/current.json?key=f46fb6d6acdf4d3e88e84327231101&q=Istanbul&aqi=yes"
    let baseUrl = "https://api.weatherapi.com/v1/current.json?key=f46fb6d6acdf4d3e88e84327231101&q="
    
    
    func getWeatherData(complateData:@escaping (WeatherModel)->()){
        var callUrl = url
      
        
       let task =  URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data, error == nil else {
                print("something get wrong")
                return
            }
            
            var result: WeatherModel?
            do{
                let decoder = JSONDecoder()
                result = try decoder.decode(WeatherModel.self, from: data)
            }catch{
                print("Faild to convert \(error.localizedDescription)")
            }
            
            
            guard let json = result else {
                return
            }
            
           complateData(json)
            print(json.current.feelslikeC)
          
        }
        task.resume()
        
    }
    
   
}
