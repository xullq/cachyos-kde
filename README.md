# CachyOS KDE Plasma Setup (Dual Monitor Minimal)

Minimalistinen, suorituskykyinen ja tarkkaan kuratoitu KDE Plasma 6 Wayland -ympäristö CachyOS:lle.

Optimoitu erityisesti:
- **Kahdelle näytölle** (itsenäiset virkistystaajuudet ja skaalaukset ilman nykimistä)
- **AMD Ryzen 7 7800X3D + NVIDIA RTX 3070** -kokoonpanolle
- Puhtaaseen järjestelmään ilman turhia taustaprosesseja tai KDE-ohjelmistospagettia

---

## 📦 Valitut sovellukset ja komponentit

| Kategoria | Valinta | Kuvaus / Rationale |
| :--- | :--- | :--- |
| **Ydin (Core)** | `plasma-desktop`, `kscreen`, `sddm` | Minimalistinen Wayland-ydin + moninäyttöohjaus |
| **Pääte** | `ghostty` | Moderni, GPU-kiihdytetty natiivi Wayland-terminaali |
| **Tiedostot** | `dolphin` + thumbnailers | Paras tiedostonhallinta, jaettu näkymä ja esikatselukuvat |
| **Selaimet** | `zen-browser-bin`, `firefox` | Zen henkilökohtaiseen käyttöön, Firefox kehitystyökaluihin |
| **Editorit** | `vscodium-bin`, `zed`, `micro` | Telemetriaton VS Code laajennuksille, nopea Zed & CLI-editori |
| **AI-työkalut** | `@anthropic-ai/claude-code` | Claude Code CLI terminaaliin |
| **Media & Kuvat** | `qview`, `vlc` | Ultrakevyt Qt-kuvankatselin ja monipuolinen videosoitin |
| **Apuohjelmat** | `spectacle`, `pavucontrol-qt`, `ark`, `kcalc` | Ruutukaappaukset, tarkka äänimikseri ja pakkaustyökalut |
| **Ääni & Laitteisto** | `pipewire`, `easyeffects`, `bluez`, `bluedevil` | Äänisuodatus ja Bluetooth-integraatio |
| **Pelaaminen** | `steam`, `gamemode`, `mangohud` | Täysi suorituskyky ja FPS-seuranta peleihin |
| **Fontit** | `ttf-geist-mono-nerd`, `noto-fonts` | Moderni Geist Mono koodaukseen ja Noto järjestelmälle |

---

## ⚡ Optimoinnit (`scripts/optimize.sh`)
- **Baloo-tiedostohaku poistettu käytöstä:** Säästää levyn I/O:ta ja suorittimen taustakuormaa.
- **Käyttöliittymän animaatiot:** Nopeutettu 2x, jotta työpöytä reagoi viiveettä.
- **Fontit:** Asetettu Noto Sans ja Geist Mono oletuksiksi.

---

## 🚀 Käyttöönotto uudella koneella

1. Asenna CachyOS (esim. Base/CLI tai ilman ylimääräisiä paketteja).
2. Kloonaa tämä repositorio:
   ```bash
   git clone https://github.com/xullq/cachyos-kde.git ~/cachyos-kde
   cd ~/cachyos-kde
   ```
3. Aja asennusskripti:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
4. Käynnistä kone uudelleen:
   ```bash
   sudo reboot
   ```

---

## 📚 Hyödyllisiä linkkejä & Kustomointioppaita

### 🎨 Ulkoasu ja "Ricing"
- [Nadir-Alishly/kde-plasma-rice](https://github.com/Nadir-Alishly/kde-plasma-rice) – Kattava askel askeleelta -opas KDE Plasman kustomointiin (kelluvat paneelit, dock-asettelu, läpikuultavuus ja Kvantum-teemat).
- [Panel Colorizer](https://github.com/luisbocanegra/plasma-panel-colorizer) – Lisäosa, jolla Plasman paneeleista saa luotua Waybar-tyylisiä kelluvia "pillereitä" ja saarekkeita ilman koodaamista.
- [Polonium (Auto-Tiling KWinille)](https://github.com/zeroxoneafour/polonium) – KWin-skripti, joka tuo automaattisen ikkunoiden asettelun (tiling) Plasmaan Waylandilla.
- [KDE Store (store.kde.org)](https://store.kde.org/) – Plasmoidit, widgetit, teemat ja kuvakepaketit.

### ⚙️ CachyOS & Suorituskyky
- [CachyOS Wiki](https://wiki.cachyos.org/) – CachyOS:n virallinen dokumentaatio, x86-64-v3/v4 -repositoriot ja `chwd`-ajurienhallinta.
- [CachyOS Gaming Guide](https://wiki.cachyos.org/gaming/) – Optimaaliset asetukset Steamille, Protonille ja GameModelle.
- [Arch Wiki: KDE](https://wiki.archlinux.org/title/KDE) – Yksityiskohtainen opas KDE Plasman asetuksiin, palveluihin ja virheenkorjaukseen.
