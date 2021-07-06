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
        // Do any additional setup after loading the view.
        viewModel = TacoViewModel()
        viewModel?.delegate = self
        viewModel?.callForTaco()
        baseLayerRecipeLabel.text = viewModel?.tacoToDisplay?.base_layer.recipe
        mixinRecipeLabel.text = viewModel?.tacoToDisplay?.mixin.recipe
        titleLabel.text = viewModel?.tacoTitle
    }

    @IBAction func newTacoButton(_ sender: UIBarButtonItem) {
        //print("new taco tapped")
        viewModel?.callForTaco()
    }

}

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

