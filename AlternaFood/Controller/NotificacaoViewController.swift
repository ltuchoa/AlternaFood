//
//  NotificacaoViewController.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 30/11/20.
//

import UIKit

enum Message: String, CaseIterable {
    case text1 = "Larissa chata pra krl, mds reclama demaaaaaiiiis!!!!"
//    case text2 = "Que tal conhecer um novo substituto?"
//    case text3 = "Vamos conhecer mais uma receita saudável hoje?"
}

class NotificacaoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func schenduleNotification() {
            
        let center = UNUserNotificationCenter.current()
              
        let content = UNMutableNotificationContent()
        content.title = "Novas Receitas"
        content.body = Message.allCases.randomElement()!.rawValue
        content.sound = .default
              
        let date = Date().addingTimeInterval(5) //43200 segundos = 12 horas
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
//        Add image
        guard let path = Bundle.main.path(forResource: "Icon", ofType: "png") else {return}
        let imageUrl = URL(fileURLWithPath: path)
        
        do {
            let attachment = try UNNotificationAttachment(identifier: "icon", url: imageUrl, options: nil)
            content.attachments = [attachment]
        } catch {
            print("The attachment could not be loaded")
        }
        
        // -------- Create the request ------------
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
              
        // -------- Register the request -----------
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

}
