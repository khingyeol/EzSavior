//
//  HomeViewController.swift
//  EzSavior
//
//  Created by Hatto on 8/10/2563 BE.
//

import UIKit
import Firebase

class Home: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var lbCurrentUsername: UILabel!
    @IBOutlet weak var lbBalanced: UILabel!
    @IBOutlet weak var profilePicture: UIButton!
    @IBOutlet weak var btnAdding: UIButton!
    
    var currentUsername:String!
    var dataArray:[String] = [""]
    var countRow:Int = 0
    let ref = Database.database().reference()
    
    @IBAction func btnAdding(_ sender: Any) {
        view.addSubview(btnAdding)
    }
    @IBAction func btnProfilePicture(_ sender: Any) {
        
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (Int(ref.child("\(currentUsername!)/data").observe(.value, with: { (snapshot) in
//            if let data = snapshot.value as? NSDictionary {
//                return self.countRow = data.allKeys.count
//            }
//        })))
        return 2
    }
    
    func loaddata(){
        let ref = Database.database().reference().child("\(currentUsername!)/data")
        ref.observe(.value, with: { (snapshot) in
            if let data = snapshot.value as? NSDictionary {
                let temp = data.value(forKey: "Sep 29,2020") as! NSDictionary
            }
            
    })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath)
        tableView.rowHeight = 200
        /*
        let ref = Database.database().reference().child("\(currentUsername!)/data")
        ref.observe(.value, with: { (snapshot) in
            if let data = snapshot.value as? NSDictionary {
                let temp = data.value(forKey: "Sep 29,2020") as! NSDictionary
                cell.textLabel?.numberOfLines = 100
                cell.textLabel?.text = data.allKeys[indexPath.row] as? String
            }
        })
         */
        cell.textLabel?.numberOfLines=100
//        ref.child("\(currentUsername!)/data").observeSingleEvent(of: .value){ (data) in
//            print(data.value)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profilePicture.setBackgroundImage(UIImage.init(named: "Dowoon.jpg"), for: .normal)
        self.profilePicture.layer.cornerRadius = 30
        lbCurrentUsername.text = currentUsername
        let ref = Database.database().reference()
        ref.child("\(currentUsername!)/money/balance").observeSingleEvent(of: .value){ (balance) in
            self.lbBalanced.text = ("\(balance.value as! String) ฿")
        }
    }
        
        
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adding" {
            let sender = segue.destination as! UITabBarController
            let res = sender.viewControllers!.first as! AddingPage
            res.currentUsername = currentUsername
        }
    }
        
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
