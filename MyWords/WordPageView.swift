//
//  WordPageView.swift
//  MyWords
//
//  Created by Junor on 16/4/11.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class WordPageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Designed Init Method, Must Implement It
    
    func pageWithWord(word: Word){
        setUpperView(word)
        setLoweView()        
    }
    
    private func setUpperView(word: Word) {
        let upperViewWidth = self.bounds.size.width
        let upperViewHeight = self.bounds.size.height * 2 / 3

        let upperView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: upperViewWidth, height: upperViewHeight)))
        upperView.backgroundColor = UIColor(red: 130 / 255.0, green: 130 / 255.0, blue: 130 / 255.0, alpha: 1.0)
        
        let textLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0.0, y: 30), size: CGSize(width: upperViewWidth, height: 30)))
        let detailLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0.0, y: 70), size: CGSize(width: upperViewWidth, height: 30)))
        
        textLabel.text = word.characters
        detailLabel.text = word.charactersExplain
        
        textLabel.textAlignment = .Center
        detailLabel.textAlignment = .Center
        
        upperView.addSubview(textLabel)
        upperView.addSubview(detailLabel)
        
        self.addSubview(upperView)
    }
    
    private func setLoweView() {
        let lowerViewWidth = self.bounds.size.width
        let lowerViewHeight = self.bounds.size.height * 1 / 3
        
        let x: CGFloat = 0.0
        let y: CGFloat = self.bounds.size.height - lowerViewHeight
        
        let lowerView = UIView(frame: CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: lowerViewWidth, height: lowerViewHeight)))
        lowerView.backgroundColor = UIColor.whiteColor()
        
        let dateLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0.0, y: lowerViewHeight / 2), size: CGSize(width: lowerViewWidth, height: 30)))
        
        dateLabel.text = String(NSDate())
        dateLabel.textAlignment = .Center
        
        lowerView.addSubview(dateLabel)
        
        self.addSubview(lowerView)
    }
    
}
