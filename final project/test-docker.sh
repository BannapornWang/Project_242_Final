#!/bin/bash
# =============================================================================
# test-docker.sh — Docker Evidence Collection Script
# Run this script to generate txt files proving the Docker setup is correct.
# =============================================================================

echo "=== STARTING DOCKER EVIDENCE COLLECTION ==="
mkdir -p evidence

echo "1. Capturing docker-compose ps (Container Status)..."
docker-compose ps > evidence/docker-ps.txt
echo "   -> Saved to evidence/docker-ps.txt"

echo "2. Capturing docker stats (Memory/CPU)..."
docker stats --no-stream > evidence/docker-stats.txt
echo "   -> Saved to evidence/docker-stats.txt"

echo "3. Capturing Keyspaces in Cassandra..."
docker exec cassandra-node cqlsh -e "DESCRIBE KEYSPACES;" > evidence/docker-keyspaces.txt
echo "   -> Saved to evidence/docker-keyspaces.txt"

echo "4. Capturing Products Table Schema..."
docker exec cassandra-node cqlsh -e "DESCRIBE TABLE trading_card_shop.products;" > evidence/docker-table.txt
echo "   -> Saved to evidence/docker-table.txt"

echo "5. Capturing Network Configuration..."
# Resolve the network name (often prefixed by the folder name in compose)
NETWORK_NAME=$(docker network ls | grep tcg-network | awk '{print $2}')
if [ -z "$NETWORK_NAME" ]; then
    NETWORK_NAME="final-project_tcg-network" # Default fallback
fi
docker network inspect $NETWORK_NAME > evidence/docker-network.txt
echo "   -> Saved to evidence/docker-network.txt"

echo ""
echo "=== DOCKER EVIDENCE COLLECTION COMPLETE ==="
echo "Check the /evidence directory for your files."
