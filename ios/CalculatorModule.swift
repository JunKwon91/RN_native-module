//
//  CalculatorModule.swift
//  Calculator
//
//  Created by 박준권 on 7/12/24.
//

import Foundation

@objc(CalculatorModule) //  CalculatorModule은 Objective-C에서 인식될 클래스 이름
class CalculatorModule: NSObject {
  
  
  /*
    - @objc()에서 괄호 안에 있는 문자열의 의미
      excuteCalc:: 메서드 이름
      numberA:: 첫 번째 매개변수
      numberB:: 두 번째 매개변수
      resolver:: 세 번째 매개변수
      rejector:: 네 번째 매개변수
  */
  @objc(executeCalc:numberA:numberB:resolver:rejector:)
  public func executeCalc(_ action: String, numberA: Int, numberB: Int, resolveer: RCTPromiseResolveBlock, rejector: RCTPromiseRejectBlock) -> Void {
    
    if (action == "plus") {
      resolveer(numberA + numberB)
      return;
    }
    
    if (action == "minus") {
      resolveer(numberA - numberB)
      return;
    }
    
    if (action == "multiply") {
      resolveer(numberA * numberB)
      return;
    }
    
    if (action == "divide") {
      resolveer(numberA / numberB)
      return;
    }
    
    rejector("Unexpected action type!", action, nil)
  }
}
