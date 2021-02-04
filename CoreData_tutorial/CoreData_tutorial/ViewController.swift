//
//  ViewController.swift
//  CoreData_tutorial
//
//  Created by 유준상 on 2021/02/01.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    let zedd = Person(name:"Zedd",
                      phoneNumber: "010-1234-5678",
                      shortcutNumber: 1, habbit: ["netflix", "watch movie"])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        let context = appDelegate.persistentContainer.viewContext
//
//        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: context)
//
//        if let entity = entity {
//            let person = NSManagedObject(entity: entity, insertInto: context)
//            person.setValue(zedd.name, forKey: "name")
//            person.setValue(zedd.phoneNumber, forKey : "phoneNumber")
//            person.setValue(zedd.shortcutNumber, forKey: "shortcutNumber")
//        }
//
//        do {
//            try context.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//        fetchContact()
        
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        let fetchResult = PersistenceManager.shared.fetch(request: request)

        let walker = Person(name: "Walker", phoneNumber: "010-1234-5678", shortcutNumber: 2, habbit: ["soccer", "basketball", "cumputer game"])
        
        PersistenceManager.shared.insertPerson(person: walker)
        PersistenceManager.shared.insertPerson(person: zedd)
        
        if let object = fetchResult.first {
            PersistenceManager.shared.delete(object: object)
        }
        
    
        
        
//        PersistenceManager.shared.deleteAll(request: request)

        let arr = PersistenceManager.shared.fetch(request: request)
        if arr.isEmpty {
            print("clean")
        }

        print(PersistenceManager.shared.count(request: request) ?? "nil")
        
        
        fetchResult.forEach {
            if let name = $0.name, let phoneNumber = $0.phoneNumber, let habbit = $0.habbit {
                            print("name : \(name), phoneNumber : \(phoneNumber), shortcutNumber : \($0.shortcutNumber), habbit : \(habbit)")
            }
        }
    }



}

