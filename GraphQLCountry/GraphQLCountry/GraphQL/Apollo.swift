//
//  Apollo.swift
//  GraphQLCountry
//
//  Created by Kuldeep on 23/06/21.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "http://countries.trevorblades.com/")!)
}
