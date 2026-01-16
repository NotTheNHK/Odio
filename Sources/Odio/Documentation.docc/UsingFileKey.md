# Safely and Swiftly Initialize Audio Players

## Overview

Using string literals to initialize audio players may work well initially,
but as the project grows, this becomes more cumbersome and error-prone.
There are different approaches one can take to resolve these issues, 
one of these approaches is ``Odio/FileKey``.

## What is FileKey?
At its essence, `FileKey` offers an interface through which you reference files.

## How to Use FileKey?

### Creating a FileKey

First, extend `FileKey` with a new property and attach the @Entry macro to its declaration:
```swift
extension FileKey {
  @Entry var tap = "TapSound.mp3"
}
```

### Using Filekey

All `Odio` APIs that accept a `String` as the file name
also provide an overload that accepts a `KeyPath` in the form of: `KeyPath<FileKey, String>`.

Instead of using (_ fileName: String):
```swift
@AudioPlayer("TapSound.mp3") private var audioPlayer
```

Use (_ keyPath: KeyPath<FileKey, String>)):
```swift
@AudioPlayer(\.tap) private var audioPlayer
```

Instead of using (_ fileName: String):
```swift
var body: some View {
	Button("Open") { ... }
		.audioFeedback("TapSound.mp3")
}
```

Use (_ keyPath: KeyPath<FileKey, String>):
```swift
var body: some View {
	Button("Open") { ... }
		.audioFeedback(\.tap)
}
```
