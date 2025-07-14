# 🎯 TapGame (SwiftUI)

A fun, lightweight iOS game built using **SwiftUI** where players tap matching images to score points. The game supports multiple difficulty levels and uses **Combine's Timer publisher** to animate the gameplay.

---

## 🚀 Features

- ✅ Dynamic image switching using `Timer.publish()` from Combine
- ✅ `Menu` control to select difficulty levels: **Easy**, **Medium**, **Hard**
- ✅ Real-time score tracking
- ✅ SwiftUI-based clean interface
- ✅ `Restart Game` option to replay anytime

---

## 🧠 How It Works

1. Every second (or faster, depending on difficulty), the image changes automatically using a **Combine `Timer` publisher**.
2. A target image is displayed below the changing image.
3. The player must tap the correct image when it appears.
4. If correct, the score increases by 1; otherwise, the game shows an "Incorrect" message.
5. After a tap, the game pauses and shows an option to **restart**.

---

## 🧩 Difficulty Levels

Difficulty affects how fast the images change:

| Level   | Interval (seconds) |
|---------|--------------------|
| Easy    | 1.0                |
| Medium  | 0.5                |
| Hard    | 0.1                |

Selected via a SwiftUI `Menu`.

---

## 📱 UI Components Used

- `Image` – To show the changing and target pictures.
- `Menu` – For selecting difficulty.
- `Alert` – Feedback for correct or incorrect taps.
- `Text` – To display current score and target.
- `Button` – Restart the game after each attempt.
- `Combine.Timer.publish()` – To drive the image change based on difficulty.

---

## 🛠️ Technologies

- **Swift 5**
- **SwiftUI**
- **Combine Framework**
- Xcode 14+

---

## 💡 Code Highlights

### Timer Publisher (Auto Image Switch)
```swift
@State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

.onReceive(timer) { _ in
    changePics()
}
```
## 📦 Future Enhancements

Add timer-based countdown mode

Add animations for correct/wrong taps


## 👨‍💻 Author

Purna Sindhu Bachu

iOS Developer 

