//
//  Presenter.swift
//  Core
//
//  Created by Galang Aji Susanto on 23/11/21.
//

import RxSwift

public class Presenter<Request, Response, Interactor: UseCase>
where Interactor.Request == Request, Interactor.Response == Response {
    private let _useCase: Interactor
    private let disposeBag = DisposeBag()
    public var item = PublishSubject<Response>()
    public var errorMessage = PublishSubject<String>()
    public var loadingState = PublishSubject<Bool>()
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    public func execute(request: Request?) {
        loadingState.onNext(true)
        _useCase.execute(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.item.onNext(result)
            } onError: { error in
                self.errorMessage.onNext(error.localizedDescription)
            } onCompleted: {
                self.loadingState.onNext(false)
            }.disposed(by: disposeBag)
    }
}
