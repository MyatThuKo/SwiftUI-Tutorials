//
//  ContentView.swift
//  WeatherApp
//
//  Created by Myat Thu Ko on 2/15/21.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    @State private var location: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter Location", text: $location)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        getWeather(for: location)
                    }, label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.title2)
                    })
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Weather App")
        }
    }
    
    func getWeather(for location: String) {
        
        // Getting API Key from plist
        guard let filePath = Bundle.main.path(forResource: "Keys", ofType: "plist") else {
            fatalError("Couldn't find file 'Keys.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let apiKey = plist?.object(forKey: "WeatherAPI") as? String else {
            fatalError("Couldn't find key 'WeatherAPI' in 'Keys.plist'.")
        }
        
        
        let apiService = APIService.shared
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM, d"
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude {
                // Don't forget to use your own key
                apiService.getJSON(urlString: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,hourly,alerts&appid=\(apiKey)",
                                   dateDecodingStrategy: .secondsSince1970) { (result: Result<Forecast,APIService.APIError>) in
                    switch result {
                    case .success(let forecast):
                        for day in forecast.daily {
                            print(dateFormatter.string(from: day.dt))
                            print("   Max: ", day.temp.max)
                            print("   Min: ", day.temp.min)
                            print("   Humidity: ", day.humidity)
                            print("   Description: ", day.weather[0].description)
                            print("   Clouds: ", day.clouds)
                            print("   pop: ", day.pop)
                            print("   IconURL: ", day.weather[0].weatherIconURL)
                        }
                    case .failure(let apiError):
                        switch apiError {
                        case .error(let errorString):
                            print(errorString)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
