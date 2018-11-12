//
//  ArtCollectionViewController.swift
//  iOSArtProject
//
//  Created by Fitzgerald, Skyler on 11/7/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "artIdentifier"

public class ArtCollectionViewController: UICollectionViewController
{
    
    //MARK: Data Members Declaration
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRowCompact : CGFloat = 4
    private let itemsPerRowNormal : CGFloat = 6
    
    private let creativeCS : [UIImage?] =
    {
        return [
            UIImage(named:"GSC_beta_Meowth"),
            UIImage(named:"SkylerFitzgerald"),
            UIImage(named:"SkylerFitzgeraldJavaHaiku"),
            UIImage(named:"SkylerFitzgeraldMainframeHaiku"),
            UIImage(named:"SkylerFitzgeraldSwiftHaiku"),
            UIImage(named:"codeART"),
            UIImage(named:"continue"),
            UIImage(named:"wizard_cat")
        ]
    }()
    
    private let labels : [String] =
    {
        return [
            "beta Meowth",
            "my Octocat",
            "Haiku about Java",
            "Master teh Mainframe",
            "Swift",
            "art I made using LOGO",
            "a e s t h e t i c",
            "[A wandering WIZARD CAT has appeared!]"
        ]
    }()
    
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation
    public override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }


    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        return creativeCS.count
    }
    
    
    // MARK: UICollectionViewDataSource
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell
        
        artCell.backgroundColor = .red
        artCell.artImage.image = creativeCS[indexPath.row]
        artCell.artLabel.text = labels[indexPath.row]
    
        return artCell
    }

    // MARK: UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let paddingSpace = sectionInsets.left * (itemsPerRowCompact + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRowCompact
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) ->CGFloat
    {
        return sectionInsets.left
    }

}
