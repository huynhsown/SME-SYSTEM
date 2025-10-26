#!/bin/bash

services=(
  "api-gateway"
  "notification-service"
  "auth-service"
  "feed-service"
  "react-service"
  "post-service"
  "user-service"
  "relationship-service"
  "liveness-service"
)

for s in "${services[@]}"; do
  echo "Opening terminal for $s..."
  gnome-terminal --title="$s" -- bash -c "cd '$s' && echo 'Running $s...' && npm run start:dev; exec bash"
done
