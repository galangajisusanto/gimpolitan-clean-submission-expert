//
//  Mapper.swift
//  Core
//
//  Created by Galang Aji Susanto on 20/11/21.
//

public protocol LocaleMapper {
    associatedtype Entity
    associatedtype Domain
    func transformEntityToDomain(entity: Entity) -> Domain
}
