#!/bin/sh

wget http://www.correo.com.uy/correoCert/CorreoUruguayoRootCA.crt
wget http://www.correo.com.uy/correoCert/CorreoUruguayoCA.crt

certificateName1="Correo Uruguayo - CA"
certificateFile1="CorreoUruguayoCA.crt"
certificateName2="Correo Uruguayo - Root CA"
certificateFile2="CorreoUruguayoRootCA.crt"

    for certDB in $(find  ~/.mozilla* -name "cert8.db")
    do
        certDir=$(dirname ${certDB});
        certutil -A -n "${certificateName1}" -t "TC,Cw,Tw" -i ${certificateFile1} -d ${certDir}
        certutil -A -n "${certificateName2}" -t "TC,Cw,Tw" -i ${certificateFile2} -d ${certDir}
	# Crhome
        certutil -d sql:$HOME/.pki/nssdb -A -t "TC,Cw,Tw" -n "${certificateName1}" -i ${certificateFile1}
        certutil -d sql:$HOME/.pki/nssdb -A -t "TC,Cw,Tw" -n "${certificateName2}" -i ${certificateFile2}
    done
