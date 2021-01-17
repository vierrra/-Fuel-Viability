//
//  ViewController.swift
//  ViabilidadeCombustivel
//
//  Created by Renato on 1/16/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageTypeFuel:              UIImageView!
    @IBOutlet weak var priceAlcoholTextField:      UITextField!
    @IBOutlet weak var priceGasolineTextField:     UITextField!
    @IBOutlet weak var showMessageViableFuelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    func calculateViableFuel(princeAlcohol: String, priceGasoline: String) {
        guard let princeAlcohol   = Double(princeAlcohol), let priceGasoline = Double(priceGasoline) else { return }
        
        if priceGasoline <= 0 {
            showMessageViableFuelLabel.text = "Valor da Gasolina tem que ser maior que zero"
        } else {
            let calculeViableFuel = princeAlcohol / priceGasoline
            
            if calculeViableFuel >= 0.7 {
                showMessageViableFuelLabel.text = "Melhor utilizar gasolina"
            } else {
                showMessageViableFuelLabel.text = "Melhor utilizar álcool"
            }
        }
    }
    
    func validateFieldsPrice(priceprinceAlcohol: String, priceGasoline: String) {
        if priceprinceAlcohol.isEmpty && priceGasoline.isEmpty {
            showMessageViableFuelLabel.text = "Preencha os preços do álcool e gasolina"
        } else if priceprinceAlcohol.isEmpty {
            showMessageViableFuelLabel.text = "Preencha o preço do álcool"
        } else if priceGasoline.isEmpty {
            showMessageViableFuelLabel.text = "Preencha o preço do gasolina"
        }
    }

    @IBAction func calculateViableFuelButton(_ sender: Any) {
        guard let priceAlcool   =  priceAlcoholTextField.text else { return }
        guard let priceGasolina =  priceGasolineTextField.text else { return }
        
        self.validateFieldsPrice(priceprinceAlcohol: priceAlcool, priceGasoline: priceGasolina)
        self.calculateViableFuel(princeAlcohol: priceAlcool, priceGasoline: priceGasolina)
    }
}

