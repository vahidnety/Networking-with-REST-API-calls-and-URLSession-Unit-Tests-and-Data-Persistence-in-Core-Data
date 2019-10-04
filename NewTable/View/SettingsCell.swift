//
//  SettingsCell.swift
//  NewTable
//
//  Created by Ilija Mihajlovic on 10/4/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

class SettingsCell: UICollectionViewCell {
    
    var setting: SettingsControllerModel? {
        didSet {
            nameLabel.text = setting?.name
            nameLabel.textColor = UIColor.darkGray
            
            if let imageName = setting?.imageName {
                iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                iconImageView.tintColor = UIColor.mainAppOrange
            }
        }
    }
    
    //Higlight  Cell
     override var isHighlighted: Bool {
         didSet {
             
             print(isHighlighted)
             
            backgroundColor =  isHighlighted ? UIColor.mainAppOrange: UIColor.white
     
             nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.darkGray

            iconImageView.tintColor = isHighlighted ? UIColor.white : UIColor.systemOrange
             
         }
     }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImageView: UIImageView = {
          let imageView = UIImageView()
        imageView.image = UIImage(named: "star")?.withRenderingMode(.alwaysTemplate)
          imageView.contentMode = .scaleAspectFill
          imageView.translatesAutoresizingMaskIntoConstraints = false
          return imageView
      }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setupConstraints() 
        
    }
    
    fileprivate func addSubView() {
           [nameLabel, iconImageView].forEach{(addSubview($0))}
           
       }
    
    //MARK: - Constraints
    fileprivate func setupConstraints() {
       
        //nameLabel Constraint
        nameLabel.anchor(top: self.topAnchor, bottom: nil, leading: iconImageView.trailingAnchor, trailing: nil, padding: .init(top: 5, left: 5, bottom: 0, right: 0), size: .init(width: 70, height: 40))
        
    
        iconImageView.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: nameLabel.leadingAnchor, padding: .init(top: 5, left: 5, bottom: 0, right: 7), size: .init(width: 35, height: 35))
        }
        
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
