from pantheon_sdk.agents.const import EntrypointGroup
from pantheon_sdk.agents.utils import get_entrypoint

app = get_entrypoint(EntrypointGroup.AGENT_ENTRYPOINT).load()
