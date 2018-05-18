//
//  ViewController.swift
//  CorePage
//
//  Created by Tischuk, Christopher on 5/1/18.
//  Copyright © 2018 Tischuk, Christopher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var featuresAndSpecsView: UIView!
    @IBOutlet weak var featuresCollectionView: UICollectionView!
    @IBOutlet weak var buttonVisualEffectView: UIVisualEffectView!
    
    private let features = [("All Wheel Drive", #imageLiteral(resourceName: "AWD")), ("Cooled Seats", #imageLiteral(resourceName: "Cooled Seats")), ("Blind Spot Monitoring", #imageLiteral(resourceName: "Blind Spot Monitoring")), ("Full LED Headlights", #imageLiteral(resourceName: "LED Headlights"))]
    private let featureCellIdentifier = "featureCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonVisualEffectView.layer.cornerRadius = 4
        buttons.forEach { $0.layer.cornerRadius = 4 }
        featuresAndSpecsView.layer.cornerRadius = 4
        featuresAndSpecsView.layer.borderWidth = 1
        featuresAndSpecsView.layer.borderColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1).cgColor
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return features.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featureCellIdentifier, for: indexPath) as! FeatureCollectionViewCell
        let feature = features[indexPath.item]
        cell.featureTitleLabel.text = feature.0
        cell.featureImageView.image = feature.1
        return cell
    }
    
    // MARK: - Orientation Methods
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

