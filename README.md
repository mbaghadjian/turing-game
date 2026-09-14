# The Turing Game

One chat. A Judge, a human Player, and an AI Player that reads the human's live draft and mimics them. 90 seconds, then the Judge picks the machine.

## Run locally

```bash
python3 -m pip install --user anthropic fastapi "uvicorn[standard]"
cp .env.example .env   # then put your key in it
python3 server.py
```

Open http://localhost:8000 (or your LAN IP for friends on the same Wi-Fi).

## Deploy (Fly)

- **Automatic:** every push to `main` deploys via GitHub Actions. One-time setup: add a Fly deploy token as the repo secret `FLY_API_TOKEN`, and set the app secrets on Fly:
  `flyctl secrets set ANTHROPIC_API_KEY=... ANTHROPIC_WORKSPACE_ID=... -a turing-game-c6f0`
- **Manual:** `./deploy.sh`

## Env vars

| Var | Default | Meaning |
|---|---|---|
| `ANTHROPIC_API_KEY` | — | required |
| `ANTHROPIC_WORKSPACE_ID` | — | needed if the key isn't workspace-scoped |
| `TURING_MODEL` | `claude-haiku-4-5` | `claude-sonnet-5` recommended |
| `TURING_SECONDS` | `90` | game length |
| `TURING_NEVER_NAME` | `john` | judge names the bot must never say or nudge |
| `MOCK_AI` | — | `1` = canned replies, no API calls |

Transcripts of finished games land in `games/`.
