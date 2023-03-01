//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Chris Davis on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherView(weatherImage: isNight ? "moon.stars.fill": "cloud.sun.fill", mainTemperature: 76)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "Wed", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "sun.max.fill", temperature: 84)
                    WeatherDayView(dayOfWeek: "Fri", imageName: "sun.max.fill", temperature: 90)
                    WeatherDayView(dayOfWeek: "Sat", imageName: "sun.max.fill", temperature: 95)
                }
                Spacer()
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonText: "Change Time of Day", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Text(dayOfWeek).font(.system(size: 25, weight: .medium, design: .default )).foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°").font(.system(size: 28, weight: .medium, design: .default )).foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default ))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var weatherImage: String
    var mainTemperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: weatherImage).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(mainTemperature)°").font(.system(size: 70, weight: .medium)).foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
