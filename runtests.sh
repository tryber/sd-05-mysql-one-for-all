if MYSQL_USER=root MYSQL_PASSWORD=ruth941 HOSTNAME=localhost npm test ; then
    echo "A testagem terminou sem erros."
else
    echo "Testagem falhou. Restaurando banco de dados.";
    echo "Caso requisitado, digite sua senha do servidor local.";
    mysql -u root -p < SpotifyClone.sql
fi
