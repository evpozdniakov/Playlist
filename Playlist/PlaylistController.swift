//
//  SecondViewController.swift
//  Playlist
//
//  Created by Evgeniy Pozdnyakov on 2015-04-26.
//  Copyright (c) 2015 Evgeniy Pozdnyakov. All rights reserved.
//

import UIKit

class PlaylistController: UITableViewController {
    var dataModel: DataModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
}

extension PlaylistController: UITableViewDataSource {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assert(dataModel != nil)

        return dataModel!.playlistItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell") as! UITableViewCell
        let index = dataModel!.playlistItems[indexPath.row]
        
        cell.textLabel!.text = dataModel!.allItems[index]
        
        return cell
    }
}

