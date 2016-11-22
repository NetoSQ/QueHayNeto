//
//  ViewControllerEvento.swift
//  IntegracionWP
//
//  Created by Ernesto Salazar on 20/11/16.
//  Copyright © 2016 Maestro. All rights reserved.
//


import Foundation
import UIKit

class DetallesController: UIViewController {
    
    @IBOutlet weak var lblTituloLugar: UILabel!
    @IBOutlet weak var lblDescripcionLugar: UILabel!
    @IBOutlet weak var lblDireccionLugar: UILabel!
    @IBOutlet weak var lblTelefonoLugar: UILabel!
    @IBOutlet weak var imgFotoDetalle: UIImageView!
    @IBOutlet weak var imgFotoDetalle2: UIImageView!
    
    var lugar: Lugar?
    
    override func viewDidLoad() {
        if let lugar = self.lugar{
            
            
            
            lblDescripcionLugar.lineBreakMode = NSLineBreakMode.ByWordWrapping
            lblDescripcionLugar.numberOfLines = 0
            lblDescripcionLugar.sizeToFit()
            
            lblDireccionLugar.lineBreakMode = NSLineBreakMode.ByWordWrapping
            lblDireccionLugar.numberOfLines = 0
            lblDireccionLugar.sizeToFit()
            
            self.lblTituloLugar.text = lugar.titulo
            self.lblDescripcionLugar.text = lugar.descripcion
            self.lblDireccionLugar.text = lugar.direccion
            self.lblTelefonoLugar.text = lugar.telefono
            
            self.imgFotoDetalle.image = lugar.imgFoto
            self.imgFotoDetalle2.image = lugar.imgFoto2
            
            
            
        }
    }
}
