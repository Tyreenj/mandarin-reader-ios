# Mandarin Reader for iPad

A thin native wrapper (Capacitor) around your self-hosted Mandarin Reader. On first launch you type
your server address; the app remembers it and opens your site full-screen. AI (Ollama) host/model
are edited inside the app at **Settings → AI (Ollama)** and are saved on the server.

## 1. Build the .ipa (needs no Mac)
1. Create a new **private** GitHub repo and push the contents of this folder.
2. Go to **Actions → Build unsigned IPA → Run workflow** (it also runs on every push).
3. When it finishes (~5 min), download the **MandarinReader-ipa** artifact and unzip it to get `MandarinReader.ipa`.

## 2. Sideload from Windows
**Sideloadly (simplest)**
1. Install iTunes and iCloud from apple.com (not the Microsoft Store versions) and Sideloadly.
2. Plug in the iPad, trust the computer, enable **Settings → Privacy & Security → Developer Mode**.
3. Drag `MandarinReader.ipa` into Sideloadly, enter your Apple ID, click Start.
4. On the iPad: **Settings → General → VPN & Device Management** → trust your Apple ID.

A free Apple ID signature lasts **7 days**; re-run Sideloadly weekly (or use AltStore to auto-refresh over Wi-Fi). A paid developer account lasts 1 year.

## 3. First launch
Enter your server, e.g. `https://mandarin.vonos.space` or `100.79.108.4:8083` (include the port for http addresses). Use **Settings → Change server address** to switch later.

## 4. Server update
Redeploy the server zip (it adds the AI settings endpoints) and rebuild: `docker compose up -d --build`.
Then set host/model in the app: Settings → AI (Ollama) → Test → Save.
