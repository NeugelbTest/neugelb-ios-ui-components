import Foundation

public enum NeugelbViewStatus<T> {
    case success(T)
    case loading
    case failed
}
