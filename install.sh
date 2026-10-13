#!/usr/bin/env bash
# ==============================================================================
# 🚀 CachyOS KDE Plasma Minimal Installer
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=========================================================="
echo "  CachyOS Minimal KDE Plasma Setup (Dual Monitor)"
echo "=========================================================="

# 1. Tarkistetaan paketinhallinta (paru tai pacman)
if command -v paru &>/dev/null; then
    AUR_HELPER="paru"
elif command -v yay &>/dev/null; then
    AUR_HELPER="yay"
else
    AUR_HELPER="sudo pacman"
fi
echo ":: Käytetään paketinhallintaa: $AUR_HELPER"

# 2. Kerätään kaikki paketit packages/ -kansiosta
echo ":: Luetaan pakettilistat..."
PACKAGES=()

for pkg_file in "$SCRIPT_DIR"/packages/*.txt; do
    if [ -f "$pkg_file" ]; then
        echo " -> Luetaan: $(basename "$pkg_file")"
        while IFS= read -r line || [ -n "$line" ]; do
            # Poistetaan kommentit ja tyhjät merkit
            clean_line="$(echo "$line" | sed -e 's/#.*$//' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
            if [ -n "$clean_line" ]; then
                PACKAGES+=("$clean_line")
            fi
        done < "$pkg_file"
    fi
done

echo ":: Asennettavia paketteja yhteensä: ${#PACKAGES[@]}"

# 3. Asennetaan paketit
echo ":: Asennetaan valitut paketit..."
$AUR_HELPER -S --needed "${PACKAGES[@]}"

# 4. Asennetaan Claude Code CLI npm:n kautta
if command -v npm &>/dev/null; then
    echo ":: Asennetaan Claude Code CLI (@anthropic-ai/claude-code)..."
    sudo npm install -g @anthropic-ai/claude-code || true
fi

# 5. Otetaan käyttöön järjestelmäpalvelut
echo ":: Aktivoidaan järjestelmäpalvelut (SDDM & Bluetooth)..."
sudo systemctl enable sddm.service || true
sudo systemctl enable --now bluetooth.service || true

# 6. Lisätään käyttäjä gamemode-ryhmään (vaaditaan renice-priorisointiin ilman salasanaa)
if getent group gamemode >/dev/null 2>&1; then
    echo ":: Lisätään käyttäjä $USER gamemode-ryhmään..."
    sudo usermod -aG gamemode "$USER" || true
fi

# 7. Konfiguroidaan SilentSDDM -teema jos asennettu
if [ -d "/usr/share/sddm/themes/silent" ]; then
    echo ":: Aktivoidaan SilentSDDM -kirjautumisteema..."
    sudo mkdir -p /etc/sddm.conf.d
    sudo tee /etc/sddm.conf.d/silent.conf > /dev/null << 'EOF'
[General]
InputMethod=qtvirtualkeyboard
GreeterEnvironment=QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard

[Theme]
Current=silent
EOF
    # Valitaan Catppuccin Mocha -presetti jos saatavilla (sopii Ghosttyyn)
    if [ -f "/usr/share/sddm/themes/silent/configs/catppuccin-mocha.conf" ]; then
        sudo cp -f /usr/share/sddm/themes/silent/configs/catppuccin-mocha.conf /usr/share/sddm/themes/silent/theme.conf 2>/dev/null || true
    fi
fi

# 8. Kopioidaan konfiguraatiotiedostot (.config/ ja .zshrc)
if [ -d "$SCRIPT_DIR/.config" ]; then
    echo ":: Kopioidaan asetustiedostot (~/.config)..."
    mkdir -p "$HOME/.config"
    cp -rn "$SCRIPT_DIR/.config/"* "$HOME/.config/" || true
fi

if [ -f "$SCRIPT_DIR/.zshrc" ]; then
    echo ":: Asennetaan ~/.zshrc..."
    cp -n "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc" || true
fi

# 9. Asetetaan Zsh oletuskomentotulkiksi
ZSH_PATH="$(command -v zsh || echo "/usr/bin/zsh")"
if [ "$SHELL" != "$ZSH_PATH" ]; then
    echo ":: Asetetaan Zsh oletuskomentotulkiksi ($ZSH_PATH)..."
    chsh -s "$ZSH_PATH" "$USER" 2>/dev/null || sudo chsh -s "$ZSH_PATH" "$USER" || true
fi

# 10. Suoritetaan työpöydän optimoinnit
if [ -f "$SCRIPT_DIR/scripts/optimize.sh" ]; then
    bash "$SCRIPT_DIR/scripts/optimize.sh"
fi

echo "=========================================================="
echo "🎉 Asennus ja konfigurointi on valmis!"
echo "   Voit käynnistää koneen uudelleen (sudo reboot)."
echo "=========================================================="
