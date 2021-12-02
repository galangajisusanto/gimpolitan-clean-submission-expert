//
//  RemoteMapper.swift
//  Core
//
//  Created by Galang Aji Susanto on 27/11/21.
//

public protocol RemoteMapper {
    associatedtype Response
    associatedtype Domain
    func transformResponseToDomain(response: Response) -> Domain
}
