

import UIKit
import Firebase
import FirebaseCore


class ChatViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    let db = Firestore.firestore()
    var messages: [Message] = []
    var content : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "Library"
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()

    }
    func loadMessages() {
        messages = []
        
        db.collection(K.FStore.collectionName).getDocuments { (QuerySnapshot, error ) in
            if let e = error{
                print("There was an issue retrieving data from Firestore.\(e)")
            }else{
                if let snapshotDocuments =  QuerySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                       if let sender =  data[K.FStore.senderField] as? String,
                        let body = data[K.FStore.bodyField] as? String,
                          let title = data[K.FStore.titleField] as? String{
                           let newMessage = Message(sender: sender, title: title, body: body)
                           self.messages.append(newMessage)
                           DispatchQueue.main.async {
                               self.tableView.reloadData()
                           }
                          
                       }
                    }
                }
            }
        }
    }
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError {
            print("Error Signing out: %@", signOutError)
        }
    }
}

extension ChatViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Content = messages[indexPath.row].body
        content = Content ?? ""
        performSegue(withIdentifier: "SeeIndex", sender: self)
    }
}
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for :indexPath) as! MessageCell
        cell.Content.text = messages[indexPath.row].title
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SeeIndex"{
            let destinationVC = segue.destination as! IndexViewController
            destinationVC.body = content
        }
        
    }
}
