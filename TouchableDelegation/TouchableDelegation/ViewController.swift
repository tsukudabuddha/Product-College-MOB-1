//
//  ViewController.swift
//  TouchableDelegation
//
//  Created by Eliel A. Gordon on 10/5/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, touchDelegate {
    
    func touchAction() {
        print("Tapped")
    }
    

    @IBOutlet weak var touchableView: TouchbleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        touchableView.delegate = self
    }
    
    
}

