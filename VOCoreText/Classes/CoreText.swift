//
//  CoreText.swift
//  VOCoreText
//
//  Created by F J Castaneda Ramos on 7/13/17.
//  Copyright © 2017 VincoOrbis. All rights reserved.
//

import UIKit

class CoreText:NSObject {
    
    /// Method that concatenates several Attributed text and returns an NSAttributedString
    ///
    /// - Parameters:
    ///   - attributedTexts: Array of Attributed Text Objects
    ///   - distanceBaseline: In case of have Attachments distance from text baseline
    /// - Returns: Atrributed text with all the concatenated strings
    func concatenate(_ attributedTexts:[AttributedText],distanceBaseline:CGFloat )->NSAttributedString{
        let retAttributedString = NSMutableAttributedString(string: "")
        for attributedText in attributedTexts{
            if let textWithAttachment = setAttachment(attributedText: attributedText, distanceBaseline: distanceBaseline){
                retAttributedString.append(textWithAttachment)
            }else{
                let attributes = [NSForegroundColorAttributeName:attributedText.color,
                                  NSFontAttributeName:attributedText.font]
                let substring = NSAttributedString(string: attributedText.string, attributes: attributes)
                retAttributedString.append(substring)
            }
        }
        return retAttributedString as NSAttributedString
    }
    
    
    /// Method that returns an attachment as NSAttributedString if the AttributedText has an attachment
    ///
    /// - Parameters:
    ///   - attributedText: AttributedText Object
    ///   - distanceBaseline: In case of have Attachments distance from text baseline
    /// - Returns: NSAttributedString that contains the image and the text encapsualted or nil if there is no attachment
    private func setAttachment(attributedText:AttributedText,distanceBaseline:CGFloat)->NSAttributedString?{
        guard let attachmentImg = attributedText.attachment else{
            return nil
        }
        let position = attributedText.attachmentPosition != nil ? attributedText.attachmentPosition!:.left
        let attributes:[String:Any] = [NSForegroundColorAttributeName:attributedText.color,
                                       NSFontAttributeName:attributedText.font,
                                       NSBaselineOffsetAttributeName:distanceBaseline]
        let retAttributedString = NSMutableAttributedString(string: "")
        var substring:NSAttributedString
        switch position {
        case .top:
            substring = attachImage(img: attachmentImg)
            retAttributedString.append(substring)
            substring = NSAttributedString(string: "\n"+attributedText.string, attributes: attributes)
            retAttributedString.append(substring)
            break
        case .left:
            substring = attachImage(img: attachmentImg)
            retAttributedString.append(substring)
            substring = NSAttributedString(string: "\t"+attributedText.string, attributes: attributes)
            retAttributedString.append(substring)
            break
        case .right:
            substring = NSAttributedString(string: attributedText.string+"\t", attributes: attributes)
            retAttributedString.append(substring)
            substring = attachImage(img: attachmentImg)
            retAttributedString.append(substring)
            break
        case .bottom:
            substring = NSAttributedString(string: attributedText.string+"\n", attributes: attributes)
            retAttributedString.append(substring)
            substring = attachImage(img: attachmentImg)
            retAttributedString.append(substring)
            break
        }
        return retAttributedString as NSAttributedString
    }
    
    
    
    
    /// Method that returns a image as NSAttributedString
    ///
    /// - Parameter img: Image to attatch
    /// - Returns: Image as NSAttributedString
    private func attachImage(img:UIImage)->NSAttributedString{
        let attachment = NSTextAttachment()
        attachment.image = img
        attachment.bounds = CGRect(origin: CGPoint.zero, size: img.size)
        let attributedString = NSAttributedString(attachment: attachment)
        return attributedString
    }
}
