from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import json, re, os

# ---------- Load case file ----------
CASE_PATH = os.path.join(os.path.dirname(__file__), "cases", "school_lab_heist.json")
with open(CASE_PATH, "r", encoding="utf-8") as f:
    CASE = json.load(f)

# ---------- App ----------
app = FastAPI(title="Detective Classroom Chat API")
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class AskPayload(BaseModel):
    teamId: str
    characterId: str
    message: str

def norm(s):
    return re.sub(r"[^a-z0-9]+", " ", (s or "").lower()).strip()

def retrieve(character_id: str, question: str):
    kb = CASE["knowledge"].get(character_id, [])
    q_words = set(w for w in norm(question).split() if len(w) >= 4)
    hits = []
    for item in kb:
        words = set(w for w in norm(item["text"]).split() if len(w) >= 4)
        if q_words & words:
            hits.append(item)
    return hits[:2]

def discover_clues(question: str):
    q = norm(question)
    found = []
    for c in CASE["clues"]:
        text = norm(f"{c.get('title','')} {c.get('text','')} {' '.join(c.get('tags',[]))}")
        tags = c.get("tags", [])
        tag_hit = any(t in q for t in tags)
        num_hit = any(tok in q for tok in ["2117", "21 17"])
        if tag_hit or num_hit:
            found.append(c["id"])
    uniq = []
    for x in found:
        if x not in uniq: uniq.append(x)
    return uniq

@app.get("/health")
def health():
    return {"ok": True}

@app.get("/case")
def get_case_meta():
    return {
        "title": CASE.get("title", "Case"),
        "characters": CASE["characters"],
        "clues": [{"id": c["id"], "title": c["title"], "tags": c.get("tags", [])} for c in CASE["clues"]],
        "rubric": CASE["solution"]["rubric"]
    }

@app.post("/ask")
def ask(p: AskPayload):
    chars = {c["id"]: c for c in CASE["characters"]}
    char = chars.get(p.characterId)
    if not char:
        return {"answer": "(unknown character)", "citedClues": []}

    hits = retrieve(p.characterId, p.message)
    if hits:
        answer = " ".join(h["text"] for h in hits)
    else:
        scope = ", ".join(char.get("scope", [])) or "my notes"
        answer = f"{char['name']}: I can only speak about {scope}. Could you ask something more specific?"

    if re.search(r"who (did it|is (it|the culprit|the perp))", p.message, re.I):
        answer = f"{char['name']}: I cannot say who is responsible. Please ask about time windows, badge access, or direct observations."

    cited = discover_clues(p.message)
    return {"answer": answer, "citedClues": cited}
