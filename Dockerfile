FROM harbor.dev.pntheon.ai/docker/agents:base-agent-v0.1.3

COPY ./docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
