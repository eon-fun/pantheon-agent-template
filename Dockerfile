FROM harbor.dev.pntheon.ai/docker/agents:v0.0.6

COPY ./docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod +x ./docker-entrypoint.sh

COPY pyproject.toml README.md entrypoint.py /serve_app/
COPY src/ /serve_app/src/

ENTRYPOINT ["./docker-entrypoint.sh"]
