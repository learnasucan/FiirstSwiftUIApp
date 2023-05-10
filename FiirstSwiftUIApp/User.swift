//
//  User.swift
//  FiirstSwiftUIApp
//
//  Created by Prachit on 10/05/23.
//

import SwiftUI

struct UserList: Codable {
    let users: [User]
    let total: Int
    let skip: Int
    let limit: Int
}

struct User: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let email: String
    let phone: String
    let username: String
    let password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height: Int
    let weight: Double
    let eyeColor: String
    let hair: Hair
    let domain: String
    let ip: String
    let address: Address
    let macAddress: String
    let university: String
    let bank: Bank
    let company: Company
    let ein: String
    let ssn: String
    let userAgent: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

struct Hair: Codable {
    let color: String
    let type: String
}

struct Address: Codable {
    let address: String
    let city: String?
    let coordinates: Coordinates
    let postalCode: String
    let state: String
    
    struct Coordinates: Codable {
        let lat: Double
        let lng: Double
    }
}

struct Bank: Codable {
    let cardExpire: String
    let cardNumber: String
    let cardType: String
    let currency: String
    let iban: String
}

struct Company: Codable {
    let address: Address
    let department: String
    let name: String
    let title: String
}
