//
//  Pokemon.swift
//  PokemonList
//
//  Created by Arkadijs Makarenko on 19/08/2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemon = try? newJSONDecoder().decode(Pokemon.self, from: jsonData)

import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    let cards: [Card]
}

// MARK: - Card
struct Card: Codable {
    let id, name: String
    let nationalPokedexNumber: Int?
    let imageURL, imageURLHiRes: String
    let types: [RetreatCost]?
    let supertype: String?
    let subtype, evolvesFrom, hp: String?
    let number, artist, rarity: String
    let series: Series
    let cardSet: String?
    let setCode: String
    let attacks: [Attack]?
    let weaknesses: [Resistance]?
    let retreatCost: [RetreatCost]?
    let convertedRetreatCost: Int?
    let resistances: [Resistance]?
    let text: [String]?
    let ability: Ability?

    enum CodingKeys: String, CodingKey {
        case id, name, nationalPokedexNumber
        case imageURL = "imageUrl"
        case imageURLHiRes = "imageUrlHiRes"
        case types, supertype, subtype, evolvesFrom, hp, number, artist, rarity, series
        case cardSet = "set"
        case setCode, attacks, weaknesses, retreatCost, convertedRetreatCost, resistances, text, ability
    }
}

// MARK: - Ability
struct Ability: Codable {
    let name, text: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case ability = "Ability"
    case pokéBody = "Poké-Body"
    case pokéPower = "Poké-Power"
}

// MARK: - Attack
struct Attack: Codable {
    let cost: [RetreatCost]
    let name, text, damage: String
    let convertedEnergyCost: Int
}

enum RetreatCost: String, Codable {
    case colorless = "Colorless"
    case darkness = "Darkness"
    case fairy = "Fairy"
    case fighting = "Fighting"
    case fire = "Fire"
    case free = "Free"
    case grass = "Grass"
    case lightning = "Lightning"
    case metal = "Metal"
    case psychic = "Psychic"
    case water = "Water"
}

// MARK: - Resistance
struct Resistance: Codable {
    let type: RetreatCost
    let value: String
}

enum Series: String, Codable {
    case base = "Base"
    case blackWhite = "Black & White"
    case diamondPearl = "Diamond & Pearl"
    case ex = "EX"
    case heartGoldSoulSilver = "HeartGold & SoulSilver"
    case platinum = "Platinum"
    case sunMoon = "Sun & Moon"
    case swordShield = "Sword & Shield"
    case xy = "XY"
}
