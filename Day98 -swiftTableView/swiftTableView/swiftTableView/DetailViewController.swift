//
//  DetailViewController.swift
//  swiftTableView
//
//  Created by baiheng on 16/3/24.
//  Copyright © 2016年 baiheng. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    
    var foodImage:String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.foodImageView.image = UIImage(named: foodImage)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
