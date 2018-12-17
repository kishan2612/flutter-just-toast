# flutter_just_toast

A minimal flutter toast plugin for both Android and IOS

## Usage 

In pubspec.yaml

```
flutter_just_toast: ^1.0.1

```

Import flutter_just_toast/flutter_just_toast.dart

#### Simple toast

```
Toast.show(message:"Hello world",duration: Delay.SHORT);
````
#### Customized Toast

```
Toast.show(message:"Hello world",duration: Delay.SHORT,
backgroundColor: Colors.blue,
textColor: Colors.black);

```

Duration :
```
Delay.SHORT,
Delay.LONG
```


### Note

v1.0.1 : Toast customisation is implemented only in IOS.



IOS Interdependency :
[Toaster](https://github.com/devxoul/Toaster)


