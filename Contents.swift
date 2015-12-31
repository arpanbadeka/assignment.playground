//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample.png")!

class imageFilter{
    
    
    func increaseContrast(image: UIImage, operation: String) -> UIImage{
        let myRGBA = RGBAImage(image: image)!
        let avgRed = 118
        let avgGreen = 98
        let avgBlue = 83
        switch operation {
        case "increaseBrightness" : for y in 0..<myRGBA.width {
                                        for x in 0..<myRGBA.height{
                                            let index = y * myRGBA.width + x
                                            var pixel = myRGBA.pixels[index]
                                            pixel.red = UInt8(max(0,min(255,Int(pixel.red)+100)))
                                            pixel.green = UInt8(max(0,min(255,Int(pixel.green)+100)))
                                            pixel.blue = UInt8(max(0,min(255,Int(pixel.blue)+100)))
                                            myRGBA.pixels[index] = pixel
                                        }
                                    }
        case "greyImage" : for y in 0..<myRGBA.width {
                                for x in 0..<myRGBA.height{
                                    let index = y * myRGBA.width + x
                                    var pixel = myRGBA.pixels[index]
                                    pixel.red = UInt8((Double(pixel.red) * 0.21)+(Double(pixel.green) * 0.72)+(Double(pixel.blue) * 0.07))
                                    pixel.green = UInt8((Double(pixel.red) * 0.21)+(Double(pixel.green) * 0.72)+(Double(pixel.blue) * 0.07))
                                    pixel.blue = UInt8((Double(pixel.red) * 0.21)+(Double(pixel.green) * 0.72)+(Double(pixel.blue) * 0.07))
                                    myRGBA.pixels[index] = pixel
                                }
                            }
        case "contrastImage" : for y in 0..<myRGBA.width {
                                    for x in 0..<myRGBA.height{
                                        let index = y * myRGBA.width + x
                                        var pixel = myRGBA.pixels[index]
                                        pixel.red = UInt8(max(0,min(255, ((Double(pixel.red)-(Double(pixel.red)*0.5)) * 5 + (Double(pixel.red)*0.5)))))
                                        pixel.green = UInt8(max(0,min(255, ((Double(pixel.green)-(Double(pixel.green)*0.5)) * 5 + (Double(pixel.green)*0.5)))))
                                        pixel.blue = UInt8(max(0,min(255, ((Double(pixel.blue)-(Double(pixel.blue)*0.5)) * 5 + (Double(pixel.blue)*0.5)))))
                                        myRGBA.pixels[index] = pixel
                                    }
                                }
        case "invertImage" : for y in 0..<myRGBA.width {
                                for x in 0..<myRGBA.height{
                                    let index = y * myRGBA.width + x
                                    var pixel = myRGBA.pixels[index]
                                    pixel.red = UInt8(max(0,min(255, (Int(pixel.red) - 255)*(-1))))
                                    pixel.green = UInt8(max(0,min(255, (Int(pixel.green) - 255)*(-1))))
                                    pixel.blue = UInt8(max(0,min(255, (Int(pixel.blue) - 255)*(-1))))
                                    myRGBA.pixels[index] = pixel
                                }
                            }
        
        case "increasergb" : for i in 0..<myRGBA.width {
                                        for j in 0..<myRGBA.height{
                                            let index = i * myRGBA.width + j
                                            var pixel = myRGBA.pixels[index]
                                            let reddiff = Int(pixel.red) - avgRed
                                            if reddiff > 0 {
                                                pixel.red = UInt8( max(0, min(255, avgRed + reddiff*5)))
                                                myRGBA.pixels[index] = pixel
                                            }
                                            let greendiff = Int(pixel.green) - avgGreen
                                            if greendiff > 0 {
                                                pixel.green = UInt8( max(0, min(255, avgGreen + greendiff*5)))
                                                myRGBA.pixels[index] = pixel
                                            }
                                            let bluediff = Int(pixel.blue) - avgBlue
                                            if reddiff > 0 {
                                                pixel.blue = UInt8( max(0, min(255, avgBlue + bluediff*5)))
                                                myRGBA.pixels[index] = pixel
                                            }
                                        }
                                    }

        default : print("Bad Operation", operation)

        }
    return myRGBA.toUIImage()!
}
}
let test = imageFilter()
let processedImg1 = test.increaseContrast(image, operation: "increasergb")
let processedImg2 = test.increaseContrast(image, operation: "invertImage")
let processedImg3 = test.increaseContrast(image, operation: "contrastImage")
let processedImg4 = test.increaseContrast(image, operation: "greyImage")
let processedImg5 = test.increaseContrast(image, operation: "increaseBrightness")




