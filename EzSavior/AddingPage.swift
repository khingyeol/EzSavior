//
//  AddingPage.swift
//  EzSavior
//
//  Created by Hatto on 27/10/2563 BE.
//

import UIKit

class AddingPage: UIViewController {

    @IBOutlet weak var tfNotes: UITextField!
    var currentUsername:String = ""
    
    @IBAction func tfNotes(_ sender: Any) {
        tfNotes.translatesAutoresizingMaskIntoConstraints = true
        tfNotes.sizeToFit()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("adding page " + currentUsername)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

