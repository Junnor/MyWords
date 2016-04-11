//
//  WordDetailViewController.swift
//  MyWords
//
//  Created by Junor on 16/4/11.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class WordDetailViewController: UIViewController {
    
    var word: Word? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var charatersLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var sentenceLabel: UILabel!
    
    private func updateUI() {
        charatersLabel?.text = word?.characters
        explainLabel?.text = word?.charactersExplain
        sentenceLabel?.text = word?.charactersSentence
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
}
