<h1 align="center"> SPTextField</h1>
<p align="center">
    <strong><a href="#get-started">Get Started</a></strong> |
    <strong><a href="#examples">Examples</a></strong> |
    <strong><a href="#customize">Customize</a></strong> |
    <strong><a href="#install">Install</a></strong> |
</p>

<br/>

## Get Started

1. install `SPTextField`
2. Add `SPTextField` to project

```swift
import SwiftUI
import SPTextField

struct ContentView: View {
    @State var text: String = ""
    
    var body: some View {
        SPTextField("placeholder", $text)
    }
}
```
3. Customize your `SPTextField`
## Examples
### Get Started
Customize your text field with built-in modifiers.

```swift
import SwiftUI
import SPTextField

struct ContentView: View {
    @State var text: String = ""
    
    var body: some View {
        SPTextField("placeholder", text: $text)
            .accentColor(.purple)
            .fontFromUIFont(UIFont(name: "Avenir", size: 40))
            .keyboardType(.URL)
            .returnKeyType(.done)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding()
    }
}
```
## Customize

Use this exhaustive input list to customize your text field.

Modifier | Description
--- | ---
`.fontFromUIFont(_ font: UIFont?)` | Modifies the text field’s **font** from a `UIFont` object. 🔠
`.foregroundColor(_ color: Color?)` | Modifies the **text color** 🎨 of the text field.
`.accentColor(_ accentColor: Color?)` | Modifies the **cursor color** 🌈 of the text field
`.multilineTextAlignment(_ alignment: TextAlignment)` | Modifies the **text alignment** of a text field. ↔️
`.textContentType(_ textContentType: UITextContentType?)` | Modifies the **content type** of a text field. 📧 ☎️
`.disableAutocorrection(_ disable: Bool?)` | Modifies the text field’s **autocorrection** settings.
`.keyboardType(_ type: UIKeyboardType)` | Modifies the text field’s **keyboard type**. 📩
`.autocapitalization(_ style: UITextAutocapitalizationType)` | Modifies the text field’s **autocapitalization** style. 🔡
`.returnKeyType(_ type: UIReturnKeyType)` | Modifies the text field’s **return key** type. ✅
`.isSecure(_ isSecure: Bool)` | Modifies the text field’s **secure entry** settings. 🔒
`.clearsOnBeginEditing(_ shouldClear: Bool)` | Modifies the **clear-on-begin-editing** setting of a text field. ❌
`clearsOnInsertion(_ shouldClear: Bool)` | Modifies the **clear-on-insertion** setting of a text field. 👆
`.showsClearButton(_ showsButton: Bool)` | Modifies whether and when the text field **clear button** appears on the view. ⭕️ ❌
`.passwordRules(_ rules: UITextInputPasswordRules)` | Modifies the text field's **password rules** 🔒. Sets secure entry to `true`.
`.spellChecking(_ spellChecking: Bool? = nil)` | Modifies whether the text field should check the user's **spelling**.
`.smartDashes(_ smartDashes: Bool? = nil)` | Modifies whether the text field includes **smart dashes**.
`.smartInsertDelete(_ smartInsertDelete: Bool? = nil)` | Modifies whether the text field uses **smart insert-delete**.
`.smartQuotes(_ smartQuotes: Bool? = nil)` | Modifies whether the text field uses **smart quotes**.
`.disabled(disabled: Bool)` | Modifies whether the text field is **disabled**. ✋
`.onEditingBegan(perform action: { code })` | Modifies the function called when text editing **begins**. ▶️
`.onEdit(perform action: { code })` | Modifies the function called when the user makes any **changes** to the text in the text field. 💬
`.onEditingEnded(perform action: { code })` | Modifies the function called when text editing **ends**. 🔚
`.onReturn(perform action: { code })` | Modifies the function called when the user presses the **return** key. ⬇️ ➡️
`.onClear(perform action: { code })` | Modifies the function called when the user **clears** the text field. ❌

## Install 
### Swift Package Manager (SPM)
The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler. To integrate using Apple's Swift package manager from xcode :

1. File -> Swift Packages -> Add Package Dependency...
2. Enter package URL : https://github.com/SNelusha/SPTextField.git, choose the latest release
