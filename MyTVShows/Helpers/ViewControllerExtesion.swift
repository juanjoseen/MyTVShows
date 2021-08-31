//
//  ViewControllerExtesion.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

extension UIViewController {
    
    var favorites: [TvShow] {
        get {
            if let favs = LocalData.shared.getFavorites() {
                return favs
            } else {
                showError(error: .gettingFavsError){}
                return []
            }
        }
        
        set (newValue) {
            if !LocalData.shared.saveFavorites(newValue) {
                showError(error: .savingFavsError) {
                    let _ = LocalData.shared.saveFavorites(newValue)
                }
            }
        }
    }
    
    func confirmDeletionOf(_ model: TvShow, completion: @escaping () -> Void) {
        let message: String = "Do you really want to delete \(model.name) from your favorites?"
        
        let alert: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "Yes", style: .default) { action in
            self.favorites.removeAll(where: { $0.id == model.id })
            completion()
        }
        
        let cancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func markAsFavorite(_ model: TvShow, completion: @escaping () -> Void) {
        favorites.append(model)
        completion()
    }
    
    func showError(error: ErrorType, completion: @escaping () -> Void) {
        let alert: UIAlertController = UIAlertController(title: "Oops, algo salió mal!", message: error.rawValue, preferredStyle: .alert)
        
        let retryAction: UIAlertAction = UIAlertAction(title: "Si", style: .default) { action in
            completion()
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(retryAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func isFavoriteShow(_ model: TvShow) -> Bool {
        return favorites.contains(where: { $0.id == model.id })
    }
}

enum ErrorType: String {
    case gettingFavsError = "Hubo un problema al recuperar los show de TV. ¿Quieres intentar nuevamente?"
    case savingFavsError = "Hubo un problema al guardar este show de TV. ¿Quieres intentar nuevamente?"
    case deletingFavsError = "Hubo un problema al borrar este show de TV. ¿Quieres intentar nuevamente?"
    case internetError = "Ocurrió un error al consultar el servicio. ¿Quieres intentar nuevamente?"
}
