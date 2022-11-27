//
//  ContentView.swift
//  Kripto SwiftUI
//
//  Created by Noyan Çepikkurt on 27.11.2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
            
        NavigationView {
            
            List(cryptoListViewModel.cryptoList, id:\.id) { crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.black)
                        .frame(maxWidth : .infinity, alignment: .leading)
                        
                    Text(crypto.price)
                        .foregroundColor(.green)
                        .frame(maxWidth : .infinity, alignment: .leading)
                }
                
            }.navigationTitle(Text("Kripto"))
        }.onAppear {
            cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
