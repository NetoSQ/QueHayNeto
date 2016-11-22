//
//  Lugar.swift
//  IntegracionWP
//
//  Created by Maestro on 04/11/16.
//  Copyright © 2016 Maestro. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Lugar {
    var titulo : String
    var descripcion : String
    var direccion : String
    var telefono : String
    
    var urlFoto : String?
    var imgFoto : UIImage?
    
    var urlThumbnail : String?
    var imgThumbnail : UIImage?
    
    init(){
        titulo = ""
        descripcion = ""
        direccion = ""
        telefono = ""
    }
    
    init(diccionario : NSDictionary, callback: (() -> Void)?) {
        titulo = ""
        descripcion = ""
        direccion = ""
        telefono = ""
        
        if let titulo = diccionario.valueForKey("title_plain") as? String {
            self.titulo = titulo
        }
        
        if let customFields = diccionario.valueForKey("custom_fields") as? NSDictionary {
            if let descripcion = customFields.valueForKey("descripcion") as? NSArray {
                if let valorDescripcion = descripcion[0] as? String {
                    self.descripcion = valorDescripcion
                }
            }
            if let direccion = customFields.valueForKey("direccion") as? NSArray {
                if let valorDireccion = direccion[0] as? String {
                    self.direccion = valorDireccion
                }
            }
            if let telefono = customFields.valueForKey("telefono") as? NSArray {
                if let valorTelefono = telefono[0] as? String {
                    self.telefono = valorTelefono
                }
            }
        }
        
        if let attachments = diccionario.valueForKey("attachments") as? NSArray {
            if attachments.count > 0 {
                if let imagen = attachments[0] as? NSDictionary {
                    if let urlImagen = imagen.valueForKey("url") as? String {
                        self.urlFoto = urlImagen
                    }
                    if let images = imagen.valueForKey("images") as? NSDictionary {
                        if let thumbnail = images.valueForKey("thumbnail") as? NSDictionary {
                            if let urlThumbnail = thumbnail.valueForKey("url") as? String {
                                self.urlThumbnail = urlThumbnail
                            }
                            
                        }
                    }
                }
            }
        }
        if let urlFoto = self.urlFoto {
            Alamofire.request(.GET,urlFoto, parameters: [:]).responseData(completionHandler: {
                response in
                if let data = response.data {
                    self.imgFoto = UIImage(data: data)
                    if let funcionCallback = callback {
                        funcionCallback()
                    }
                } else {
                    //Asignarle una imagen generica
                }
            })
        } else {
            //Asignarle una imagen generica
        }
    }
    
    
}
