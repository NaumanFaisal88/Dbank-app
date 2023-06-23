import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  var currentValue : Float = 300;
  currentValue := 100;
  Debug.print(debug_show (currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show (startTime));

  let id = 5454545;
  // Debug.print(debug_show (id));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };
  public func withdraw(amount : Float) {
    let reducedValue : Float = currentValue -amount;
    if (reducedValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("The amount you have requested exceeds the balance available");
    };
  };
  public query func checkBalance() : async Float {
    return currentValue;
  };

  // topUp();

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime -startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.001 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
};
