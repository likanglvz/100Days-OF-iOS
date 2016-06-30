//
//  ViewController.swift
//  swiftTableView
//
//  Created by baiheng on 16/3/24.
//  Copyright © 2016年 baiheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var foodNames = ["一品豆腐","二龙戏珠","三鲜锅巴","四喜丸子","五香牛肉","六味地黄","七星高照","八宝肉圆","九九归一","十全十美"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNames.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        
        
        cell.nameLabel.text = foodNames[indexPath.row]
        cell.priceLabel.text = "$18.0"
        cell.typeLabel.text = "⭐️⭐️⭐️⭐️⭐️"
        
        cell.thumbnailImageView.image = UIImage(named: "food")
        
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width/2
        
        cell.thumbnailImageView.clipsToBounds = true
        
        
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //创建操作表
       // let optionMenu = UIAlertController(title: nil, message: "想吃吗？", preferredStyle: .ActionSheet)
        let optionMenu = UIAlertController(title: nil , message: "想吃吗？", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        //添加操作
        optionMenu.addAction(cancelAction)
        
        
        let callActionHandler = {(action:UIAlertAction! )->Void in
        
            //创建警告框
                let alertMessage = UIAlertController(title: "无法完成服务", message: "饭还没做好，请等一会儿", preferredStyle: .Alert)
            
                alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil ))
            
            
                self.presentViewController(alertMessage, animated: true, completion: nil )

        
        }
        
        
        
        let callAction = UIAlertAction(title: "Call"+"400-000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler:callActionHandler)
        
        
        
        optionMenu.addAction(callAction)
        
        
        self.parentViewController!.presentViewController(optionMenu, animated: true, completion: nil)
        
        
        
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail"{
            let destinationController = segue.destinationViewController  as! DetailViewController
            
            destinationController.foodImage = "food"
            
        }
    }
    
    

}



















