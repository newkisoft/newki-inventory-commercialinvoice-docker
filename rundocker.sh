sudo docker stop $(sudo docker ps -aq -f name=inventory-commercialinvoice)
sudo docker rm $(sudo docker ps -aq -f name=inventory-commercialinvoice) 
#sudo docker rmi newki/inventory-commercialinvoice:1.1 
sudo docker run --name inventory-commercialinvoice --network host -i -d newki/inventory-features:1.1 
sudo docker exec -w / inventory-commercialinvoice git clone https://github.com/newkisoft/newki-inventory-commercialinvoice-publish.git
sudo docker exec -d -w /newki-inventory-commercialinvoice-publish/ inventory-commercialinvoice cp appsettings.live.json appsettings.json
sudo docker exec -d -w /newki-inventory-commercialinvoice-publish/ inventory-commercialinvoice dotnet newki-inventory-commercialinvoice.dll 


