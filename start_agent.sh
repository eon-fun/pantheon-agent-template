# Start services with override
docker-compose -f docker-compose.yaml up -d --build
echo "Waiting for services to start..."
sleep 10

# Check services
echo "Checking services status:"
docker-compose ps
echo -e "\nTo view logs: docker-compose logs -f"
echo "To stop: docker-compose down"


# install agent locally
pip install -e .

# start agent
serve run entrypoint:app