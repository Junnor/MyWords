//
//  MainViewController.swift
//  MyWords
//
//  Created by Junor on 16/4/11.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    private let words = [
        Word(characters: "Love", charactersExplain: "Meaning you favour something or someone", charactersSentence: "I love you"),
        Word(characters: "Gym", charactersExplain: "A place where people can play sports", charactersSentence: "Gym is usually for gay"),
        Word(characters: "Desk", charactersExplain: "Usually made from woods", charactersSentence: "The desk is made from woods"),
        Word(characters: "Cloth", charactersExplain: "Perpole wear it", charactersSentence: "Everyone like good cloth"),
        Word(characters: "Computer", charactersExplain: "电脑", charactersSentence: "I has a Mac computer"),
        ]
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 255 / 255.0, green:  240 / 255.0, blue:  245 / 255.0, alpha: 1.0)
        
        scrollView.contentSize = CGSize(width: 700, height: scrollView.bounds.height)

        let pageView = getPageView()
        pageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainViewController.pageViewTappedAction(_:))))
        scrollView.addSubview(pageView)
    }
    
    private func getPageView() -> WordPageView {
        let x: CGFloat = scrollView.contentSize.width - view.bounds.size.width
        let y: CGFloat = 0.0
        let width: CGFloat = view.bounds.size.width / 1.5
        let height: CGFloat = scrollView.bounds.size.height
        let pageView = WordPageView(frame: CGRect(x: x, y: y, width: width, height: height))
        pageView.pageWithWord(words.last!)
        return pageView
    }
    
    // MARK: ScrollView Tap Action
    
    private struct Constant {
        static let PageViewTappedSegue = "Show Words"
    }
    
    func pageViewTappedAction(recognizer: UITapGestureRecognizer) {
        performSegueWithIdentifier(Constant.PageViewTappedSegue, sender: scrollView)
    }

    // MARK: - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constant.PageViewTappedSegue {
            if let wordsVC = segue.destinationViewController as? WordsTableViewController {
                wordsVC.wordsOfDate = words
            }
        }
    }

}

