//
//  WeatherView.swift
//  WetherApp
//
//  Created by Mohamed Elsaeed on 1/11/23.
//

import UIKit

class WeatherView: UIViewController {
    let weather = WeatherViewModel()

  
    @IBOutlet weak var tempreure: UILabel!
    @IBOutlet weak var feelLike: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherStatuse: UILabel!
    @IBOutlet weak var weatherDate: UILabel!
    @IBOutlet weak var weatherPlace: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("reloaded")
        weather.getWeatherData() { [self] weather in
          
//             var imagePath = String( weather.current.condition.icon.split(separator: "//").last ?? "")
//             print("Image Path: \(imagePath)")
            
             DispatchQueue.main.async {
                 self.tempreure.text = "\(weather.current.tempC)°"
                 self.feelLike.text = "Feel like: \(weather.current.feelslikeC)°"
                 self.weatherStatuse.text = weather.current.condition.text
               
                
                
                 
                 self.weatherPlace.text = weather.location.name
                 self.weatherDate.text = String(weather.current.lastUpdated.split(separator: " ").first ?? "")
             }
             self.setImage(from: URL(string: "https:\(weather.current.condition.icon)")!, to: weatherImage)
            // self.weatherImage.loadFrom(URLAddress: "https:\(weather.current.condition.icon)")
           
        }
      
      
    }
    
    func setImage(from url: URL, to imageView: UIImageView) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }
        task.resume()
    }

   
    @IBAction func reloadButton(_ sender: Any) {
        DispatchQueue.main.async {
            self.viewDidLoad()
        }
    }
}
