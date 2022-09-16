//
//  ViewController.swift
//  E-Leave
//
//  Created by USER-MAC-GLIT-007 on 11/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var topContainerImageView: UIImageView! {
        didSet {
            topContainerImageView.clipsToBounds = true
            topContainerImageView.layer.cornerRadius = topContainerImageView.frame.height / 2
        }
    }
    @IBOutlet weak var topContainerNameLabel: UILabel!
    @IBOutlet weak var topContainerNikLabel: UILabel!
    @IBOutlet weak var topContainerCutiLabel: UILabel!
    
    @IBOutlet weak var bottomContainerView: UIView!
    @IBOutlet weak var bottomFormContainerView: UIView!
    @IBOutlet weak var bottomFormLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl! {
        didSet {
            segmentedControl.addTarget(self, action: #selector(segmentedControlAction), for: .valueChanged)
        }
    }
    @IBOutlet weak var leaveCollectionView: UICollectionView! {
        didSet {
            leaveCollectionView.delegate = self
            leaveCollectionView.dataSource = self
            
            leaveCollectionView.register(UINib(nibName: "LeaveCollectionCell", bundle: nil), forCellWithReuseIdentifier: "leaveCollectionCell")
            
            self.leaveCollectionView.isHidden = false
            
        }
    }
    @IBOutlet weak var leaveAdditionalCollectionView: UICollectionView! {
        didSet {
            leaveAdditionalCollectionView.delegate = self
            leaveAdditionalCollectionView.dataSource = self
            
            leaveAdditionalCollectionView.register(UINib(nibName: "LeaveCollectionCell", bundle: nil), forCellWithReuseIdentifier: "leaveCollectionCell")
            
            self.leaveAdditionalCollectionView.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "E-Leave"
        
    }
    
    @objc func segmentedControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            self.leaveCollectionView.isHidden = false
            self.leaveAdditionalCollectionView.isHidden = true
        case 1:
            self.leaveCollectionView.isHidden = true
            self.leaveAdditionalCollectionView.isHidden = false
        default:
            break
        }
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case leaveCollectionView:
            return 2
            
        case leaveAdditionalCollectionView:
            return 5
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case leaveCollectionView:
            let cell = leaveCollectionView.dequeueReusableCell(withReuseIdentifier: "leaveCollectionCell", for: indexPath) as! LeaveCollectionCell
            
            return cell
        case leaveAdditionalCollectionView:
            let cell = leaveCollectionView.dequeueReusableCell(withReuseIdentifier: "leaveCollectionCell", for: indexPath) as! LeaveCollectionCell
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case leaveCollectionView:
            return CGSize(width: self.leaveCollectionView.frame.width, height: 50)
        case leaveAdditionalCollectionView:
            return CGSize(width: self.leaveCollectionView.frame.width, height: 50)
        default:
            return CGSize.zero
        }
    }
    
    
}
