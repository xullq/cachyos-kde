# CachyOS KDE Plasma Setup (Dual Monitor Minimal)

Minimalistinen, suorituskykyinen ja tarkkaan kuratoitu KDE Plasma 6 Wayland -ympäristö CachyOS:lle.

Optimoitu erityisesti:
- **Kahdelle näytölle** (itsenäiset virkistystaajuudet ja skaalaukset ilman nykimistä)
- **AMD Ryzen 7 7800X3D + NVIDIA RTX 3070** -kokoonpanolle
- Puhtaaseen järjestelmään ilman turhia taustaprosesseja tai KDE-ohjelmistospagettia

---

## 📦 Valitut sovellukset ja komponentit

| Kategoria | Valinta | Kuvaus / Rationale |
| **Ydin (Core)** | `plasma-desktop`, `kscreen`, `sddm`, `sddm-silent-theme`, `kwin-polonium`, `better-blur-dx`, `rounded-corners`, `bibata-cursor` | Wayland-ydin, moninäyttöohjaus, SilentSDDM, KWin-laatoitus, sumennus, pyöristetyt kulmat & Bibata-kursori |
| **Pääte** | `ghostty` | Moderni, GPU-kiihdytetty natiivi Wayland-terminaali |
| **Shell & CLI** | `zsh`, `starship`, `fzf`, `zoxide`, `eza`, `bat` | Nopea Zsh, Starship-prompt ja modernit Rust-työkalut |
| **Tiedostot** | `dolphin` + thumbnailers | Paras tiedostonhallinta, jaettu näkymä ja esikatselukuvat |
| **Selaimet** | `zen-browser-bin`, `firefox` | Zen henkilökohtaiseen käyttöön, Firefox kehitystyökaluihin |
| **Editorit** | `vscodium-bin`, `zed`, `micro` | Telemetriaton VS Code laajennuksille, nopea Zed & CLI-editori |
| **AI-työkalut** | `@anthropic-ai/claude-code` | Claude Code CLI terminaaliin |
| **Media & Kuvat** | `qview`, `vlc` | Ultrakevyt Qt-kuvankatselin ja monipuolinen videosoitin |
| **Apuohjelmat & Levyt** | `bottom`, `fastfetch`, `bitwarden`, `btrfs-assistant`, `ntfs-3g`, `spectacle`, `pavucontrol-qt`, `ark` | Työkalut, salasanat, Btrfs-snapshotit ja Windows-levytuki |
| **Ääni & Laitteisto** | `pipewire`, `easyeffects`, `bluez`, `bluedevil` | Äänisuodatus ja Bluetooth-integraatio |
| **Pelaaminen** | `steam`, `prismlauncher`, `flatpak` (Sober), `gamemode`, `mangohud` | Täysi suorituskyky, Minecraft, Roblox ja pelityökalut |
| **Fontit** | `otf-hermit-nerd`, `noto-fonts` | Selkeä Hermit koodaukseen/terminaaliin ja Noto järjestelmälle |

---

