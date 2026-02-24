# Porkbun for Pragmatists

**Agent Skills for effortless domain management**

> *"I know a LOT more than the next guy about web tech. I could certainly get it done. I'd rather dedicate cognitive energy to something else!"*

A collection of [Agent Skills](https://agentskills.io) for managing Porkbun domains via AI assistants. Built for developers who *can* manage DNS manually but prefer not to.

## Installation

### Claude Code

```bash
# Add the marketplace
/plugin marketplace add CobraChickenAI/agentskills-porkbun

# Then install
/plugin install porkbun-skills@cobrachickenai-agentskills-porkbun
```

### Claude.ai

Upload the skill folders from `skills/` to your Claude.ai workspace, or reference this repository directly.

### Manual / Other Agents

Copy the `skills/` folder into your project's `.github/skills/` or equivalent skills directory.

## Quick Start

1. **Get API Keys** at [porkbun.com/account/api](https://porkbun.com/account/api)
2. **Run Setup**: Ask your agent *"Set up my Porkbun credentials"*
3. **Manage Domains**: Ask *"List my domains"* or *"Point my-domain.com to Vercel"*

## Skills Included

| Skill | Description |
|-------|-------------|
| **[porkbun-setup](skills/porkbun-setup/SKILL.md)** | 🔐 Secure credential configuration |
| **[porkbun-domains](skills/porkbun-domains/SKILL.md)** | 📋 Domain inventory and status reports |
| **[porkbun-dns](skills/porkbun-dns/SKILL.md)** | 🌐 DNS record management with safety rails |
| **[porkbun-ssl](skills/porkbun-ssl/SKILL.md)** | 🔒 Free SSL certificate management |
| **[porkbun-forwards](skills/porkbun-forwards/SKILL.md)** | ↩️ URL redirection |
| **[porkbun-hosting-blueprints](skills/porkbun-hosting-blueprints/SKILL.md)** | 🏗️ One-click DNS for Vercel, Netlify, Cloudflare, etc. |

## Security

Credentials are stored locally in `~/.porkbun/credentials.json` with strict file permissions (`600`). Keys are transmitted only to the official Porkbun API.

## License

MIT -- see [LICENSE](../LICENSE)

---

*Built by [Cobra Chicken AI](https://github.com/CobraChickenAI)*
