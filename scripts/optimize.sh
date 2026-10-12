#!/usr/bin/env bash
# ==============================================================================
# ⚡ KDE Plasma -optimointiskripti (Minimal & Fast)
# ==============================================================================
set -euo pipefail

echo ":: Käynnistetään KDE Plasma -optimoinnit..."

# 1. Kytketään Baloo-tiedostoindeksointi pois (säästää CPU:ta ja levyn I/O:ta)
echo " -> Kytketään Baloo-tiedostohaku pois päältä..."
mkdir -p "$HOME/.config"
if command -v balooctl6 &>/dev/null; then
    balooctl6 disable 2>/dev/null || true
elif command -v balooctl &>/dev/null; then
    balooctl disable 2>/dev/null || true
fi

cat << 'EOF' > "$HOME/.config/baloofilerc"
[Basic Settings]
Indexing-Enabled=false
EOF

# 2. Säädetään animaatioiden nopeutta nopeammaksi ja sulavammaksi
# AnimationDurationFactor: 0.5 = 2x nopeammat animaatiot, 0 = välittömät
if command -v kwriteconfig6 &>/dev/null; then
    echo " -> Asetetaan käyttöliittymän animaatiot nopeammiksi (2x)..."
    kwriteconfig6 --file kdeglobals --group KDE --key AnimationDurationFactor 0.5
fi

# 3. Määritetään oletusfontit jos kwriteconfig6 on saatavilla
if command -v kwriteconfig6 &>/dev/null; then
    echo " -> Konfiguroidaan Noto Sans ja Geist Mono oletusfonteiksi..."
    kwriteconfig6 --file kdeglobals --group General --key font "Noto Sans,10,-1,5,50,0,0,0,0,0"
    kwriteconfig6 --file kdeglobals --group General --key fixed "GeistMono Nerd Font,10,-1,5,50,0,0,0,0,0"
fi

echo ":: Optimoinnit suoritettu onnistuneesti!"
