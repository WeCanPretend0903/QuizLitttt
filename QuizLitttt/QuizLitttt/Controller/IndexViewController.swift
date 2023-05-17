//
//  IndexViewController.swift
//  QuizLitttt
//
//  Created by Peijian Huang on 5/17/23.
//

import UIKit

class IndexViewController: UIViewController {

    @IBOutlet weak var Definition: UILabel!
    var body : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI() {
        Definition.text = body
        print(body)
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
