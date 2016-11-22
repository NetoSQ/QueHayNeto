//
//  ViewControllerEvento.swift
//  IntegracionWP
//
//  Created by Ernesto Salazar on 20/11/16.
//  Copyright © 2016 Ernesto Salazar. All rights reserved.
//

import Foundation
import UIKit

class DetallesControllerEvento: UIViewController {
    
    @IBOutlet weak var lblTituloEvento: UILabel!
    @IBOutlet weak var lblDescripcionEvento: UILabel!
    @IBOutlet weak var lblDireccionEvento: UILabel!
    @IBOutlet weak var lblHorario: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var imgFotoDetalle: UIImageView!
    @IBOutlet weak var imgFotoDetalle2: UIImageView!
    
    
    var evento: Evento?
    
    override func viewDidLoad() {
        if let evento = self.evento{
            
            self.title = evento.titulo
            
            lblDescripcionEvento.lineBreakMode = NSLineBreakMode.ByWordWrapping
            lblDescripcionEvento.numberOfLines = 0
            lblDescripcionEvento.sizeToFit()
            
            lblDireccionEvento.lineBreakMode = NSLineBreakMode.ByWordWrapping
            lblDireccionEvento.numberOfLines = 0
            lblDireccionEvento.sizeToFit()
            
            self.lblTituloEvento.text = evento.titulo
            self.lblDescripcionEvento.text = evento.descripcion
            self.lblDireccionEvento.text = evento.direccion
            self.lblTelefono.text = evento.telefono
            self.lblHorario.text = evento.telefono
            self.lblFecha.text = evento.fecha
            self.lblPrecio.text = evento.precio
            self.imgFotoDetalle.image = evento.imgFoto
            self.imgFotoDetalle2.image = evento.imgFoto2
            
            
            
        }
    }
}
