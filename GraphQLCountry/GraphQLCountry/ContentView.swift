//
//  ContentView.swift
//  GraphQLCountry
//
//  Created by Kuldeep on 23/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var countryEmoji = ""
    
    var body: some View {
        Text(countryEmoji).onAppear(perform: {
            Network.shared.apollo.fetch(query: SpecificCountryQuery()) { result in
                switch result {
                case .success(let graphQlResult):
                    DispatchQueue.main.async {
                        //if let emoji = graphQlResult.data?.country?.emoji {
                        self.countryEmoji = (graphQlResult.data?.country!.name)! + " " + (graphQlResult.data?.country!.emoji)!
                        //}
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
