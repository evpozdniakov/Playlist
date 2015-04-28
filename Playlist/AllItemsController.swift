//
//  FirstViewController.swift
//  Playlist
//
//  Created by Evgeniy Pozdnyakov on 2015-04-26.
//  Copyright (c) 2015 Evgeniy Pozdnyakov. All rights reserved.
//

import UIKit

class AllItemsController: UITableViewController {
    var dataModel: DataModel?
    var playlistCtlr: PlaylistController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AllItemsController: UITableViewDataSource {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assert(dataModel != nil)

        return dataModel!.allItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        assert(dataModel != nil)

        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell") as! UITableViewCell

        cell.textLabel!.text = dataModel!.allItems[indexPath.row]

        if let index = find(dataModel!.playlistItems, indexPath.row) {
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        else {
            cell.backgroundColor = UIColor.whiteColor()
        }

        return cell
    }
}

extension AllItemsController: UITableViewDelegate {
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        assert(dataModel != nil)
        assert(playlistCtlr != nil)

        let selectedItemIndex = indexPath.row

        if let index = find(dataModel!.playlistItems, selectedItemIndex) {
            dataModel!.playlistItems.removeAtIndex(index)
        }
        else {
            dataModel!.playlistItems.append(selectedItemIndex)
        }

        let playlistItemsCount = dataModel!.playlistItems.count

        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        playlistCtlr!.tabBarItem!.badgeValue = playlistItemsCount > 0 ? String(playlistItemsCount) : nil

        return nil
    }
}
