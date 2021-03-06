//
//  ResultViewController.swift
//  HomeWorkThird
//
//  Created by Магомед Абдуразаков on 30/06/2019.
//  Copyright © 2019 Магомед Абдуразаков. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var resultLabel: UILabel!
    
    // MARK: - Public Properties
    
    var responces: [Answer]!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Private func
    
    private func updateUI () {
        let carTypes = responces.map {$0.type}
        var carCount = [CarType: Int]()
        
        carTypes.forEach {carType in
            carCount[carType] = (carCount[carType] ?? 0) + 1
        }
        
        let sortedCount = carCount.sorted { $0.value > $1.value }
        let car = sortedCount.first!.key
        
        resultLabel.text = car.definition
    }
    
}
