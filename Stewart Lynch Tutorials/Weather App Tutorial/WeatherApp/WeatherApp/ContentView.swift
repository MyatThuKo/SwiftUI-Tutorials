//
//  ContentView.swift
//  WeatherApp
//
//  Created by Myat Thu Ko on 2/15/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var forecastListVM = ForecastListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter Location", text: $forecastListVM.location)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        forecastListVM.getWeather()
                    }, label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.title2)
                    })
                }
                List(forecastListVM.forecasts, id: \.day) { day in
                    VStack(alignment: .center) {
                        Text(day.day)
                            .fontWeight(.bold)
                        HStack(alignment: .top) {
                            Image(systemName: "hourglass")
                                .font(.title)
                                .frame(width: 50, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                            
                            VStack(alignment: .leading) {
                                Text(day.overview)
                                HStack {
                                    Text(day.high)
                                    Text(day.low)
                                }
                                HStack {
                                    Text(day.clouds)
                                    Text(day.pop)
                                }
                                Text(day.humidity)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .padding(.horizontal)
            .navigationTitle("Weather App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
