//
//  Capture.swift
//  view-capture-demo
//
//  Created by OkuderaYuki on 2017/06/08.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import UIKit

final class Capture: NSObject {
    
    static func take(view: UIView, rect: CGRect? = nil) -> UIImage? {
        
        if let rect = rect {
            // ビットマップ画像のコンテキストを生成
            UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
            if let context = UIGraphicsGetCurrentContext() {
                context.translateBy(x: -rect.origin.x, y: -rect.origin.y);
            }
        } else {
            // ビットマップ画像のコンテキストを生成
            UIGraphicsBeginImageContextWithOptions(view.frame.size, false, UIScreen.main.scale)
        }
        
        view.drawHierarchy(in: view.frame, afterScreenUpdates: true)
        // 現在のコンテキストのビットマップをUIImageとして取得
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func save(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, .showResultOfSaveImage, nil)
    }
    
    // 保存を試みた結果をダイアログで表示
    static func showResultOfSaveImage(_ image: UIImage,
                                      didFinishSavingWithError error: NSError!,
                                      contextInfo: UnsafeMutableRawPointer) {
        
        if error != nil {
            print("保存に失敗しました")
        } else {
            print("カメラロールに保存しました")
        }
    }
}

private extension Selector {
    static let showResultOfSaveImage = #selector(Capture.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:))
}
