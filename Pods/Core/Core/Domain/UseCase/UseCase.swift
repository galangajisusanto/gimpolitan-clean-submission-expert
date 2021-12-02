//
//  UseCaseType.swift
//  Core
//
//  Created by Galang Aji Susanto on 20/11/21.
//

import RxSwift

public protocol UseCase {
    associatedtype Request
    associatedtype Response
    func execute(request: Request?) -> Observable<Response>
}
