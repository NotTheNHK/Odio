# Getting Started with Odio

## Overview

Odio offers two distinct paradigms for interacting with its API.
An imperative approach through the ``Odio/AudioPlayer`` property wrapper and
a declarative approach through the `audioFeedback` view methods.
This article will give an overview of both paradigms, starting with `@AudioPlayer`.

## Creating an AudioPlayer
##### Initialize an instance of @AudioPlayer in one of the following three ways:

With a `String` literal.
```swift
@AudioPlayer("TapSound.mp3") private var audioPlayer
```

With a key-path.
```swift
@AudioPlayer(\.tap) private var audioPlayer
```

As an empty instance.
```swift
@AudioPlayer private var audioPlayer 
```

## Using AudioPlayer
**Control audio playback by interacting with an instance of `@AudioPlayer`.**

The `@AudioPlayer` instance `audioPlayer` is initialized as empty.
Once the view as a whole is initialized and appears
`audioPlayer` is reinitialized with the audio file of the corresponding result. 
Playback then begins by calling the instance's `callAsFunction` method.
```swift
@AudioPlayer private var audioPlayer

let result: String

var body: some View {
  Text(result)
    .onAppear {
      if result == "Player X Won" {
        audioPlayer = .init("XWonAudio.mp3")
      } else {
        audioPlayer = .init("OWonAudio.mp3")
      }
      audioPlayer()
    }
}
```

## Using AudioFeedback

The `audioFeedback` API consists of overloads applicable in different scenarios:

* ``SwiftUICore/View/audioFeedback(_:at:after:repeatMode:)-(String,_,_,_)`` Plays audio when the attached view is tapped.

* ``SwiftUICore/View/audioFeedback(_:at:after:repeatMode:trigger:)-(String,_,_,_,_)`` Plays audio when the `trigger` value changes.

* ``SwiftUICore/View/audioFeedback(_:at:after:repeatMode:shouldPlay:)-(String,_,_,_,_)`` Plays audio when `shouldPlay` is evaluated to true.

All of these methods have a `KeyPath`, `Data` and `AudioConfiguration` overload, to learn more, see: <doc:UsingFileKey>.

### audioFeedback examples:

Plays the "OpenSound.mp3" sound effect whenever the button is tapped.
```swift
var body: some View {
	Button("Open") { ... }
		.audioFeedback("OpenSound.mp3")
}
```

Plays the "VolumeSound.mp3" sound effect each time the volume value changes.
```swift
@State private var volume = 0.5

var body: some View {
	Stepper(
		"Volume: \(volume.formatted(.percent))",
		value: $volume,
		in: 0...1,
		step: 0.1)
	.audioFeedback("VolumeSound.mp3", trigger: volume)
}
```

Plays the "VolumeLimit.mp3" sound only when the volume reaches its maximum value (100%).
```swift
@State private var volume = 0.5

var body: some View {
	Stepper(
		"Volume: \(volume.formatted(.percent))",
		value: $volume,
		in: 0...1,
		step: 0.1)
	.audioFeedback("VolumeLimit.mp3") {
		volume == 1
	}
}
