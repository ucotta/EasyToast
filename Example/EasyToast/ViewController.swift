//
//  ViewController.swift
//  EasyToast
//
//  Created by Franco Meloni on 08/05/2016.
//  Copyright (c) 2016 Franco Meloni. All rights reserved.
//

import UIKit
import EasyToast

class ViewController: UIViewController {
    private lazy var button : UIButton = {
        let button = UIButton(type: .System)
        
        button.frame = CGRectMake(0, 20, CGRectGetWidth(self.view.frame), 50)
        button.titleLabel?.font = UIFont.systemFontOfSize(21)
        button.setTitle("Send Toasts", forState: .Normal)
        button.addTarget(self, action: #selector(showToast), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    private lazy var button2 : UIButton = {
        let button = UIButton(type: .System)
        
        button.frame = CGRectMake(0, 80, CGRectGetWidth(self.view.frame), 50)
        button.titleLabel?.font = UIFont.systemFontOfSize(21)
        button.setTitle("Present Modal", forState: .Normal)
        button.addTarget(self, action: #selector(pushTestVC), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.button)
        self.view.addSubview(self.button2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showToast() {
        self.view.toastBackgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        self.view.toastTextColor = UIColor.whiteColor()
        self.view.toastFont = UIFont.boldSystemFontOfSize(19)
        
        self.view.showToast("Toast", position: .Bottom, popTime: 2, dismissOnTap: false)
        self.view.showToast("Dismiss on tap toast", position: .Bottom, popTime: kToastNoPopupTime, dismissOnTap: true, bgColor: UIColor.redColor().colorWithAlphaComponent(0.7), textColor: UIColor.whiteColor(), font: UIFont.systemFontOfSize(19))
        self.view.showToast("Long Text Toast:\n" +
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vitae elit non leo pellentesque feugiat. Cras nec volutpat massa, nec blandit nisi. Etiam ut hendrerit purus. Morbi accumsan, risus ut cursus finibus, quam ipsum egestas nisl, vel hendrerit massa justo nec metus. Cras pulvinar, leo eu pulvinar convallis, tellus felis laoreet massa, ac tincidunt orci massa non odio. Ut pulvinar dictum metus quis mollis. Aenean tincidunt sit amet turpis sed egestas. Morbi porta dolor neque, ut pellentesque urna semper id. Cras rhoncus consequat justo. Cras dictum enim orci, ac vestibulum enim cursus id.",
                            position: .Bottom,
                            popTime: 5,
                            dismissOnTap: true,
                            bgColor: UIColor.redColor().colorWithAlphaComponent(0.7),
                            textColor: UIColor.whiteColor(),
                            font: UIFont.systemFontOfSize(19))
    }
    
    func pushTestVC() {
        let vc = TestVCViewController()
        let navigationVC = UINavigationController(rootViewController: vc)
        
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .Plain, target: self, action: #selector(closeModal))
        
        self.presentViewController(navigationVC, animated: true, completion: nil)
    }

    func closeModal() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
