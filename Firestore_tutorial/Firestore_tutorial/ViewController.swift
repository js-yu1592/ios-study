//
//  ViewController.swift
//  Firestore_tutorial
//
//  Created by 유준상 on 2021/02/17.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var keys: [String] = ["hi","hello","fkewo","qwjnkd"]
    var values: [String] = ["1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let db = Firestore.firestore()
        
        // Adding a Document
        db.collection("wine").addDocument(data: ["year":2017, "type":"pinot-nor","label": "PellerEstates"])
        
        let newDocument = db.collection("wine").document()
        newDocument.setData(["year":2017, "type":"gameay-nor","label": "PellerEstates", "id":newDocument.documentID])
        
        db.collection("wine").document("stoenypath-cab-2017").setData(["324234": "hello", "test": "test"], merge: true)
                                                                        
        // Adding a Document with a specific document ID, Update is same
        for i in 0..<keys.count {
            db.collection("wine").document("pinot-noir-2017").setData(["324234": "hello", keys[i]: values[i]], merge: true)
        }
        
        //Detexting errors
         db.collection("wine").addDocument(data: ["test":"test"]) { error in
            if let error = error {
//                there was an error
            } else {
//                 error is nil.. so operation completed successfully
            }
        }
        
        // Delete a Document
        db.collection("wine").document("stoenypath-cab-2017").delete()
        // Delete a field
        db.collection("wine").document("stoenypath-cab-2017").updateData(["test":FieldValue.delete()])
        
        // Delete for errors, use completion parameter
        db.collection("wine").document("pinot-noir-2017").delete(completion: {error in
            if let error = error {
                // we have an error
            } else {
                // Delete was Successful
            }
        })
        
        //Read a specific document
        db.collection("wine").document("pinot-noir-2017").getDocument { (document, error) in
            // check for error
            if error == nil {
                // check that this document exists
                if document != nil && document!.exists {
                    let documentData = document!.data()
                    print(documentData!)
                }
            }
        }
        
        // Getting all documents from a collection
        db.collection("wine").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let documentData = document.data()
//                    print(documentData)
                }
            }
        }
        
        // Getting a subset of documents
        db.collection("wine").whereField("type", isEqualTo: 2017).getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
               
            }
        }

    }

}
