echo "Criando as imagens....."

docker build -t  developerrio/projeto-backend:1.0 backend/.
docker build -t  developerrio/projeto-database:1.0 databse/.

echo "Realizando o push das imagens "

docker push developerrio/projeto-backend:1.0
docker push developerrio/projeto-databse:1.0

echo "Criando serviços no cluster kubernetes"

kubctl apply -f ./services.yml 


echo "Criando os deployments"

kubectl apply -f ./deployment.yml 

 


