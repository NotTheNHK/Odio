# Customize playback behavior

## Overview

Besides simple audio playback, `Odio` provides further customization of the following properties:
* `speed`: Customizing this property changes at what speed playback should occur, e.g, 
setting this property to a value of `0.5` plays back audio at half the speed. 
The default is `1.0`, which indicates that audio playback occurs at standard speed. 

* `delay`: Customizing this property changes when playback should occur, e.g, 
setting this property to a value of `10` introduces a delay of `10` seconds before playback occurs. 
The default is `0`.

* `repeatMode`: Customizing this property changes how many times playback should be repeated, 
there are three possible values, `never`, `repeating`, `loop` to set this property to. 
The default is `never`.
  * `never`: Never repeats playback. 
  
  * `repeating(UInt)`: Repeats playback a specified number of times, e.g, `repeating(1)` will play the audio a total of two times, once the original playback and one repeat.

  * `loop`: Repeats the audio indefinitely.

- Important: Customizing any of these properties doesn't have any effect while playback is occurring, 
the new value will take effect once the next playback begins. For example, setting `repeatMode` to `never` while playback is occuring 
with `repeatMode` set to `loop` won't stop playback, to take effect restart playback.

- Note: The following examples only show initializer customization,
each property can also be directly customized by referring to it directly.

## Change playback speed
Speed is specified as a floating point number
where a value of `1.0` represents standard speed, `0.5` half the speed, `2.0` double the speed, etc. 

`LongSound.mp3` has a duration of `10` seconds played back at double the speed. 
Thus, `audioPlayer` will finish playback **after** `5` seconds.
```swift
@AudioPlayer("LongSound.mp3", at: 2.0) private var audioPlayer

var body: some View {
  Button("Play Sound Quickly") {
    audioPlayer()
  }
}
```

## Adding delay to playback
Delay is always specified in seconds,
can be a fraction of a second as well, e.g, `1.0`, `0.5` are both valid values.

`audioPlayer` will begin playback **after** `1` second.
```swift
@AudioPlayer("TapSound.mp3", after: 1) private var audioPlayer

var body: some View {
  Button("Play Sound After 1 Second") {
    audioPlayer()
  }
}
```

## Repeat playback
Set a specific mode by selecting one of the `RepeatMode` cases.

Pressing the button plays `audioPlayer`'s audio **twice**.
```swift
@AudioPlayer("RepeatedSound.mp3", repeatMode: .repeating(1)) private var audioPlayer

var body: some View {
  Button("Play Sound Twice") {
    audioPlayer()
  }
}
```
