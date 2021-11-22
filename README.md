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
