//
//  Menu.swift
//  finalGrade
//
//  Created by Li Tong on 2/28/24.
//

import SwiftUI
import CoreData
import Foundation


struct Menu: View {
    @State var searchText = ""
    @Environment(\.managedObjectContext) private var context
    
    
    
    static func createDishesFrom(menuItems: [MenuItem], _ context: NSManagedObjectContext) {
        for menuItem in menuItems {
            if exists(name: menuItem.title, context:context) != nil {
                continue
            }
            let oneDish = Dish(context: context)
            oneDish.title = menuItem.title
            if let price = Float(menuItem.price) {
                oneDish.price = price
            }
            oneDish.dishDescription = menuItem.description
            oneDish.image = menuItem.image
        }
        try? context.save()
    }
    static func exists(name: String, context: NSManagedObjectContext) -> Dish? {
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", name)
        fetchRequest.fetchLimit = 1
        
        do {
            let result = try context.fetch(fetchRequest)
            return result.first
        } catch {
            print("Error fetching entity: \(error)")
            return nil
        }
    }
    
    private func getMenuData(){
        var menuItems: [MenuItem] = []
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the response
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            if !(200..<300).contains(httpResponse.statusCode) {
                print("Unexpected status code: \(httpResponse.statusCode)")
                return
            }
            
            if let data = data {
                do {
                    let fullMenu = try JSONDecoder().decode(JSONMenu.self, from: data)
                    menuItems = fullMenu.menu
                    Menu.createDishesFrom(menuItems: menuItems, context)
                }catch{
                    NSLog("Decode failed %s", String(data: data, encoding: .utf8)!)
                }
            }
            else{
                return
            }
        }
        task.resume()
    }
    
    private func buildPredicate()-> NSPredicate{
        if searchText.isEmpty {
            return NSPredicate(value: true)
        }
        else{
            return NSPredicate(format: "title CONTAINS[c] %@", searchText)
        }
    }
    
    private func buildSortDescriptors()-> [NSSortDescriptor]{
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedCompare))]
    }
    
    var body: some View {
        VStack{
            LittleLemonLog()
            LittleLemonHero()
            MenuBreakDown()
            NavigationView {
                FetchedObjects(
                    predicate:buildPredicate(),
                    sortDescriptors: buildSortDescriptors()
                ) {
                    (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) { dish in
                            DisplayDish(dish)
                        }
                    }
                    .searchable(text: $searchText,
                                prompt: "search...")
                }
            }
        }
        .onAppear(){
            self.getMenuData()
        }
    }
}

#Preview {
    Menu()
}
