//
//  XReusable.swift
//
//  Created by Ray on 2021/9/21.
//  Copyright © 2020 XueYongWei. All rights reserved.
//

import UIKit


/// 凡是遵守此协议的 view 控件，就免费获得
/// 一个返回这个view 类名的 reuseIdentifier
public protocol XReusable: AnyObject {
    static var identifier: String { get }
}

extension XReusable {
    public static var identifier: String {
        return String(describing: Self.self)
    }
}


// MARK: - UICollectionView

extension XR where Base: UICollectionView {
    
    /// 纯代码注册 UICollectionViewCell
    public func register<T: UICollectionViewCell>(cell: T.Type) where T: XReusable {
        base.register(cell, forCellWithReuseIdentifier: T.identifier)
    }
    
    
    /// 纯代码注册 UICollectionReusableView
    public func registerReusableSupplementaryView<T: UICollectionReusableView>(of kind: UICollectionSupplementaryElementKind, viewType: T.Type) where T: XReusable {
        base.register(T.self, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: T.identifier)
    }
    
    
    /// 复用 UICollectionViewCell
    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: XReusable {
        guard let cell = base.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue reusable cell with identifier: \(T.identifier)")
        }
        return cell
    }
    
    /// 复用 UICollectionReusableView
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(of kind: UICollectionSupplementaryElementKind, for indexPath: IndexPath) -> T where T: XReusable {
        guard let view = base.dequeueReusableSupplementaryView(ofKind: kind.value, withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue reusable supplementary view with identifier: \(T.identifier)")
        }
        return view
    }
    
}

// MARK: - UITableView

extension XR where Base: UITableView {
    
    /// 纯代码注册 UITableViewCell
    public func register<T: UITableViewCell>(cell: T.Type) where T: XReusable {
        base.register(cell, forCellReuseIdentifier: T.identifier)
    }
    
    /// 纯代码注册 UITableViewHeaderFooterView
    public func register<T: UITableViewHeaderFooterView>(reusebleView: T.Type) where T: XReusable {
        base.register(reusebleView, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    /// 复用 UITableViewCell
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: XReusable {
        guard let cell = base.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue reusable cell with identifier: \(T.identifier)")
        }
        return cell
    }
    
    /// 复用 UITableViewHeaderFooterView
    public func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T where T: XReusable {
        
        guard let view = base.dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue headerfooter view with identifier: \(T.identifier)")
        }
        
        return view
    }
    
}

// MARK: - UICollectionSupplementaryElementKind
public enum UICollectionSupplementaryElementKind {
    case header
    case footer

    public var value: String {
        switch self {
        case .header: return UICollectionView.elementKindSectionHeader
        case .footer: return UICollectionView.elementKindSectionFooter
        }
    }
}


// MARK: - XRNameSpace

public struct XR<Base> {
    public let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

public protocol XRNameSpace {}
extension XRNameSpace {
    public var xr: XR<Self> {
        return XR(self) }
    public static var xr: XR<Self>.Type {
        return XR.self
    }
}

extension UICollectionView: XRNameSpace {}
extension UITableView : XRNameSpace {}
