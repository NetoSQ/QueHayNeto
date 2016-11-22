//
//  ViewControllerEvento.swift
//  IntegracionWP
//
//  Created by Ernesto Salazar on 20/11/16.
//  Copyright © 2016 Maestro. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ViewControllerEvento : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var eventos : [Evento] = []
    
    
    @IBOutlet weak var tvEventos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "https://quehayobson1.azurewebsites.net/api/get_posts/", parameters: ["post_type": "evento"])
            .responseJSON { response in
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
                
                if let diccionarioRespuesta = response.result.value as? NSDictionary{
                    if let posts = diccionarioRespuesta.valueForKey("posts") as? NSArray {
                        for post in posts {
                            if let diccionarioPost = post as? NSDictionary {
                                self.eventos.append(Evento(diccionario: diccionarioPost, callback: self.actualizarTableViewEventos))
                            }
                        }
                        self.tvEventos.reloadData()
                    }
                }
        }
    }
    
    func actualizarTableViewEventos(){
        tvEventos.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCellWithIdentifier("celdaEvento") as! EventoCelda
        celda.lblNombreEvento.text = eventos[indexPath.row].titulo
        
        if let imagen = eventos[indexPath.row].imgFoto {
            celda.imgFondoEvento.image = imagen
        }
        return celda
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToDetalleEvento" {
            let detallesControllerEvento = segue.destinationViewController as! DetallesControllerEvento
            detallesControllerEvento.evento = eventos[(tvEventos.indexPathForSelectedRow?.row)!]
        }
    }
}
