//
//  DynamicHeightCollectionView.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 12/05/21.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {

    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }

}
