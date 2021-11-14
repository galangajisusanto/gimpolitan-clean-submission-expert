//
//  GameLocalDataSourceImpl.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 13/11/21.
//

import Foundation
import RealmSwift
import RxSwift

final class GameLocaleDataSourceImpl: NSObject {
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    static let sharedInstance: (Realm?) -> GameLocaleDataSourceImpl = { realmDatabase in
        return GameLocaleDataSourceImpl(realm: realmDatabase)
    }
}

extension GameLocaleDataSourceImpl: GameLocalDataSource {
    func getGames() -> Observable<[GameEntity]> {
        return Observable<[GameEntity]>.create { observer in
            if let realm = self.realm {
                let games: Results<GameEntity> = {
                    realm.objects(GameEntity.self)
                        .sorted(byKeyPath: "name", ascending: true)
                }()
                observer.onNext(games.toArray(ofType: GameEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    func addGame(from game: GameEntity) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(game, update: .all)
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    func removeGame(form idGame: Int) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        
                        realm.delete(realm.objects(GameEntity.self).filter("idGame = \(idGame)"))
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    func searchGames(from name: String) -> Observable<[GameEntity]> {
        return Observable<[GameEntity]>.create { observer in
            if let realm = self.realm {
                let games: Results<GameEntity> = {
                    realm.objects(GameEntity.self)
                        .filter("name contains[c] %@", name)
                        .sorted(byKeyPath: "name", ascending: true)
                }()
                observer.onNext(games.toArray(ofType: GameEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    func checkIsFavoriteGame(idGame: Int) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                let games: Results<GameEntity> = {
                    realm.objects(GameEntity.self)
                        .filter("idGame = \(idGame)")
                }()
                if games.isEmpty {
                    observer.onNext(false)
                } else {
                    observer.onNext(true)
                }
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
}
