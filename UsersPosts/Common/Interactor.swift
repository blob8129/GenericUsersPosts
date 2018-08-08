//
//  UserInteractor.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/7/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import Foundation


final class Interactor<EntityType: Convertible & Decodable, V>: InteractorInput where EntityType.TypeToConvertTo == V {
    typealias ViewModelConvertibleType = EntityType
    typealias ViewModelType = V
    
    weak var view: InteractorOutput?
    private var url: URL
    private var networkService: NetworkServiceProtocol
    private var decoder: JSONDecoder
    internal var entities: [ViewModelConvertibleType] = [ViewModelConvertibleType]()
    
    init(networkService: NetworkServiceProtocol, url: URL, decoder: JSONDecoder) {
        self.networkService = networkService
        self.url = url
        self.decoder = decoder
    }
}

extension Interactor {
    func viewDidLoad() {
        
        networkService.loadData(at: url) { result in
            switch result {
                
            case .success(let data):
                do {
                    
                    self.entities = try JSONDecoder().decode([EntityType].self, from: data)
                    DispatchQueue.main.async {
                        self.view?.didLoadedViewModels()
                    }
                    print("Entities \(self.entities)")
                } catch let error {
                    print("D Error \(error)")
                    
                }
            case .error(let error):
                print("Error \(error)")
                break
            }
        }
    }
}

extension InteractorInput {
    
    func viewModel(at indexPath: IndexPath) -> ViewModelConvertibleType {
        return entities[indexPath.row]
    }
    
    var numberOfItems: Int {
        return entities.count
    }
}
