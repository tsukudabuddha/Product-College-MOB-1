//
//  DetailViewController.swift
//  MoodTracker
//
//  Created by Andrew Tsukuda on 10/17/17.
//  Copyright © 2017 Andrew Tsukuda. All rights reserved.
//

import UIKit

protocol MoodDelegate: class {
    func addFriend(friend: Friend)
}


class DetailViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emojiSC: UISegmentedControl!
    
    weak var moodDelegate: MoodDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
