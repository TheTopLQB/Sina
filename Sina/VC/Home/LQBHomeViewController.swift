//
//  LQBHomeViewController.swift
//  Sina
//
//  Created by 李庆彬 on 3/20/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class LQBHomeViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    var modelArray:[LQBWeiBoStatus] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadStatus();
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "homeCell");
    }
    
    func loadStatus() {
        let api = LQBNetworkTool();
        api.requestHomeStatus({ (statusArray) -> Void in
            self.modelArray = statusArray as! [LQBWeiBoStatus];
            self.tableView.reloadData();
            }) { (error) -> Void in
                
        };
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("homeCell", forIndexPath: indexPath);
        cell.backgroundColor = UIColor.redColor();
        return cell;
    }

}
