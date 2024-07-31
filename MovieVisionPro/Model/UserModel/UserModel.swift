//
//  UserModel.swift
//  MovieVisionPro
//
//  Created by Ivan Alexander Valero on 14/07/2024.
//

import Foundation

struct PerfilUserModel: Identifiable, Hashable {
    var id = UUID()
    var title:  String
    var icon: String
}

let sidePerfilUserMenu: [PerfilUserModel] = [
    PerfilUserModel(title: "Mi cuenta", icon: "person.crop.circle"),
    PerfilUserModel(title: "Ajustes de la app", icon: "gear"),
    PerfilUserModel(title: "contacatanos", icon: "phone.arrow.down.left"),
    PerfilUserModel(title: "Cerrar sesión", icon: "xmark.circle")
]
