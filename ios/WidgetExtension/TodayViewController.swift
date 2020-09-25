//
//  TodayViewController.swift
//  WidgetExtension
//
//  Created by Trung Hieu on 9/24/20.
//

import UIKit
import NotificationCenter

struct Shared:Decodable {
  let title: String
}

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        //CHANGE THE GROUP NAME
        let userDefaults = UserDefaults(suiteName:"group.native.example.Widget.WidgetExtension")
      
      do{
        let shared = userDefaults?.string(forKey: "data")
        if(shared != nil) {
        let data = try JSONDecoder().decode(Shared.self, from: shared!.data(using: .utf8)!)
          titleLabel.text = data.title
        } else {
          titleLabel.text = "Data is null"
        }
      }catch{
       print(error)
      }
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
