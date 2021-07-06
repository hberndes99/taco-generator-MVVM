//
//  TacoViewModel.swift
//  MVVM taco generator
//
//  Created by Harriette Berndes on 06/07/2021.
//

import Foundation

protocol TacoVoewModelDelegate {
    func tacoToDisplayUpdated()
}

class TacoViewModel {
    var tacoToDisplay: Taco?
    var tacoTitle: String?
    var delegate: TacoVoewModelDelegate?
    
    init() {
        
    }
    
    // would  this need to be weak self
    func callForTaco() {
        NetworkManager.getRandomTaco { [weak self] taco in
            self?.tacoToDisplay = taco
            if let tacoToDisplay = self?.tacoToDisplay {
                self?.tacoTitle = "\(tacoToDisplay.base_layer.name) with \(tacoToDisplay.mixin.name)"
                self?.delegate?.tacoToDisplayUpdated()
            }
        }
    }
}
