#!/usr/bin/env bash

case "$1" in
    dev)
        host="localhost"
        port="8080"
        ;;
    stage)
        host="stage.example.com"
        port="8081"
        ;;
    prod)
        host="prod.example.com"
        port="80"
        ;;
    *)
        echo "Użycie: $0 {dev|stage|prod}"
        exit 1
        ;;
esac

cat > app.env <<EOF
HOST=$host
PORT=$port
EOF

cat > start.sh <<'EOF'
#!/usr/bin/env bash

echo "Pierwszy argument: $1"
echo "Zmienna: ${ZMIENNA}"
EOF
chmod +x start.sh
echo "Utworzono app.env i start.sh"
