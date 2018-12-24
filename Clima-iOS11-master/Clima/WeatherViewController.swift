//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation //allows for use of the gps data
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "7c39a864434654b06cd8e69462f607f6"
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    let WeatherDataObject = WeatherDataModel()

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    func getWeatherData(url: String, parameters: [String:String]){
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                //do things with the returned data
                print("Success! Got the weather data")
                
                //this actually comes from swiftyJSON
                let weatherJSON: JSON = JSON(response.result.value!)
                self.updateWeatherData(json: weatherJSON)
            }
            else {
                //tell user network error
                print("Error \(String(describing: response.result.error))")
                self.cityLabel.text = "Connection Issues"
            }
        }
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    func updateWeatherData(json: JSON){
        //check to see if optional can be safely unwrapped
        if let tempResult = json["main"]["temp"].double {
            WeatherDataObject.tempurature = Int(tempResult - 273.15)
            WeatherDataObject.city = json["name"].stringValue
            WeatherDataObject.condition = json["weather"][0]["id"].intValue
            WeatherDataObject.weatherIconName = WeatherDataObject.updateWeatherIcon(condition: WeatherDataObject.condition)
            
            updateUIWithWeatherata()
        }
        else {
            cityLabel.text = "Weather Unavailable"
        }
    }

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    func updateUIWithWeatherata() {
        cityLabel.text = WeatherDataObject.city
        temperatureLabel.text = String(WeatherDataObject.tempurature)
        weatherIcon.image = UIImage(named: WeatherDataObject.weatherIconName)
    }
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //getting the most accurate location (Hopefully)
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            print("Longtitude = \(location.coordinate.longitude), Latitude = \(location.coordinate.latitude)")
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    func userEnteredNewCityName(city: String) {
        //this means data was successfully passed back from the second view Controller
        let params : [String: String] = ["q" : city, "appId" : APP_ID]
        
        getWeatherData(url: WEATHER_URL, parameters: params)
        
    }

    
    //Write the PrepareForSegue Method here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            
            destinationVC.delegate = self
            
        }
    }
    
    
    
    
}


