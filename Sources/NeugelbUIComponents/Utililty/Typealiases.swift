import Foundation
import SwiftUI

public typealias ButtonActionHandler = () -> Void
public typealias ButtonAsyncActionHandler = () async -> Void
public typealias ValueHandler<T> = (T) -> Void
public typealias EmptyHandler = () -> Void
public typealias EmptyAsyncHandler = () async -> Void
public typealias NavigationBarRightViewContentMaker = () -> AnyView
