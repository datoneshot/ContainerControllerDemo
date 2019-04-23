//
//  ViewController.swift
//  MapView
//
//  Created by Doan Dat on 4/23/19.
//  Copyright © 2019 Doan Dat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var secondScreenController: SecondScreenController?

    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var addressTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func onClickAnnotation(_ sender: UIButton) {
        createSecondScreenIfNeed()
        secondScreenController?.reloadInfo(sender.tag)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func onBack(_ sender: Any) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        removeSecondScreen()
    }
    
    
    private func createSecondScreenIfNeed() {
        guard secondScreenController == nil else { return }
        secondScreenController = self.storyboard?.instantiateViewController(withIdentifier: "SecondControllerID") as? SecondScreenController
        guard let secondScreenController = secondScreenController  else { return }
        secondScreenController.view.frame = addressTableView.frame
        self.view.addSubview(secondScreenController.view)
        self.addChild(secondScreenController)
        secondScreenController.didMove(toParent: self)
    }
    
    private func removeSecondScreen() {
        guard let secondScreenController = secondScreenController else { return }
        secondScreenController.willMove(toParent: nil)
        secondScreenController.view.removeFromSuperview()
        secondScreenController.removeFromParent()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "Address \(indexPath.row)"
        return cell
    }
}

