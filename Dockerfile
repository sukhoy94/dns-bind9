FROM ubuntu/bind9

# Ustawienie konfiguracji bind9
COPY bind9-config/named.conf.local /etc/bind/
COPY bind9-config/db.local /etc/bind/

# Jeśli potrzebujesz skryptu entrypoint:
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Otwarcie portu DNS (choć prawdopodobnie obraz ubuntu/bind9 już je otwiera, ale warto mieć pewność)
EXPOSE 53/udp
EXPOSE 53/tcp
