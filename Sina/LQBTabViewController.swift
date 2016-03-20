//
//  LQBTabViewController.swift
//  Sina
//
//  Created by 李庆彬 on 3/20/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class LQBTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = LQBHomeViewController();
        let homeNav = UINavigationController.init(rootViewController: homeVC);
        homeNav.tabBarItem.title = "Home";
    homeNav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(red: 123/255.0, green: 123/255.0, blue: 123/255.0, alpha: 1)], forState: UIControlState.Normal);
        homeNav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orangeColor()], forState: UIControlState.Selected);
        homeNav.tabBarItem.image = UIImage.init(named: "tabbar_home");
        homeNav.tabBarItem.selectedImage = UIImage.init(named: "tabbar_home_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        let messageVC = LQBMessageViewController();
        let messageNav = UINavigationController.init(rootViewController: messageVC);
        messageNav.tabBarItem.title = "Message";
        messageNav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(red: 123/255.0, green: 123/255.0, blue: 123/255.0, alpha: 1)], forState: UIControlState.Normal);
        messageNav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orangeColor()], forState: UIControlState.Selected);
        messageNav.tabBarItem.image = UIImage.init(named: "tabbar_message_center");
        messageNav.tabBarItem.selectedImage = UIImage.init(named: "tabbar_message_center_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        let publishVC = UIViewController();
        let publishNav = UINavigationController.init(rootViewController: publishVC);
        let tabbarItem =
        publishNav.tabBarItem.image = UIImage.init(named: "tabbar_compose_button")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        publishNav.tabBarItem.image = UIImage.init(named: "tabbar_compose_icon_add_highlighted");
        
        let discoverVC = LQBDiscoverViewController();
        let discoverNav = UINavigationController.init(rootViewController: discoverVC);
        discoverNav.tabBarItem.title = "Discover";
        discoverNav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(red: 123/255.0, green: 123/255.0, blue: 123/255.0, alpha: 1)], forState: UIControlState.Normal);
        discoverNav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orangeColor()], forState: UIControlState.Selected);
        discoverNav.tabBarItem.image = UIImage.init(named: "tabbar_discover");
        discoverNav.tabBarItem.selectedImage = UIImage.init(named: "tabbar_discover_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        let meVC = LQBMessageViewController();
        let meNav = UINavigationController.init(rootViewController: meVC);
        meNav.tabBarItem.title = "Me";
        meNav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(red: 123/255.0, green: 123/255.0, blue: 123/255.0, alpha: 1)], forState: UIControlState.Normal);
        meNav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orangeColor()], forState: UIControlState.Selected);
        meNav.tabBarItem.image = UIImage.init(named: "tabbar_profile");
        meNav.tabBarItem.selectedImage = UIImage.init(named: "tabbar_profile_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        self.viewControllers = [homeNav,messageNav,publishNav,discoverNav,meNav];
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
