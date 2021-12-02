//
//  LocalDataSource.swift
//  Core
//
//  Created by Galang Aji Susanto on 20/11/21.
//

import RxSwift

public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    func list(request: Request?) -> Observable<[Response]>
    func add(entity: Response) -> Observable<Bool>
    func delete(id: String) -> Observable<Bool>
    func checkContains(id: String) -> Observable<Bool>
}
