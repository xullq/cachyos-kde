# Niri-pikanäppäinten vertailu- ja muistiinpanotaulukko

Tämä dokumentti listaa nykyisen läppärikokoonpanosi (`niri-agent`) aktiiviset pikanäppäimet sekä niiden vastaavat toiminnot KDE Plasmassa. Voit käyttää tätä ohjeena, jos haluat myöhemmin ottaa näitä käyttöön Plasmassa ilman, että ne ylikirjoittavat KDE:n oletuksia automaattisesti.

---

## 1. Sovellukset ja järjestelmätoiminnot

| Pikanäppäin | Niri-toiminto | KDE Plasma -vastine / Asetuspolku |
| :--- | :--- | :--- |
| **`Super + T`** | Avaa terminaali (`kitty` / `ghostty`) | *Asetukset → Pikanäppäimet → Omat pikanäppäimet → Käynnistä Ghostty* |
| **`Super + D`** | Sovelluskäynnistin (`walker`) | *KRunner* tai sovellusvalikko (KDE:ssä oletus `Alt + F2` tai pelkkä `Super`) |
| **`Super + N`** | Ilmoituskeskus (`swaync`) | KDE:n oma ilmoituskeskus paneelissa |
| **`Super + A`** | Äänilaitteen valitsin (`audio-select`) | KDE:n äänenhallintapaneeli / `pavucontrol-qt` |
| **`Super + Shift + S`** | Rajattu ruutukaappaus | `spectacle -r` (Spectacle-aluekaappaus) |
| **`Super + Alt + L`** | Lukitse näyttö | `Super + L` (KDE oletus) |
| **`Super + Escape`** tai `Super + Shift + E` | Uloskirjautumisvalikko (`wlogout`) | `Ctrl + Alt + Del` (KDE:n sammutus-/uloskirjautumisvalikko) |

---

## 2. Ikkunoiden hallinta ja laatoitus (Polonium / KWin)

| Pikanäppäin | Niri-toiminto | Polonium / KWin -vastine |
| :--- | :--- | :--- |
| **`Super + Q`** | Sulje aktiivinen ikkuna | *KWin: Window Close* (korvaa oletuksen `Alt + F4`) |
| **`Super + F`** | Maksimoi sarake | *KWin: Window Maximize* (Koko näyttö reunoihin asti) |
| **`Super + Shift + F`** | Täysi kokoruututila (*Fullscreen*) | *KWin: Window Fullscreen* (piilottaa otsikkopalkit ja paneelit) |
| **`Super + O`** | Ikkunoiden yleisnäkymä (*Overview*) | *KWin: Toggle Overview* (KDE:n oma ikkunakatsaus) |
| **`Super + V`** | Vaihda kelluvan ja laatoitetun tilan välillä | *Polonium: Toggle Window Floating* |
| **`Super + C`** | Keskitä ikkuna ruudulle | KWin: Keskitä ikkuna |
| **`Super + Miinus / Plus`** | Säädä ikkunan/sarakkeen leveyttä | Hiirellä raahaamalla tai KWin-pikanäppäimillä |

---

## 3. Liikkuminen ja kohdistus (Navigointi)

| Pikanäppäin | Niri-toiminto | Polonium / KWin -vastine |
| :--- | :--- | :--- |
| **`Super + Left / Right`** (tai `H / L`) | Kohdista viereiseen ikkunaan vasemmalle/oikealle | *KWin: Walk Through Windows* tai Polonium focus |
| **`Super + Up / Down`** (tai `K / J`) | Älykäs siirto ikkunaan tai ylemmälle/alemmalle työtilalle | *KWin: Switch to Desktop Above/Below* |
| **`Super + 1 ... 9`** | Siirry suoraan työtilaan 1–9 | *KWin: Switch to Desktop 1–9* |
| **`Super + Shift + Left / Right`** | Siirrä kohdistus toiselle näytölle | *KWin: Switch to Next Screen* (Kahden näytön hyppy) |

---

## 4. Ikkunoiden ja työtilojen siirtäminen

| Pikanäppäin | Niri-toiminto | Polonium / KWin -vastine |
| :--- | :--- | :--- |
| **`Super + Ctrl + Left / Right`** | Siirrä ikkuna vasemmalle/oikealle | *Polonium: Move window left/right* |
| **`Super + Ctrl + Up / Down`** | Siirrä ikkuna ylemmälle/alemmalle työtilalle | *KWin: Window to Desktop Above/Below* |
| **`Super + Ctrl + 1 ... 9`** | Siirrä ikkuna suoraan työtilaan 1–9 | *KWin: Window to Desktop 1–9* |
| **`Super + Shift + Ctrl + Left / Right`** | Siirrä ikkuna toiselle näytölle | *KWin: Window to Next Screen* (Heittää ikkunan toiselle näytölle) |

---

## 5. Miten nämä otetaan tarvittaessa käyttöön Plasmassa?

Jos haluat myöhemmin ottaa näitä käyttöön:
1. Avaa **Järjestelmäasetukset (System Settings)**.
2. Siirry kohtaan **Pikanäppäimet (Shortcuts)** → **KWin**.
3. Etsi haluamasi toiminto (esim. *Window Close*) ja paina näppäinyhdistelmää (esim. `Super + Q`).
