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
    var refreshControl:UIRefreshControl?;
    var modelArray:[LQBHomeCellFrame] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        //请求数据
        self.loadStatus();
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.registerNib(UINib(nibName: "LQBHomeTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: homeReuseIdentifier);
        
        self.navigationItem.leftBarButtonItem = LQBNavigation.barItem("", image: "navigationbar_friendsearch", tagart: self, action: Selector("done"));
        self.navigationItem.titleView = LQBNavigation.titleViewWithText("首页");
        
        //下拉刷新
        self.refreshControl = UIRefreshControl.init(frame: CGRectMake(0, 0, WIDTH, 40));
        self.refreshControl!.addTarget(self, action: Selector("loadStatus"), forControlEvents: UIControlEvents.ValueChanged);
        self.tableView.addSubview(self.refreshControl!);
        
        //上拉加载更多时显示
        self.tableView.tableFooterView = RefreshFooter.footer() as? UIView;
        self.tableView.tableFooterView?.hidden = true;
    }
    
    func loadStatus() {
        let api = LQBNetworkTool();
        api.requestHomeStatus([:], successClosure: { (statusArray) -> Void in
            self.modelArray = statusArray as! [LQBHomeCellFrame];
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData();
                self.refreshControl?.endRefreshing();
            })
            }) { (error) -> Void in
                print(error)
        }
    }
    
    func loadMoreSratus() {
        let cellFrame = self.modelArray[0];
        let idStr = cellFrame.weiboStatus.idstr;
        let params:NSDictionary = ["since_id":idStr!];
        let api = LQBNetworkTool();
        api.requestHomeStatus(params, successClosure: { (statusArray) -> Void in
            for index in 0..<statusArray.count {
                self.modelArray.append(statusArray[statusArray.count - 1 - index] as! LQBHomeCellFrame);
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData();
                self.tableView.tableFooterView?.hidden = true;
            })
            }) { (error) -> Void in
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(homeReuseIdentifier, forIndexPath: indexPath)as!LQBHomeTableViewCell;
        cell.cellFrame = self.modelArray[indexPath.row];
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.modelArray[indexPath.row].cellHeight!;
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (self.modelArray.count == 0) || (self.tableView.tableFooterView?.hidden == false) {
            return;
        }
        let y = scrollView.contentSize.height + scrollView.contentInset.bottom - scrollView.frame.size.height - self.tableView!.tableFooterView!.frame.size.height;
        if (scrollView.contentOffset.y > y) {
            self.tableView.tableFooterView?.hidden = false;
            self.loadMoreSratus();
        }
    }
    
    func done() {
        
    }
}