## ⚡ Optimoinnit (`scripts/optimize.sh`)
- **Baloo-tiedostohaku poistettu käytöstä:** Säästää levyn I/O:ta ja suorittimen taustakuormaa.
- **Käyttöliittymän animaatiot:** Nopeutettu 2x, jotta työpöytä reagoi viiveettä.
- **Fontit:** Asetettu Noto Sans ja Hermit Nerd Font oletuksiksi.
- **Osoitinteema:** Asetettu Bibata-Modern-Classic oletukseksi (Plasma, GTK ja XCursor).

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
- [uiriansan/SilentSDDM](https://github.com/uiriansan/SilentSDDM) – Äärimmäisen minimalistinen, moderni ja rauhallinen Qt6 SDDM -kirjautumisteema (Catppuccin, Nord ja Everforest -preseteillä).
- [Paletty (paletty.dev)](https://paletty.dev/) – Terminaaliväripalettien luonti ja kuvista poimiminen (suora vienti Ghosttyyn, Kittyyn, Alacrittyyn jne.).
- [fosslife/awesome-ricing](https://github.com/fosslife/awesome-ricing) – Kattava kuraatio parhaista työkaluista, teemoista, fonteista ja oppaista Linux-työpöydän kustomointiin ("The Art of Ricing").
- [Nadir-Alishly/kde-plasma-rice](https://github.com/Nadir-Alishly/kde-plasma-rice) – Kattava askel askeleelta -opas KDE Plasman kustomointiin (kelluvat paneelit, dock-asettelu, läpikuultavuus ja Kvantum-teemat).
- [Panel Colorizer](https://github.com/luisbocanegra/plasma-panel-colorizer) – Lisäosa, jolla Plasman paneeleista saa luotua Waybar-tyylisiä kelluvia "pillereitä" ja saarekkeita ilman koodaamista.
- [kwin-effects-better-blur-dx](https://github.com/xarblu/kwin-effects-better-blur-dx) – KWin Plasma 6 sumennustehoste: Force-blur, kylläisyyden ja taittumisen säätö sekä animaatiokorjaukset.
- [kwin-effect-rounded-corners](https://github.com/matinlotfali/KDE-Rounded-Corners) – Ikkunoiden kulmien pyöristys, reunaviivat (outlines) ja varjot Plasma 6 Waylandilla (CachyOS: `kwin-effect-rounded-corners`).
- [Polonium (Auto-Tiling KWinille)](https://github.com/zeroxoneafour/polonium) – KWin-skripti, joka tuo automaattisen ikkunoiden asettelun (tiling) Plasmaan Waylandilla.
- [YAMIS (Yet Another Monochrome Icon Set)](https://store.kde.org/p/2303161/) – Minimalistinen adaptiivinen monochrome-kuvaketeema KDE Plasmalle (`yamis-icon-theme-git`).
- [Kara Pager](https://github.com/dhruv8sh/kara) – Moderni ja siisti työtilaindikaattori (pager) Plasma 6 -paneeliin (`plasma6-applets-kara`).
- [KDE Material You Colors](https://github.com/luisbocanegra/kde-material-you-colors) – Automaattinen Material You -väripalettien generointi taustakuvasta Plasmaan ja teemoihin (`kde-material-you-colors`).
- [Window Title Reborn](https://github.com/ShrekBytes/window-title-reborn) – Plasma 6 -paneeliwidgetti aktiivisen ikkunan otsikolle ja säätimille (KDE Store: [store.kde.org/p/2350022](https://store.kde.org/p/2350022)).
- [Bibata Cursor](https://github.com/ful1e5/Bibata_Cursor) – Moderni, pyöristetty ja viimeistelty kursoriteema (`bibata-cursor-theme-bin`).
- [KDE Store (store.kde.org)](https://store.kde.org/) – Plasmoidit, widgetit, teemat ja kuvakepaketit.

### ⚙️ CachyOS & Suorituskyky
- [CachyOS Wiki](https://wiki.cachyos.org/) – CachyOS:n virallinen dokumentaatio, x86-64-v3/v4 -repositoriot ja `chwd`-ajurienhallinta.
- [CachyOS Gaming Guide](https://wiki.cachyos.org/gaming/) – Optimaaliset asetukset Steamille, Protonille ja GameModelle.
- [Arch Wiki: KDE](https://wiki.archlinux.org/title/KDE) – Yksityiskohtainen opas KDE Plasman asetuksiin, palveluihin ja virheenkorjaukseen.

### ⌨️ Pikanäppäimet
- [Niri-pikanäppäinten vertailutaulukko](docs/shortcuts_reference.md) – Nykyiset läppärisi pikanäppäimet muistiinpanona ja niiden vastineet KDE Plasmassa / Poloniumissa.

---

## 🧪 Harkinnanvaraiset & Kokeelliset komponentit

### 🌌 Caelestia-KDE (Futuristinen työpöytäkuori)
* **Lähdekoodi:** [ladybug-me/caelestia-kde](https://github.com/ladybug-me/caelestia-kde)
* **Mitä tekee:** Korvaa Plasman vakiopaneelit Hyprland-tyylisellä modernilla QML/C++ -kuorella (Nexus-ohjauskeskus, dynaamiset väriteemat, kelluvat widgetit ja sivupalkit).
* **Suorituskyky:** Ei hidasta rautaa (GPU-kiihdytetty Qt6/QML), mutta vaatii enemmän ylläpitoa ja voi vaatia paneelisäätöä kahdella näytöllä.
* **Asennus haluttaessa kokeilla:**
  ```bash
  curl -fsSL https://raw.githubusercontent.com/ladybug-me/caelestia-kde/main/install.sh | sh
  ```
* **Poisto (palauttaa vakio-Plasman):**
  ```bash
  cd ~/caelestia-kde && bash ./uninstall.sh
  ```

### 🪟 Klassy (Edistynyt ikkunakoristelu & otsikkopalkkien hallinta)
* **Lähdekoodi:** [paulmcauley/klassy](https://github.com/paulmcauley/klassy)
* **Mitä tekee:** Korvaa perus-Breezen edistyneellä ikkunakoristelulla:
  - Mahdollistaa erittäin matalat (slim) tai läpinäkyvät otsikkopalkit.
  - Säädettävä kulmien pyöristyssäde (corner radius).
  - *Window-Specific Overrides* -valikosta otsikkopalkit tai painikkeet voi piilottaa sovelluskohtaisesti.
* **Asennus haluttaessa kokeilla (AUR):**
  ```bash
  paru -S klassy
  ```

### 🖼️ YAMIS (Yet Another Monochrome Icon Set)
* **KDE Store:** [store.kde.org/p/2303161](https://store.kde.org/p/2303161/)
* **Mitä tekee:** Puhdas ja yhtenäinen adaptiivinen monochrome-kuvakepaketti KDE Plasmalle.
  - Mukautuu automaattisesti järjestelmän valittuun korostusväriin (accent color) tai pysyy neutraalina (harmaa/valkoinen/musta).
  - Täydellinen minimalistiseen tyyliin, jos oletusarvoiset värikkäät kuvakkeet häiritsevät.
* **Asennus (AUR tai KDE Asetukset):**
  ```bash
  paru -S yamis-icon-theme-git
  ```
  *(Tai suoraan: Järjestelmäasetukset -> Värit ja teemat -> Kuvakkeet -> Hae uusia kuvakkeita -> "YAMIS")*

### 🎯 Kara (Moderni työtilaindikaattori paneeliin)
* **Lähdekoodi:** [dhruv8sh/kara](https://github.com/dhruv8sh/kara)
* **Mitä tekee:** Minimalistinen ja moderni virtuaalityöpöytien indikaattori (pager) Plasma 6 -paneelille.
  - Korvaa vanhanaikaisen KDE-pageroinnin siisteillä Hyprland/Sway-tyylisillä pillereillä, pisteillä tai numeroilla.
  - Tukee sulavia siirtymäanimaatioita ja eri korostustyylejä.
* **Asennus (AUR tai KDE Widgetit):**
  ```bash
  paru -S plasma6-applets-kara
  ```
  *(Tai suoraan paneelista: Lisää widgettejä -> Hae uusia widgettejä -> "Kara")*

### 🎨 KDE Material You Colors (Dynaamiset teemavärit taustakuvasta)
* **Lähdekoodi:** [luisbocanegra/kde-material-you-colors](https://github.com/luisbocanegra/kde-material-you-colors)
* **Mitä tekee:** Generoi automaattisesti harmonisen Material You -väripaletin suoraan aktiivisesta työpöydän taustakuvasta.
  - Soveltaa korostusvärit automaattisesti Plasmaan, ikkunakoristeluihin (esim. Klassy) ja sovelluksiin (Qt/GTK).
  - Tukee pywal-integraatiota (päivittää terminaalivärit taustakuvan sävyihin).
* **Asennus (AUR):**
  ```bash
  paru -S kde-material-you-colors
  ```

### 🪟 Window Title Reborn (Aktiivisen ikkunan otsikko paneeliin)
* **Lähdekoodi:** [ShrekBytes/window-title-reborn](https://github.com/ShrekBytes/window-title-reborn) | [KDE Store](https://store.kde.org/p/2350022)
* **Mitä tekee:** Näyttää aktiivisen ikkunan otsikon, kuvakkeen ja haluttaessa ikkunapainikkeet suoraan Plasman yläpaneelissa.
  - Erinomainen kumppani Polonium-laatoitukselle tai Klassylle: ikkunoiden omat otsikkopalkit voidaan piilottaa kokonaan ja säästää pystytilaa puhtaalla macOS / Unity -tyylillä.
* **Asennus (KDE Widgetit tai Git):**
  - Suositus: *Paneelin asetukset -> Lisää widgettejä -> Hae uusia widgettejä -> "Window Title Reborn"*.
  - Tai terminaalista:
    ```bash
    git clone https://github.com/ShrekBytes/window-title-reborn.git /tmp/window-title-reborn
    kpackagetool6 -t Plasma/Applet -i /tmp/window-title-reborn
    ```

### 🖱️ Bibata Cursor (Pyöristetty moderni osoitinteema)
* **Lähdekoodi:** [ful1e5/Bibata_Cursor](https://github.com/ful1e5/Bibata_Cursor)
* **Mitä tekee:** Yksi Linux-yhteisön suosituimmista ja viimeistellyimmistä kursoriteemoista.
  - Erinomainen kumppani pyöristetyille ikkunoille ja moderneille teemoille.
  - Suosituimmat variantit:
    - `Bibata-Modern-Classic` (musta pehmeällä valkoisella reunuksella)
    - `Bibata-Modern-Ice` (puhdas valkoinen mustalla varjostuksella)
    - `Bibata-Modern-Amber` (keltainen/oranssi)
* **Asennus (AUR):**
  ```bash
  paru -S bibata-cursor-theme-bin
  ```

### 🎵 Musiikki & Viestintä (Myöhemmin päätettävät)
* **Spotify:** `spot` (Rust-natiivi kevyt GUI) tai `ncspot` (terminaaliin) virallisen Electron-äpin sijaan.
* **Discord:** `vesktop` (PipeWire-ruudunjako äänellä) tai Discord suoraan Zen-selaimessa.
