//
//  PokemonViewController.swift
//  PokemonList
//
//  Created by Arkadijs Makarenko on 19/08/2022.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    var pokey: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokémon List"
        getPokemonData()
    }
    
    func getPokemonData(){
        let jsonUrl = "https://api.pokemontcg.io/v1/cards"
        //https://api.pokemontcg.io/v2/cards
        guard let url = URL(string: jsonUrl) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { (myData, myResponse, myError) in
            
            if myError != nil {
                print((myError?.localizedDescription)!)
            }
            
            guard let data = myData else{
                print(myError as Any)
                return
            }
            
            do{
                let jsonData = try JSONDecoder().decode(Pokemon.self, from: data)
                                print("jsonData: ", jsonData)
                                self.pokey = jsonData.cards
                                DispatchQueue.main.async {
                                    self.tableViewOutlet.reloadData()
                }
                
            }catch{
                print("Error:::::: ", myError as Any)
            }
        }.resume()
        
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableViewOutlet.indexPathForSelectedRow{
            print("indexPath: ", indexPath)
            guard let detailVC = segue.destination as? PokemonDetailViewController else {return}
            detailVC.Pokey = Array(pokey[indexPath.row])


        }
            
        }

    
    
}//end class

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokeyTableViewCell", for: indexPath) as? PokeyTableViewCell else {return UITableViewCell()}
        
        let pok = pokey[indexPath.row]
        cell.setupUI(withDataFrom: pok)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    
    
}
