# Streamlining Customization with AudioConfiguration

## Overview

Manually configuring multiple audio player is tedious and error-prone. 
Therefore `Odio` provides initializer overloads as well as an interface 
to configure and update an audio player with a configuration.

## Levering Configuration

You generally want to create the configuration(s) once, 
then pass the configuration(s) as argument(s) 
to an audio player's initializer or `update(with:)` method.

```swift
extension AudioConfiguration {
	static let appWideCon = AudioConfiguration(
		speed: 1.25,
		delay: 1,
		repeatMode: .repeating(1))
}
```

```swift
@AudioPlayer(
	"AppWideSound.mp3",
	configuration: .appWideCon)
private var audioPlayer
```

```swift
@AudioPlayer private var audioPlayer

@State private var configuration = AudioConfiguration()

...

var body: some View {
	Form {
		...
	}
	.onChange {
		audioPlayer.update(with: configuration)
	}
}
```
