//
//  MainViewController.swift
//  cocoaheads
//
//  Created by Bruno Ramos on 01/02/19.
//  Copyright © 2019 Bruno Ramos. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = "Bem vindo ao Cocoaheads Vitória - ES"
        }
    }
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.setTitle("CLIQUE AQUI!", for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
