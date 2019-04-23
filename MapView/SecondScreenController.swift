//
//  SecondScreenControllerViewController.swift
//  MapView
//
//  Created by Doan Dat on 4/23/19.
//  Copyright © 2019 Doan Dat. All rights reserved.
//

import UIKit

class SecondScreenController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func reloadInfo(_ info: Int) {
        titleLbl.text = "View detail for address \(info)"
    }
    
}
