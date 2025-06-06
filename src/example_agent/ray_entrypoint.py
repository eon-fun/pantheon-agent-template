from contextlib import asynccontextmanager
from typing import Any, Optional

from fastapi import FastAPI
from pantheon_sdk.agents.bootstrap import bootstrap_main
from pantheon_sdk.agents.config import get_agent_config
from pantheon_sdk.agents.models import Workflow
from pantheon_sdk.agents.ray_entrypoint import BaseAgent
from ray import serve
from ray.serve.deployment import Application


@asynccontextmanager
async def lifespan(app: FastAPI):
    # launch some tasks on app start
    yield
    # handle clean up


app = FastAPI(lifespan=lifespan)


@serve.deployment
class SubAgent:
    """Ray serve deployment agent.

    This agent is a part of ray serve application, but it is not exposed for communication with the outside agents.
    We can use it to execute some tools or a custom logic to enable ray scaling capabilities.
    The `__call__` method in this class suggests that it could also just be a function instead.
    """

    def __call__(self, *args, **kwds):
        pass


class ExampleAgent(BaseAgent):
    @app.post("/{goal}")
    async def handle(self, goal: str, plan: Optional[Workflow] = None, context: Any = None):
        return await super().handle(goal, plan, context)


def get_example_agent(args: dict) -> Application:
    return bootstrap_main(ExampleAgent).bind(config=get_agent_config(**args))


if __name__ == "__main__":
    serve.run(get_example_agent({}), route_prefix="/")
