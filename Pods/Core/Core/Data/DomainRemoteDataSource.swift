//
//  RemoteDataSource.swift
//  Core
//
//  Created by Galang Aji Susanto on 20/11/21.
//

import RxSwift
public protocol DomainRemoteDataSource {
    associatedtype Request
    associatedtype Response
    func execute(request: Request?) -> Observable<Response>
}
