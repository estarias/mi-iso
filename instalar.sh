#mis alias
echo "alias midiff='diff -u -r -N'" >> ~/.bash_aliases

#Impide que se actualice a la siguiente distribucion de ubuntu
sudo sed -i 's/Prompt=lts/Prompt=never/'  /etc/update-manager/release-upgrades

#Desactiva actualizaciones automaticas
gsettings set com.ubuntu.update-notifier no-show-notifications true
sudo sed -i 's/X-GNOME-Autostart-Delay=60/X-GNOME-Autostart-enabled=false/' /etc/xdg/autostart/update-notifier.desktop

#Habilita escritorio con iconos
gsettings set org.gnome.desktop.background show-desktop-icons true

#Muestra pendrive en el escritorio al conectar
gsettings set org.gnome.nautilus.desktop volumes-visible true

#Muestra papelera de reciclaje en el escritorio
gsettings set org.gnome.nautilus.desktop trash-icon-visible true

#Permite ejecutar scripts desde el escritorio
gsettings set org.gnome.nautilus.preferences executable-text-activation ask

#Quita el deposito de claves
rm -fr ~/.local/share/keyrings

sudo apt-get update
sudo apt-get -y install $(cat paquetes.txt)

sudo dpkg -i debs/*.deb
sudo apt-get install -f

#Elimina aplicaciones de ubuntu
sudo apt-get -y remove $(cat removerpaquetes.txt)

#Instalar java
sudo sh instalar-java.sh

# Limpio cache apt
sudo apt-get clean
# Limpio paquetes mal descargados
sudo apt-get autoclean
# Limpio paquetes ya no necesarios
sudo apt-get -y autoremove


