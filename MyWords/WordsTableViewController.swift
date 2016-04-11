//
//  WordsTableViewController.swift
//  MyWords
//
//  Created by Junor on 16/4/11.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {
    
    var wordsOfDate = [Word]()
    
    
    // MARK: - Segue

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constent.ShowWordDetailSegue {
            if let wordDetailVC = segue.destinationViewController as? WordDetailViewController {
                wordDetailVC.word = wordsOfDate[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
    
    
    // MARK: - TableView DataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsOfDate.count
    }
    
    private struct Constent {
        static let WordID = "Word ID"
        static let ShowWordDetailSegue = "Show Word Detail"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constent.WordID, forIndexPath: indexPath)
        let word = wordsOfDate[indexPath.row]
        cell.textLabel?.text = word.characters
        cell.detailTextLabel?.text = word.charactersExplain
        
        return cell
    }
    

}
