//
//  ViewController.swift
//  MVVM taco generator
//
//  Created by Harriette Berndes on 06/07/2021.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: TacoViewModel?
  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var baseLayerRecipeLabel: UILabel!
    @IBOutlet weak var mixinRecipeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = TacoViewModel()
        viewModel?.callForTaco()
        viewModel?.tacoTitle?.bind { [weak self] title in
            DispatchQueue.main.async {
                self?.titleLabel.text = title
            }
        }
        viewModel?.tacoToDisplay?.bind { [weak self] taco in
            print("changed")
            DispatchQueue.main.async {
                self?.baseLayerRecipeLabel.text = taco.base_layer.recipe
                self?.mixinRecipeLabel.text = taco.mixin.recipe
            }
        }
    }

    @IBAction func newTacoButton(_ sender: UIBarButtonItem) {
        viewModel?.callForTaco()
    }

}

/*
extension ViewController: TacoVoewModelDelegate {
    func tacoToDisplayUpdated() {
        DispatchQueue.main.async { [weak self] in
           
            self?.baseLayerRecipeLabel.text = self?.viewModel?.tacoToDisplay?.base_layer.recipe
            self?.mixinRecipeLabel.text = self?.viewModel?.tacoToDisplay?.mixin.recipe
            // unwrap optional
            self?.titleLabel.text = self?.viewModel?.tacoTitle
        }
        
    }
}
*/
