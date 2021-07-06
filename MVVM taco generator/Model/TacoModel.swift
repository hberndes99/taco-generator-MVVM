//
//  TacoModel.swift
//  MVVM taco generator
//
//  Created by Harriette Berndes on 06/07/2021.
//

import Foundation

struct Taco: Codable {
    var shell: Shell
    var base_layer: BaseLayer
    var seasoning: Seasoning
    var mixin: Mixin
}

struct Shell: Codable {
    var name: String
    var recipe: String
}

struct BaseLayer: Codable {
    var name: String
    var recipe: String
}

struct Seasoning: Codable {
    var name: String
    var recipe: String
}

struct Mixin: Codable {
    var name: String
    var recipe: String
}
