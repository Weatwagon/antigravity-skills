# ⚡ Google AntiGravity Skills

[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey.svg)](#-installation)
[![Antigravity](https://img.shields.io/badge/Antigravity-2.0%20%7C%20CLI-brightgreen.svg)](https://antigravity.google)

**The official public catalog and landing page for elite skills, security guardians, and autonomous engineering workflows for Google AntiGravity.**

---

## 🧰 Available Skills Catalog

Each skill in this catalog is maintained as an independent, modular repository and integrated here as a Git submodule:

| Skill | Repository | Description | Quick Trigger |
| :--- | :--- | :--- | :--- |
| 🛡️ **Approve for Me** | [Weatwagon/antigravity-approve-for-me](https://github.com/Weatwagon/antigravity-approve-for-me) | OpenAI Codex / ChatGPT Desktop parity auto-review guardian. Auto-approves routine workspace commands with zero clicks while blocking destructive actions. | `guardian status`<br>`guardian mode approve-for-me` |
| 🔁 **Review Loop** | [Weatwagon/antigravity-review-loop](https://github.com/Weatwagon/antigravity-review-loop) | Two-tier autonomous gated engineering workflow: Plan &rarr; Gate 1: Cranky PM (1–10) &rarr; Implement &rarr; Gate 2: Senior Staff Dev & QA Review (0–100%). | `/review-loop`<br>`start /reviewLoop` |
| ✂️ **Ponytail** *(Optional Companion)* | [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) | The acclaimed minimalist engine by Dietrich Gebert: standard library first, native platform features, and zero speculative scaffolding. | `/ponytail`<br>`/ponytail-audit` |

---

## 🚀 1-Click Suite Installation (Windows)

Clone this repository with all skills:

```powershell
git clone --recurse-submodules https://github.com/Weatwagon/antigravity-skills.git
cd antigravity-skills
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

*(Note: Even if you clone without `--recurse-submodules`, `install.ps1` features self-healing detection that automatically pulls submodules for you.)*

---

## 🛠️ Individual Skill Repositories

If you only want a single skill instead of the full suite, you can install and use them independently:

1. **[antigravity-approve-for-me](https://github.com/Weatwagon/antigravity-approve-for-me)**:
   ```powershell
   git clone https://github.com/Weatwagon/antigravity-approve-for-me.git
   cd antigravity-approve-for-me
   powershell -ExecutionPolicy Bypass -File .\install.ps1
   ```

2. **[antigravity-review-loop](https://github.com/Weatwagon/antigravity-review-loop)**:
   ```powershell
   git clone https://github.com/Weatwagon/antigravity-review-loop.git
   cd antigravity-review-loop
   powershell -ExecutionPolicy Bypass -File .\install.ps1
   ```

---

## 📄 License & Attribution

- Suite and Approve for Me are licensed under [Apache License, Version 2.0](LICENSE).
- Review Loop is licensed under [MIT License](https://github.com/Weatwagon/antigravity-review-loop/blob/main/LICENSE).
- Ponytail anti-bloat audits are created by and adapted from [Dietrich Gebert's Ponytail](https://github.com/DietrichGebert/ponytail).
