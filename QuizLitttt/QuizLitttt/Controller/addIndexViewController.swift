//
//  addIndexViewController.swift
//  QuizLitttt
//
//  Created by Peijian Huang on 5/17/23.
//

import UIKit
import Firebase

class addIndexViewController: UIViewController {
    
    let db = Firestore.firestore()
    @IBOutlet weak var Definition: UITextField!
    @IBOutlet weak var Concept: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        if let concept = Concept.text,
           let messsageBody = Definition.text,
           let messageSender = Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField:messageSender,K.FStore.bodyField:messsageBody, K.FStore.titleField:concept]) {(error) in
                if error != nil{
                    print("There was an issue saving data to firestore")
                }else{
                    print("Successfully Saved Data")
                }
            }
            
        }
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
