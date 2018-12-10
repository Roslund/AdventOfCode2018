//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

var state = particles.step(times: 10459)
PlaygroundPage.current.liveView = state.toUIView()
