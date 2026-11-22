# Smart Notepad

A lightweight, Windows 11 Notepad-style text editor built with Python and Tkinter that proofreads and corrects your spelling, grammar, punctuation, and sentence structure using the **Google Gemini API**—without changing your original meaning, tone, or formatting.

It requires **zero third-party dependencies** (Python standard library only) and supports **English, Hindi, and Hinglish**.

---

## Features

- **Smart, Incremental Proofreading**
  - Only sends new or modified sentences to Gemini—sentences that have already been corrected (or were already in an opened file) are remembered and never re-sent.
  - Preserves line breaks, lists, numbers, names, URLs, emojis, and code.
  - Safe to use while typing: if you keep typing while a correction is in flight, the outdated correction is skipped so your new text is never overwritten.
  - Full undo support—press `Ctrl+Z` to instantly revert any correction.
- **Flexible Correction Modes**
  - **Manual:** Press `Ctrl+Enter` (or click **Fix text**) to correct new or changed text.
  - **Selection:** Highlight any text and press `Ctrl+G` (or right-click → **Fix selected text**) to proofread only that selection.
  - **Auto-correct (per tab):** Toggle **Auto-correct** on in the top bar or **Edit** menu to automatically proofread ~2.5 seconds after you pause typing.
  - **Re-check All:** Use **Edit → Re-check whole text** to re-proofread the entire document from scratch.
- **Windows 11 Notepad-Style Interface**
  - Multi-tab workspace with unsaved change indicators (`●`), tab hover close buttons (`✕`), and middle-click to close.
  - **Dark Mode** (default) and **Light Mode** (`Ctrl+D`), remembered across sessions.
  - Smooth zooming (`Ctrl++`, `Ctrl+-`, `Ctrl+0`, or `Ctrl+MouseWheel`).
  - Status bar displaying cursor position (`Ln, Col`), character count, live status messages, zoom percentage, line endings, and encoding (`UTF-8`).
- **Automatic Session Persistence**
  - Open tabs, unsaved drafts, cursor positions, per-tab auto-correct toggles, and window size are automatically saved in the background.
  - Close the app anytime without save prompts—everything is restored exactly as you left it on the next launch.

---

## Requirements

- **Python 3.8+**
- **Tkinter** (included by default with Python on Windows and macOS)
  - On Debian/Ubuntu Linux, install it with:
    ```bash
    sudo apt install python3-tk
    ```
- A free **Google Gemini API key** from [Google AI Studio](https://aistudio.google.com/apikey)

No `pip install` commands are needed.

---

## Getting Started

1. **Run the application:**
   ```bash
   python smart_notepad.py
   ```
2. **Add your Gemini API key:**
   - On the first run, the **Settings** window opens automatically (you can also open it anytime via `Ctrl+,` or the `⚙` icon).
   - Click **Get a free API key** or visit [aistudio.google.com/apikey](https://aistudio.google.com/apikey) to generate a key.
   - Paste your key into the **Gemini API key** field, click **Test key** to verify it works, and click **Save**.
   - *(Optional)* You can also change the Gemini model in Settings (defaults to `gemini-3.5-flash-lite`).

---

## Keyboard Shortcuts

| Shortcut | Action |
| :--- | :--- |
| `Ctrl+N` / `Ctrl+T` | New tab |
| `Ctrl+O` | Open file(s) |
| `Ctrl+S` | Save |
| `Ctrl+Shift+S` | Save as |
| `Ctrl+W` | Close current tab *(or middle-click a tab)* |
| `Ctrl+Tab` / `Ctrl+Shift+Tab` | Switch to next / previous tab |
| `Ctrl+Enter` | Fix new/changed text *(or selection if highlighted)* |
| `Ctrl+G` | Fix selected text |
| `Ctrl+Z` / `Ctrl+Y` | Undo / Redo |
| `Ctrl+A` | Select all |
| `Ctrl+D` | Toggle Dark / Light mode |
| `Ctrl+,` | Open Settings |
| `Ctrl++` / `Ctrl+-` | Zoom in / Zoom out *(also `Ctrl+MouseWheel`)* |
| `Ctrl+0` | Reset zoom to 100% |

---

## Configuration & Data Storage

Smart Notepad stores your preferences and session data locally on your computer—your API key is never hardcoded in the script.

- **Windows:** `%APPDATA%\SmartNotepad\`
- **Linux / macOS:** `~/.config/SmartNotepad/` *(or `$XDG_CONFIG_HOME/SmartNotepad/`)*

Files created in this directory:
- `settings.json` — Stores your API key, selected Gemini model, theme preference, and zoom level.
- `session.json` — Stores open tabs, unsaved text, cursor positions, and window layout (written atomically to prevent corruption).

---

## Troubleshooting

- **API key rejected or missing:** Press `Ctrl+,` to open Settings, verify your key with **Test key**, and ensure it has access to the configured model.
- **`ModuleNotFoundError: No module named 'tkinter'` (Linux):** Install Tkinter for your Python version (e.g., `sudo apt install python3-tk`).
- **Corrections aren't running automatically:** Auto-correct is **Off** by default for new tabs. Click **Auto-correct: Off** in the top bar to enable it for the current tab, or press `Ctrl+Enter` to correct on demand.