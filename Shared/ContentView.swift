//
//  ContentView.swift
//  Shared
//
//  Created by Jason Wise on 2/7/22.
//

import SwiftUI

struct ContentView: View {
    @State private var zipcode = ""
    @State var results = [WeatherData]()
    var body: some View {

        VStack{
            TextField("What is your zip code?", text: $zipcode)
                .padding()
                .border(Color.black)
            Label {
                TextField("Your zip code is", text: $zipcode)
            } icon: {
                Circle()
                    .frame(width: 44, height: 44, alignment: .center)
            }
            List(results, id: \.id) { item in
                        VStack(alignment: .leading) {
                            Text(item.weather)
                        }
                    }
            
        }
        .padding()
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=ade7e8d18df762ced2529716f2a237d4"
    ) else {
                    print("Invalid URL")
                    return
                }
                let request = URLRequest(url: url)
                
        URLSession.shared.dataTask(with: request) {
            data, response, error in
        }
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data {
                        if let response = try? JSONDecoder().decode([WeatherData].self, from: data) {
                            DispatchQueue.main.async {
                                self.results = response
                            }
                            return
                        }
                    }
                }.resume()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
