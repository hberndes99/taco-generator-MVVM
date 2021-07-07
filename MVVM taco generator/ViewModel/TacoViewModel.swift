//
//  TacoViewModel.swift
//  MVVM taco generator
//
//  Created by Harriette Berndes on 06/07/2021.
//

import Foundation

/*
protocol TacoVoewModelDelegate {
    func tacoToDisplayUpdated()
}
*/
 
class TacoViewModel {
    // can i do this without initialising an empty 
    var tacoToDisplay: Box<Taco>? = Box(value: Taco(shell: Shell(name: "", recipe: ""), base_layer: BaseLayer(name: "", recipe: ""), seasoning: Seasoning(name: "", recipe: ""), mixin: Mixin(name: "", recipe: "")))
    var tacoTitle: Box<(String)>? = Box(value: "")

    
    init() {
        
    }
    
    // would  this need to be weak self
    func callForTaco() {
        NetworkManager.getRandomTaco { [weak self] taco in
            self?.tacoToDisplay?.value = taco
            if let baseLayerName = self?.tacoToDisplay?.value.base_layer.name, let mixinName = self?.tacoToDisplay?.value.mixin.name {
                self?.tacoTitle?.value = "\(baseLayerName) with \(mixinName)"
            }
            if let tacoToDisplay = self?.tacoToDisplay {
                print(tacoToDisplay.value)
            }
           
        }
    }
}
