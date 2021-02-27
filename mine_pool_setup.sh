#!/bin/sh
#./minerd -a sha256d -o stratum+tcp://51.81.86.5:3008 -u QUZhy18v8G9HYtBA7kwXvFKVhS4AgnWHL -p anything
echo "Bienvenido al configurador del minado de Costa Rica Digital Coin\n\nRequisitos:\n1) Dirección de billetera de COCO (puedes obtenerla al registrase en https://wallet.costaricadigitalcoin.com)\n\nPor favor ingrese la dirección de su billetera para recibir los COCO minados"
read wallet
if [ ${#wallet} -gt 34 ]
then
   echo "Direccion incorrecta"
   exit
elif [ ${#wallet} -lt 34 ]
then
   echo "Direccion incorrecta"
   exit
else
   echo "Direccion correcta"
fi
touch mine_pool.sh
echo "#!/bin/sh\n./cpuminer -a X11 -o stratum+tcp://costaricadigitalcoin.com:3008 -u $wallet -p anything" > mine_pool.sh
chmod +x mine_pool.sh
wget "https://www.costaricadigitalcoin.com/wp-content/uploads/2020/12/cpuminer-linux.tar.gz"
tar -xvzf "cpuminer-linux.tar.gz"
rm "cpuminer-linux.tar.gz"
echo "Billetera configurada correctamente\n\nNota: se ejecutará el archivo mine_pool.sh (ejecutar este archivo para futuros minados)\n\nEl minado empezara en este momento"
./mine_pool.sh
