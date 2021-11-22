### Notification Center

> Notification center is not a notification process as it is thought.

> By generating a notification within the application, you can access this notification from anywhere.

> Notification Center is the sending part and the observer is the receiving part.

- Notification Center: If it is a radio station
- Observer: Radio


![mm1](https://user-images.githubusercontent.com/49749125/142889530-6c7bd0bc-a6b0-41c0-835f-a14a20060620.png)


### Creating Notification Name with Extension


```swift
extension Notification.Name{
    static let notificationName = Notification.Name("notificationX")
}
```

> We use the key value pair structure when sending notifications.

> With userInfo, we can send data in the form of key value pairs in the array.

> But I want to show that we can create a class and use an object as follows.

```swift
class Persons{
    var personName : String?
    var personAge : Int?
    
    init(){
        
    }
    
    init(personName : String , personAge : Int){
        self.personName = personName
        self.personAge = personAge
    } 
}

```

### Notification Submission

```swift
   let person = Persons(personName: "Alican", personAge: 26)
   NotificationCenter.default.post(name: .notificationName, object: nil, userInfo: ["message" : "hello" , "todaysDate" : Date(), "data" : person]) 
```
> Data is sent in dictionary format with userInfo.

### Capture and Listen to Notification

```swift
   // We will handle broadcast (comed from Notification Center)
   NotificationCenter.default.addObserver(self, selector: #selector(makeSomething(notification:)), name: .notificationName, object: nil)
```

```swift
    @objc func makeSomething(notification : Notification){
      let comedMessage = notification.userInfo?["message"]
      let comedDate = notification.userInfo?["todaysDate"]
      let comedData = notification.userInfo?["data"] as! Persons
      dataLabel.text = "\(comedData.personName!) \(comedData.personAge!)"
    }
```









