//
//  LQBHomeViewController.swift
//  Sina
//
//  Created by 李庆彬 on 3/20/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

let homeReuseIdentifier = "homeCell"

class LQBHomeViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    var modelArray:[LQBHomeCellFrame] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadStatus();
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.registerNib(UINib(nibName: "LQBHomeTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: homeReuseIdentifier);
        
        self.navigationItem.leftBarButtonItem = LQBNavigation.barItem("", image: "navigationbar_friendsearch", tagart: self, action: Selector("done"));
        self.navigationItem.titleView = LQBNavigation.titleViewWithText("首页");
    }
    
    func loadStatus() {
        let api = LQBNetworkTool();
        api.requestHomeStatus({ (statusArray) -> Void in
            self.modelArray = statusArray as! [LQBHomeCellFrame];
            self.tableView.reloadData();
            }) { (error) -> Void in
                print(error)
        };
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(homeReuseIdentifier, forIndexPath: indexPath)as!LQBHomeTableViewCell;
        cell.cellFrame = self.modelArray[indexPath.row];
//        cell.backgroundColor = UIColor.redColor();
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80;
    }
    
    func done() {
        
    }
}
