//
//  ViewControllerEvento.swift
//  IntegracionWP
//
//  Created by Ernesto Salazar on 20/11/16.
//  Copyright © 2016 Ernesto Salazar. All rights reserved.
//

import UIKit
import Alamofire


class ViewControllerLugar: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lugares : [Lugar] = []
    
    @IBOutlet weak var tvLugares: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "https://quehayobson1.azurewebsites.net/api/get_posts/", parameters: ["post_type": "lugar"])
            .responseJSON { response in
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
                
                if let diccionarioRespuesta = response.result.value as? NSDictionary{
                    if let posts = diccionarioRespuesta.valueForKey("posts") as? NSArray {
                        for post in posts {
                            if let diccionarioPost = post as? NSDictionary {
                                self.lugares.append(Lugar(diccionario: diccionarioPost, callback: self.actualizarTableViewLugares))
                            }
                        }
                        self.tvLugares.reloadData()
                    }
                }
        }
    }
    
    
    func actualizarTableViewLugares(){
        tvLugares.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lugares.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCellWithIdentifier("celdaLugar") as! lugarCelda
        celda.lblNombre.text = lugares[indexPath.row].titulo
        if let imagen = lugares[indexPath.row].imgFoto {
            celda.imgFondo.image = imagen
            
        }
        return celda
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToDetalles" {
            let detallesController = segue.destinationViewController as! DetallesController
            detallesController.lugar = lugares[(tvLugares.indexPathForSelectedRow?.row)!]
        }
    }
    
}
