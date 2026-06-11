---
type: cost-audit-report
status: active
created: 2026-06-11
updated: 2026-06-11
owner_profile: memory
owner_name: 제리에
vault: Serie's Library of Grimoires
tags:
  - system
  - hermes
  - token-budget
  - no-agent
  - audit
summary: Hermes/Obsidian 자동화가 OpenAI/API 토큰을 낭비하지 않는지 점검한 no-agent 비용 감사 리포트.
---
# OpenAI Token Budget Audit

갱신: `2026-06-11T17:18:40+0900`

## 제리에 판정

현재 제리에 소유 Obsidian 자동화의 기본 구조는 **OpenAI API 토큰을 거의 쓰지 않도록 설계되어 있다.**

- 이 감사 스크립트 자체: no-agent, LLM 호출 없음
- 제리에 Serie's Library of Grimoires 서재 동기화: no-agent deterministic
- 제리에 Grimoire Kanban 갱신: no-agent deterministic
- 제리에 조사목록 분류: no-agent deterministic
- 페른 운영 브리핑: Hermes/GPT/OpenAI가 아니라 local Ollama 사용. 입력 fingerprint가 같으면 재생성하지 않음.

## 스캔 요약

- 스캔 파일 수: 45
- cloud/API 실행 위험 후보 수: 0
- local Ollama 사용 스크립트 수: 3
- no-agent/무토큰 안전 표식 수: 6
- 정책/문서상 GPT·Codex 언급 수: 37

## Cloud/API 실행 위험 후보

- 없음

해석:

- 후보는 문자열 기반 탐지다. 문서에 `GPT`, `Codex`, `OpenAI`라는 말이 있어도 실제 호출은 아닐 수 있다.
- 실제 토큰 지출 여부는 `no_agent` cron 여부와 스크립트 내부 호출을 함께 봐야 한다.

## Local Ollama 사용 후보

- `.hermes/profiles/memory/scripts/fern_local_library_supervisor.py` — hermes_agent_call, cloud_provider_hint, local_ollama, no_agent_marker
- `.hermes/profiles/memory/scripts/obsidian_grimoire_kanban.py` — openai_api_call, hermes_agent_call, cloud_provider_hint, local_ollama, no_agent_marker
- `.hermes/profiles/memory/scripts/openai_token_budget_audit.py` — openai_api_call, hermes_agent_call, cloud_provider_hint, local_ollama, no_agent_marker

## no-agent / 무토큰 안전 표식

- `.hermes/profiles/memory/scripts/fern_local_library_supervisor.py` — hermes_agent_call, cloud_provider_hint, local_ollama, no_agent_marker
- `.hermes/profiles/memory/scripts/nightly_research_queue.py` — no_agent_marker
- `.hermes/profiles/memory/scripts/obsidian_grimoire_kanban.py` — openai_api_call, hermes_agent_call, cloud_provider_hint, local_ollama, no_agent_marker
- `.hermes/profiles/memory/scripts/openai_token_budget_audit.py` — openai_api_call, hermes_agent_call, cloud_provider_hint, local_ollama, no_agent_marker
- `.hermes/profiles/memory/scripts/sync_profile_libraries_to_link.py` — no_agent_marker
- `docs/COMFYUI_LLM_RESOURCE_RULES.md` — hermes_agent_call, cloud_provider_hint, local_ollama, no_agent_marker

## 비용 절약 규칙

1. 반복 자동화는 기본적으로 `no_agent=True`와 deterministic script를 사용한다.
2. 요약이 꼭 필요할 때만 local Ollama HTTP를 직접 호출한다.
3. local LLM은 작은 모델을 먼저 사용한다.
4. 입력 fingerprint가 같으면 LLM을 다시 부르지 않는다.
5. Telegram 알림은 기본적으로 보내지 않고 Serie's Library of Grimoires vault에만 저장한다.
6. Codex, Hermes chat, OpenAI/OpenRouter/Gemini 호출은 자동화에서 금지한다.
7. GPT-5.5/Codex는 힘멜이 명시 승인한 설계·검토·실행 범위에서만 쓴다.

## Policy references / 실행 아님

- `configs/CODEX_L3_APPROVAL_TEMPLATE.yaml` — hermes_agent_call
- `configs/CODEX_PROMPT_TEMPLATE.md` — hermes_agent_call
- `configs/MINI_SELF_EVALUATION_PROMPT.md` — hermes_agent_call, cloud_provider_hint
- `configs/PROJECT_AUDIT_TEMPLATE.md` — hermes_agent_call
- `configs/anythingllm-api-bridge.yaml` — hermes_agent_call, cloud_provider_hint
- `configs/anythingllm-local-policy.yaml` — hermes_agent_call, local_ollama
- `configs/codex-bridge-policy.md` — hermes_agent_call, cloud_provider_hint
- `configs/codex-file-collaboration-priority.yaml` — hermes_agent_call, cloud_provider_hint
- `configs/codex-knowledge-bridge.md` — hermes_agent_call, cloud_provider_hint, local_ollama
- `configs/finance/CODEX_FINANCE_ANALYZER_PROMPT_TEMPLATE.md` — hermes_agent_call
- `configs/frieren-specialist-routing.yaml` — hermes_agent_call
- `configs/friren-coding-authority.yaml` — hermes_agent_call, cloud_provider_hint
- `configs/hermes-desktop-pet-archive-retention.yaml` — hermes_agent_call
- `configs/hermes-operating-policy.md` — hermes_agent_call, cloud_provider_hint, local_ollama
- `configs/hermes-safe-commands.md` — hermes_agent_call, cloud_provider_hint, local_ollama
- `configs/hermes_codex_policy.yaml` — hermes_agent_call, cloud_provider_hint
- `configs/model-routing.yaml` — hermes_agent_call, cloud_provider_hint, local_ollama
- `configs/multi-agent-registry.yaml` — hermes_agent_call, cloud_provider_hint
- `configs/persona-role-map.yaml` — hermes_agent_call, cloud_provider_hint, local_ollama
- `configs/profile-local-model-routing.yaml` — hermes_agent_call, cloud_provider_hint, local_ollama
- ...외 17개

해석:

- 이 항목들은 대부분 정책·권한·금지선 문서의 GPT/Codex 언급이다.
- 자동 실행 위험이 아니라, 오히려 비용/권한을 막기 위한 규칙일 수 있다.

## 다음 재검토

- 다음 재검토일: `2026-06-23`
- 조건: 그때까지 cloud/API 실행 위험 후보가 계속 0건이면 일일 실행을 주간 실행으로 낮추거나 폐기 후보로 내린다.
- 보존 기준: 새 `no_agent=False` cron, `hermes chat`, `delegate_task`, `codex`, `OpenAI(` 같은 실행 위험 신호가 생길 때만 일일 감시 가치가 있다.

## 다음 감시 대상

- 새 cron이 `no_agent=False`로 등록되는지
- script 안에서 `hermes chat`, `delegate_task`, `codex`, `OpenAI(` 호출이 생기는지
- local LLM 작업이 너무 큰 모델이나 너무 긴 prompt로 바뀌는지
- 같은 입력인데 매일 LLM을 반복 호출하는지
