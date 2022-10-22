# XReusable

[![CI Status](https://img.shields.io/travis/Ray/XReusable.svg?style=flat)](https://travis-ci.org/Ray/XReusable)
[![Version](https://img.shields.io/cocoapods/v/XReusable.svg?style=flat)](https://cocoapods.org/pods/XReusable)
[![License](https://img.shields.io/cocoapods/l/XReusable.svg?style=flat)](https://cocoapods.org/pods/XReusable)
[![Platform](https://img.shields.io/cocoapods/p/XReusable.svg?style=flat)](https://cocoapods.org/pods/XReusable)

用在TableView和CollectionView中的语法糖,不是什么奇淫巧技。

· 通过如下方式注册cell：
```
let view = UITableView.init(frame: CGRect.zero, style: .plain)
view.xr.register(cell: PopListCell.self)
```
· 通过如下方式复用cell：
```
let cell: PopListCell = tableView.ws.dequeueReusableCell(for: indexPath)
return cell
```
        

## Installation

XReusable is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XReusable'
```

## Author

Ray, xueyongwei@wsecar.com

## License

XReusable is available under the MIT license. See the LICENSE file for more info.
