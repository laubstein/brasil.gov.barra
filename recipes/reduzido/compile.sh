#!/bin/sh
echo ""
profile='all'

if [ -n "$1" ]
then
    profile=$1
fi

case $profile in
  "all")
      assetgen --clean ./barra-footer-brasil-1.yaml
      assetgen ./barra-footer-brasil-1.yaml
      assetgen ./barra-footer-brasil-publicar.yaml
      ;;
  "barra")
      assetgen --clean ./barra-brasil-1.yaml
      assetgen ./barra-brasil-1.yaml
      assetgen ./barra-brasil-publicar.yaml
      ;;
  "footer")
      assetgen --clean ./footer-brasil-1.yaml
      assetgen ./footer-brasil-1.yaml
      assetgen ./footer-brasil-publicar.yaml
      ;;
esac
