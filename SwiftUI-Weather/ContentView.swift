//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Lucio Gutierrez on 9/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                    CityTextView(cityName: "Apple Valley, CA")
                 
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: isNight ? 48 : 76)
                
                Spacer()
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "wind" : "cloud.sun.fill",
                                   temperature: isNight ? 35 : 72)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: isNight ? "cloud.rain.fill" : "cloud.fog.fill",
                                   temperature: 53)
                    
                    WeatherDayView(dayOfWeek: "THUR",
                                   imageName: "wind.snow",
                                   temperature: 56)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.snow.fill",
                                   temperature: 48)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.bolt.rain.fill",
                                   temperature: 62)
                    
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                    
                }
          Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                //.foregroundStyle(.gray, .yellow, .white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            
            Text("\(temperature)")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//                LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue , isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
        
        // for the code above ^ you can utilize that to create your own extremely customizable gradient, however down below this, is a simple more default gradient to be used as well!
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View{
        Text (cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 190,height: 190)
            
            Text("\(temperature)°")
                .font(.system(size: 90,weight: .medium))
                .foregroundColor(.white)
            
            
        }
    }
}

